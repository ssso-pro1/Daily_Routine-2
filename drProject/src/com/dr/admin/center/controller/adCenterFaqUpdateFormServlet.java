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
 * Servlet implementation class adCenterFaqUpdateFormServlet
 */
@WebServlet("/ctFaqUpdateForm.ad")
public class adCenterFaqUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adCenterFaqUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int faqNo = Integer.parseInt(request.getParameter("fno")); // 글번호넘기고
		
		adCenterFaq f = new adCenterService().selectFaq(faqNo);
		// 글번호, 카테고리, 제목, 내용, 작성일, 업데이트일, 게시상태, 작성자아이디
		
		request.setAttribute("f", f);
		request.getRequestDispatcher("views/admin/center/adCenterFaqUpdateForm.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
