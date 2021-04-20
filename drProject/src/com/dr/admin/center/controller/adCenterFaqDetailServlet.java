package com.dr.admin.center.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dr.admin.center.model.service.adCenterService;
import com.dr.admin.center.model.vo.adCenterFaq;

/**
 * Servlet implementation class adCenterFaqDetailServlet
 */
@WebServlet("/ctFaqDetail.ad")
public class adCenterFaqDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adCenterFaqDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int faqNo = Integer.parseInt(request.getParameter("fno"));
		
		adCenterFaq f = new adCenterService().selectFaq(faqNo);
		
		request.setAttribute("f", f);
		request.getRequestDispatcher("views/admin/center/adCenterFaqDetail.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
