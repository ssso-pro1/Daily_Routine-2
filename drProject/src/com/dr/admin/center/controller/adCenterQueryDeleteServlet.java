package com.dr.admin.center.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dr.admin.center.model.service.adCenterService;

/**
 * Servlet implementation class adCenterQueryDeleteServlet
 */
@WebServlet("/ctQueryDelete.ad")
public class adCenterQueryDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adCenterQueryDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//int queryNo = Integer.parseInt(request.getParameter("qno")); // 글번호 넘긴다
		
		String[] queryNo = request.getParameterValues("qno");
		
		
		
		int result = new adCenterService().deleteQuery(queryNo);
		
		if(result > 0) {
			
			//request.getSession().setAttribute("alertMsg", "문의내역을 삭제하였습니다");
			response.sendRedirect(request.getContextPath()+"/ctQuery.ad?currentPage=1"); 
			
		} else { //실패
			
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
