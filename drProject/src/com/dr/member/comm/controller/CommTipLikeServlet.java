package com.dr.member.comm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dr.member.comm.model.service.CommService;
import com.dr.member.ht.model.service.HtService;
import com.google.gson.Gson;

/**
 * Servlet implementation class CommTipLikeServlet
 */
@WebServlet("/likeTip.co")
public class CommTipLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommTipLikeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		int commPostNo = Integer.parseInt(request.getParameter("postNo")); 
		int userNo = Integer.parseInt(request.getParameter("userNo")); 
		
		boolean check = new CommService().likeCheck(commPostNo, userNo);
		
		if(check == true) { // 좋아요 누른 상태 -> 게시글 테이블 좋아요 - 1
			int result = new CommService().deleteLike(commPostNo, userNo);
			int result2 = new CommService().subLikeCount(commPostNo); // 게시물 전체 좋아요 수 - 1
			
			new Gson().toJson(check, response.getWriter());
			
		}else { // 안누른 상태 -> 게시글 테이블 좋아요 + 1
			int result = new CommService().insertLike(commPostNo, userNo);
			int result2 = new CommService().sumLikeCount(commPostNo); // 게시물 전체 좋아요 수 + 1
			
			new Gson().toJson(check, response.getWriter());
			
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
