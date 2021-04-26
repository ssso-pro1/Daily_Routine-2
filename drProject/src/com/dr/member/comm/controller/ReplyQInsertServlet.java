package com.dr.member.comm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dr.member.comm.model.service.CommService;
import com.dr.member.comm.model.vo.Reply;
import com.dr.member.user.model.vo.User;

/**
 * Servlet implementation class ReplyQInsertServlet
 */
@WebServlet("/replyQInsert.co")
public class ReplyQInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyQInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String replyContent = request.getParameter("content");
		int commPostNo = Integer.parseInt(request.getParameter("cno")); 
		
		int userNo = ((User)request.getSession().getAttribute("loginUser")).getUserNo();
		
		Reply r = new Reply();
		r.setReplyContent(replyContent);
		r.setCommPostNo(commPostNo);
		r.setUserNo(String.valueOf(userNo));
		
		int result = new CommService().insertReply(r);
		response.getWriter().print(result);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
