package com.dr.admin.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dr.admin.user.model.service.AdUserService;

/**
 * Servlet implementation class AdUserDeleteServlet
 */
@WebServlet("/delete.aus")
public class AdUserDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdUserDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId"); //input type hidden 으로 넘긴 값 가져옴
		String userPwd = request.getParameter("userPwd");
		
		int result = new AdUserService().deleteUser(userId, userPwd); 
		
		if(result > 0) { //탈퇴성공 
			
			HttpSession session = request.getSession();
			session.removeAttribute("loginUser"); 
			session.setAttribute("alertMsg", "탈퇴처리되었습니다.");
			
			response.sendRedirect(request.getContextPath());
			
		}else { //탈퇴실패 => 에러페이지
			
			request.setAttribute("errorMsg", "회원 탈퇴 실패");
			
			request.getRequestDispatcher("views/common/adErrorPage.jsp").forward(request, response); 

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
