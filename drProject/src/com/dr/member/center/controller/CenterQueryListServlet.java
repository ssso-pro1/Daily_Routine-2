package com.dr.member.center.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dr.member.center.model.service.CenterService;
import com.dr.member.center.model.vo.CenterQuery;

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
		
		
		
		//int userNo = Integer.parseInt(request.getParameter("userNo"));
		//로그인 유저가 없으니까 그냥 번호는 2라고 가정 해서 조회해보겠음
		int userNo =2;
		
		ArrayList<CenterQuery>queryList = new CenterService().queryList(userNo);
		
		request.setAttribute("queryList", queryList);
		request.getRequestDispatcher("views/member/center/centerQueryList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
