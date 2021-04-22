package com.dr.admin.center.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		int result = new CenterService().noticeIncreaseCount(noticeNo);
		
		
		// 사용자거랑 같이쓸것임
		
		if(result > 0) { // 조회수증가 조회성공
			
			
			CenterNotice n = new CenterService().selectNotice(noticeNo); // 현재글
			CenterNotice nPre = new CenterService().selectNoticePre(noticeNo); // 이전글 (제목, 글번호)
			CenterNotice nNext = new CenterService().selectNoticeNext(noticeNo); // 다음글 (제목, 글번호)
			
			request.setAttribute("n", n);
			request.setAttribute("nPre", nPre);
			request.setAttribute("nNext", nNext);
			
			request.getRequestDispatcher("views/admin/center/adCenterNoticeDetail.jsp").forward(request, response);
			//글번호, 글제목, 글내용물, 등록일
			
		} else {
			
			
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