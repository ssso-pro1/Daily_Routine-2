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
import com.dr.member.center.model.service.CenterService;
import com.dr.member.center.model.vo.CenterNotice;

/**
 * Servlet implementation class adCenterNoticeDetailServlet
 */
@WebServlet("/ctNoticeDetail.ad")
public class adCenterNoticeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adCenterNoticeDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int noticeNo = Integer.parseInt(request.getParameter("nno"));
		
		int result = new adCenterService().noticeIncreaseCount(noticeNo);
		
		
		if(result > 0) { // 조회수증가 조회성공
			
			centerNoticeFile fi = new adCenterService().selectAttachment(noticeNo);
			
			request.setAttribute("fi", fi);
			
			
			adCenterNotice n = new adCenterService().selectNotice(noticeNo); // 현재글
			
			
			request.setAttribute("n", n);
			
			
			request.getRequestDispatcher("views/admin/center/adCenterNoticeDetail.jsp").forward(request, response);
			//글번호, 글제목, 글내용물, 등록일
			
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
