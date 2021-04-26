package com.dr.member.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dr.member.user.model.service.UserService;

/**
 * Servlet implementation class IdCheckAjax
 */
@WebServlet("/idCheck.us")
public class IdCheckAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdCheckAjax() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String checkId = request.getParameter("checkId"); //checkId 로 넘어온 사용자 입력값
		//System.out.println(checkId);
		
		int count = new UserService().idCheck(checkId); //중복체크할 아이디 넘어감
		
		if(count > 0) { // 사용 불가능
			response.getWriter().print("NNNNN");
		}else {  // 사용 가능
			response.getWriter().print("NNNNY");
		} //중복확인 클릭, 개발자 도구 - 콘솔창 확인
		
		
}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
