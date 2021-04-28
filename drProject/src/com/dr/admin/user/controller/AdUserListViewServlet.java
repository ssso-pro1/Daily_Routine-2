package com.dr.admin.user.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dr.admin.user.model.service.AdUserService;
import com.dr.common.model.vo.PageInfo;
import com.dr.member.user.model.vo.User;

/**
 * Servlet implementation class AdUserListViewServlet
 */
@WebServlet("/userListView.aus")
public class AdUserListViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdUserListViewServlet() {
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
			
		
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		
		int maxPage;
		int startPage;
		int endPage;
		
		listCount = new AdUserService().selectListCount();
		
		//System.out.println(listCount);

		
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		pageLimit = 5; //한페이지 하단에 보여질 페이지 최대 갯수
		
		boardLimit = 10; //한페이지 내에 보여질 게시글 최대 갯수
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit); //총 페이지 수 (마지막 페이지)
		
		startPage = (currentPage -1) / pageLimit * pageLimit + 1 ;
		
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
	
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		System.out.println(pi);
		
		ArrayList<User> list = new AdUserService().selectList(pi);
		/*
		for(int i=0; i<list.size(); i++) {
			System.out.println(list.get(i));
		}
		
		for(User u : list) {
			System.out.println(u); //아직흰페이지 보이고 , 리스트 출력된느지
			
		}
		System.out.println("===================="); //다음단계가기 전 한번 출력해보기 
		*/
		
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/admin/user/adUserListView.jsp").forward(request,response);
	
		
		}else {
			request.getSession().setAttribute("alertMsg", "관리자만 이용 가능한 서비스입니다. 로그인 후 이용 부탁드립니다.");
			response.sendRedirect(request.getContextPath()+"/loginForm.aus");
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
