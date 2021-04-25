package com.dr.member.myDR.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dr.member.user.model.service.UserService;
import com.dr.member.user.model.vo.User;

/**
 * Servlet implementation class EmailUpdateServlet
 */
@WebServlet("/emailUpdate.md")
public class EmailUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String userId = request.getParameter("userId");
		String updateEmail = request.getParameter("updateEmail") + request.getParameter("emailCategory");
		
		
//		System.out.println(userId);
//		System.out.println(updateEmail);
		
		User updateUser = new UserService().updateEmailUser(userId, updateEmail);
		
		// 조건검사 전 세션
		HttpSession session = request.getSession();
		if(updateUser == null) { // 변경 실패
			session.setAttribute("alertMsg", "이메일 변경 실패");
		}else { // 성공
			session.setAttribute("alertMsg", "성공적으로 이메일이 변경됐습니다.");
			session.setAttribute("loginUser", updateUser); // 새로 조회한거 담아주기
		}
		response.sendRedirect(request.getContextPath() + "/myPage.md");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
