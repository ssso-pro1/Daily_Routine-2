package com.dr.admin.ht.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dr.admin.ht.model.service.adHTService;
import com.dr.admin.ht.model.vo.adHT;

/**
 * Servlet implementation class adHTDetailServlet
 */
@WebServlet("/detail.aht")
public class adHTDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adHTDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		int htNo = Integer.parseInt(request.getParameter("hno"));
		
		int result = new adHTService().HTIncreaseCount(htNo);
		
		if(result > 0) { // 조회수증가 조회성공
			
			
			adHT t = new adHTService().selectHT(htNo); // 현재글
			
			
			request.setAttribute("t", t);
			
			
			
			request.getRequestDispatcher("views/admin/ht/adHTDetailView.jsp").forward(request, response);
			
			
		} else {
			
			request.setAttribute("errorMsg", "오류가 발생했습니다");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			
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
