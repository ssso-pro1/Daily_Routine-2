package com.dr.member.myDR.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dr.member.user.model.service.UserService;

/**
 * Servlet implementation class DleteUserServlet
 */
@WebServlet("/deleteUser.md")
public class DleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DleteUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userPwd = request.getParameter("userPwd");
		String userId = request.getParameter("userId");
		
//		System.out.println(userPwd);
//		System.out.println(userId);
		
		int result = new UserService().deleteUser(userId, userPwd);
		HttpSession session = request.getSession();
//		System.out.println(result);
		if(result > 0) { // 탈퇴성공 => 세션에 담겨있는 loginUser 지워주기
			
			
			session.removeAttribute("loginUser");
			session.setAttribute("alertMsg", "탈퇴되었습니다. 그동안 이용해주셔서 감사합니다.");
			
			request.getRequestDispatcher("index.jsp").forward(request, response);
			
		}else { // 탈퇴실패 => 에러페이지 
			
			session.setAttribute("alertMsg", "회원 탈퇴 실패. 비밀번호를 다시 입력해주세요.");
			request.getRequestDispatcher("views/member/myDR/deleteUser.jsp").forward(request, response);
			
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
