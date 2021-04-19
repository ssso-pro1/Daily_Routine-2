package com.dr.member.center.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dr.common.model.vo.PageInfo;
import com.dr.member.center.model.service.CenterService;
import com.dr.member.center.model.vo.CenterNotice;

/**
 * Servlet implementation class CenterNoticeServlet
 */
@WebServlet("/searchNotice.ct")
public class CenterNoticeSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CenterNoticeSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 페이징
		
		int listCount;		// 제목에서 검색 게시글 수
		
		int currentPage;	// 현재 페이지 (즉, 요청한 페이지)
		int pageLimit;		// 한 페이지 하단에 보여질 페이징바의 페이지 최대갯수 (몇개단위)
		int boardLimit;		// 한 페이지 내에 보여질 게시글 최대 갯수 (몇개단위)
						
		int maxPage; 		// 전체페이지들 중에서의 가장 마지막페이지 (listCount, boardLimit를 가지고 구할꺼임)
		int startPage;		// 현재 페이지에 하단에 보여질 페이징 바의 시작수 (currentPage, pageLimit를 가지고 구할꺼임)
		int endPage;		// 현재 페이지에 하단에 보여질 페이징 바의 끝 수 (startPage, pageLimit, maxPage를 가지고 구할꺼임)
						
		
		
		request.setCharacterEncoding("utf-8");
		
		String searchNoticeCtg = request.getParameter("searchNoticeCtg"); // 카테고리
		String searchNoticeText = request.getParameter("searchNoticeText"); // 검색어
		
		listCount = new CenterService().searchNoticeCount(searchNoticeCtg, searchNoticeText);	
		
		
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		pageLimit = 10;
		boardLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
			
		endPage = startPage + pageLimit - 1;
					
			
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		
			
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<CenterNotice> list = new CenterService().searchNoticeList(pi, searchNoticeCtg, searchNoticeText);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/member/center/centerNoticeSearchList.jsp").forward(request, response);
			
		
		
		
		
		
				
		//request.setAttribute("pi", pi);
		//request.setAttribute("list", list);
		//request.getRequestDispatcher("views/member/center/centerNoticeList.jsp").forward(request, response);
		
		
		
		
		
		
		//-------------------------------------------------------------------------------------
		
		//ArrayList<CenterNotice> list = new CenterService().noticeList(); 페이징없이 일반조회
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
