package com.dr.member.info.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dr.common.model.vo.PageInfo;
import com.dr.member.info.model.service.InfoService;
import com.dr.member.info.model.vo.Info;

/**
 * Servlet implementation class InfoMenuListServlet
 */
@WebServlet("/menu.in")
public class InfoMenuTListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InfoMenuTListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 페이징 처리 
		int listCount; 			
		int currentPage = 1;		
		int pageLimit; 			
		int boardLimit; 		

		int maxPage; 			
		int startPage;    		// pageLimit, currentPage에 영향을 받음 
		int endPage; 			// pageLimit, startPage에 영향을 받음 
						
		listCount = new InfoService().selectMenuListCount(); 
		//System.out.println(listCount); 
						
		String currentPageParam = request.getParameter("currentPage");
						
		if(currentPageParam!=null) currentPage = Integer.parseInt(currentPageParam);
					 		
		pageLimit = 10; // 페이징 바 10개 단위 
		boardLimit = 6; // 한 페이지당 게시글 6개씩 
						
		maxPage = (int)Math.ceil((double)listCount / boardLimit); 
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1; 
						
		if(endPage > maxPage) { 
			endPage = maxPage;
		}
						
		// 페이징 정보들을 한 공간에 담아둘 것
		// 1. 페이징바 만들 때 필요한 PageInfo 객체 
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		//System.out.println(pi);
						
		// 2. currentPage(현재 페이지)에 보여질 게시글 리스트 조회 
		ArrayList<Info> list = new InfoService().selectMenuThumbnailList(pi);
						
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
						
		request.getRequestDispatcher("views/member/info/infoMenuTListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
