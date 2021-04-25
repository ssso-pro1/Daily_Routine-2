package com.dr.member.ht.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dr.member.ht.model.service.HtService;
import com.google.gson.Gson;

/**
 * Servlet implementation class HtBookmarkServlet
 */
@WebServlet("/bookmark.ht")
public class HtBookmarkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HtBookmarkServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int htPostNo = Integer.parseInt(request.getParameter("postNo")); // 글번호
		int userNo = Integer.parseInt(request.getParameter("userNo")); // 유저번호
		// 게시글 타입은 ht => 1 로 고정 => sql문에서 1로 고정하기
		
		boolean check = new HtService().bookmarkCheck(htPostNo, userNo);
		
		if(check == true) { // 좋아요 누른 상태 -> 게시글 테이블 좋아요 하나 빼기
			int result = new HtService().deleteBookmark(htPostNo, userNo);
			
			new Gson().toJson(check, response.getWriter());
			
		}else { // 안누른 상태 -> 게시글 테이블 좋아요 하나 추가
			int result = new HtService().insertBookmark(htPostNo, userNo);
			
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
