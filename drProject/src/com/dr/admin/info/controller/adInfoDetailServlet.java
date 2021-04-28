package com.dr.admin.info.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dr.admin.info.model.service.adInfoService;
import com.dr.admin.info.model.vo.adInfo;
import com.dr.admin.info.model.vo.adInfoFile;


/**
 * Servlet implementation class adInfoDetailServlet
 */
@WebServlet("/infoDetail.ad")
public class adInfoDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adInfoDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int infoNo = Integer.parseInt(request.getParameter("ino"));
		
		int result = new adInfoService().infoIncreaseCount(infoNo);
		
		if(result > 0) { // 조회수증가 조회성공
			
			
			adInfo i = new adInfoService().selectInfo(infoNo); // 현재글
			
			
			request.setAttribute("i", i);
			
			
			adInfoFile fi = new adInfoService().selectAttachment(infoNo);
			
			request.setAttribute("fi", fi);
			
			request.getRequestDispatcher("views/admin/info/adInfoDetailView.jsp").forward(request, response);
			
			
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
