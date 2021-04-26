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
 * Servlet implementation class PwdUpdateServlet
 */
@WebServlet("/pwdUpdate.md")
public class PwdUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PwdUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		String updatePwd = request.getParameter("updatePwd");
		
		User updateUser = new UserService().updatePwdUser(userId, userPwd, updatePwd);
		
		// 조건검사 전 세션 부르기
		HttpSession session = request.getSession();
		if(updateUser == null) { // 비밃번호 변경실패 => 마이페이지 => alert비밀번호 변경 실패했습니다.
			session.setAttribute("alertMsg", "비밀번호 변경 실패했습니다.");
		}else { // 성공 => 마이페이지 => alert비밀번호 변경 성공했습니다.
			session.setAttribute("alertMsg", "성공적으로 비밀번호 변경됐습니다.");
			session.setAttribute("loginUser", updateUser);
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
