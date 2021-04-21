package com.dr.admin.center.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dr.admin.center.model.service.adCenterService;

/**
 * Servlet implementation class adCenterQueryReplyUpdateServlet
 */
@WebServlet("/ctQueryReplyUpdate.ad")
public class adCenterQueryReplyUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adCenterQueryReplyUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int queryNo = Integer.parseInt(request.getParameter("qno")); //게시글 번호
		
		String replyContent = request.getParameter("queryReplyContent");
		
		int result = new adCenterService().queryReplyUpdate(queryNo, replyContent);
		
		
		if(result > 0) { // 업데이트성공
			
			response.sendRedirect(request.getContextPath()+"/ctQueryDetail.ad?qno="+queryNo); // 보던 문의글로 돌아감
			
		} else { // 실패
			
			
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
