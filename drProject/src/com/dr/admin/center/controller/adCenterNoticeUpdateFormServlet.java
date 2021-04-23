package com.dr.admin.center.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dr.admin.center.model.service.adCenterService;
import com.dr.admin.center.model.vo.adCenterNotice;
import com.dr.admin.center.model.vo.centerNoticeFile;

/**
 * Servlet implementation class adCenterNoticeUpdateServlet
 */
@WebServlet("/ctNoticeUpdateForm.ad")
public class adCenterNoticeUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adCenterNoticeUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("utf-8");
		int noticeNo = Integer.parseInt(request.getParameter("nno"));
		

		adCenterNotice n = new adCenterService().selectNotice(noticeNo);
		centerNoticeFile fi = new adCenterService().selectAttachment(noticeNo);
		
		request.setAttribute("n", n);
		request.setAttribute("fi", fi);

		request.getRequestDispatcher("views/admin/center/adCenterNoticeUpdateForm.jsp").forward(request, response);
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
