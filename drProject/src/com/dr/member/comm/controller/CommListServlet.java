package com.dr.member.comm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dr.common.model.vo.PageInfo;
import com.dr.member.comm.model.service.CommService;

/**
 * Servlet implementation class CommListServlet
 */
@WebServlet("/commMain.co")
public class CommListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 페이징 처리 
		int listCount; 			
		int currentPage;		
		int pageLimit; 			
		int boardLimit; 		

		int maxPage; 			
		int startPage;    		
		int endPage; 		
		
		listCount = new CommService().selectListCount(); 
		System.out.println(listCount); // => SQLException error남 (ㅠㅠ) 
		
		currentPage = Integer.parseInt(request.getParameter("currentPage")); 
		pageLimit = 5; // 페이징 바 5개 단위 
		boardLimit = 10; // 한 페이지당 게시글 10개씩 
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit); 
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1; 
		
		if(endPage > maxPage) { 
			endPage = maxPage;
		}
		
		// 페이징 정보들을 한 공간에 담아둘 것
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		System.out.println(pi);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
