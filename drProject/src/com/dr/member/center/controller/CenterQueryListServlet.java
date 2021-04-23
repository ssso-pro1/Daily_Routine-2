package com.dr.member.center.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dr.common.model.vo.PageInfo;
import com.dr.member.center.model.service.CenterService;
import com.dr.member.center.model.vo.CenterQuery;
import com.dr.member.user.model.vo.User;

/**
 * Servlet implementation class CenterQueryListServlet
 */
@WebServlet("/queryList.ct")
public class CenterQueryListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CenterQueryListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
		
		if(loginUser != null) {
		
		
		
		
		int listCount;		// 현재 총 게시글 갯수
		int currentPage;	// 현재 페이지 (즉, 요청한 페이지)
		int pageLimit;		// 한 페이지 하단에 보여질 페이징바의 페이지 최대갯수 (몇개단위)
		int boardLimit;		// 한 페이지 내에 보여질 게시글 최대 갯수 (몇개단위)
				
		int maxPage; 		// 전체페이지들 중에서의 가장 마지막페이지 (listCount, boardLimit를 가지고 구할꺼임)
		int startPage;		// 현재 페이지에 하단에 보여질 페이징 바의 시작수 (currentPage, pageLimit를 가지고 구할꺼임)
		int endPage;		// 현재 페이지에 하단에 보여질 페이징 바의 끝 수 (startPage, pageLimit, maxPage를 가지고 구할꺼임)
				
		
		int userNo = loginUser.getUserNo();
		
		listCount = new CenterService().querySelectListCount(userNo);
				
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
				
		pageLimit = 10;
				
		boardLimit = 10;
				
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
				
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
				
		endPage = startPage + pageLimit - 1;
				
		if(endPage > maxPage) {
			endPage = maxPage;
		}
				
		
		// 1. 페이징바 만들때 필요한 PageInfo객체
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		// 2. 현재 요청한 페이지(currentPage)에 보여질 게시글 리스트 조회해오기
		ArrayList<CenterQuery> list = new CenterService().querySelectList(pi, userNo);
		
		
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		//ArrayList<CenterQuery>queryList = new CenterService().queryList(userNo);
		//request.setAttribute("queryList", queryList);
		request.getRequestDispatcher("views/member/center/centerQueryList.jsp").forward(request, response);
		
		
		} else {
			
			request.getSession().setAttribute("alertMsg", "로그인이 필요한 페이지입니다");
			response.sendRedirect(request.getContextPath()+"/loginForm.us");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
