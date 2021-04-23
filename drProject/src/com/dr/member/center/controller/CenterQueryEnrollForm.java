package com.dr.member.center.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dr.member.user.model.vo.User;

/**
 * Servlet implementation class QueryEnrollForm
 */
@WebServlet("/enrollQuery.ct")
public class CenterQueryEnrollForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CenterQueryEnrollForm() {
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
		
		request.getRequestDispatcher("views/member/center/centerQueryEnrollForm.jsp").forward(request, response);
		
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
