package com.dr.member.myDR.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dr.common.model.vo.PageInfo;
import com.dr.member.ht.model.vo.Ht;
import com.dr.member.info.model.vo.Info;
import com.dr.member.myDR.model.service.MyDrService;
import com.dr.member.user.model.vo.User;

/**
 * Servlet implementation class ItBookmarkListServlet
 */
@WebServlet("/itBookmark.md")
public class ItBookmarkListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItBookmarkListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int listCount;		// 현재 총 게시글 갯수
		int currentPage;	// 현재 페이지
		int pageLimit;		// 한 페이지 하단에 보여질 페이징바의 페이지 개수
		int boardLimit;		// 한 페이지 내에 보여질 게시글 최대 갯수
		
		int maxPage;		// 전체 페이지들 중에서의 가장 마지막페이지
		int startPage;		// 현재 페이지에 하단에 보여질 페이징 바의 시작 수
		int endPage;		// 현재 페이지 하단에 보여질 페이징 바의 끝 수
		
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo(); // session에서 loginUser통해서 userNo가져오기
		
		
		// listCount : 총 게시글 갯수 조회해서 담기
		listCount = new MyDrService().selectItBookmarkListCount(userNo);
		
		// currentPage : 현재 요청한 페이지
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		// pageLimit : 한 페이지 하단에 보여질 페이지 최대 개수
		pageLimit = 10;
		
		// boardLimit : 한 페이지 내에 보여질 게시글 최대 개수
		boardLimit = 6;
		
		// 총 페이지 수
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		// 현재 페이지에 보여질 페이징 바의 시작 수
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		// 현재 페이지에 보여질 페이징 바의 끝 수
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		// 현재 요청한 페이지에 보여질 게시글리스트 조회 
		ArrayList<Info> list = new MyDrService().selectItBookmarkList(pi, userNo);
		
		System.out.println(list);
		
		session.setAttribute("postListCount", listCount);
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/member/myDR/itBookmarkListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
