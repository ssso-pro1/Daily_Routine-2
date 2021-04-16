package com.dr.member.center.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dr.member.center.model.service.CenterService;

/**
 * Servlet implementation class CenterQueryInsertServlet
 */
@WebServlet("/insertQuery.ct")
public class CenterQueryInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CenterQueryInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String qCategory = request.getParameter("qCategory");
		String qTitle = request.getParameter("qtitle");
		String qContent = request.getParameter("qContent");
		
		HttpSession session = request.getSession();
		//User loginUser = (User)session.getAttribute("loginUser");
		//int userNo = loginUser.getUserNo();
		
		//User u = new User();
		//u.setNoticeContent(qContent);
		//u.setNoticeWriter(String.valueOf(userNo)); // 1 => "1"
		
		//int result = new CenterService().inserQuery(n);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
