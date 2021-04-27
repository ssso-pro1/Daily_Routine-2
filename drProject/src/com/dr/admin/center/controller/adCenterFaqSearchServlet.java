package com.dr.admin.center.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dr.admin.center.model.service.adCenterService;
import com.dr.admin.center.model.vo.adCenterFaq;
import com.dr.common.model.vo.PageInfo;
import com.dr.member.center.model.service.CenterService;


/**
 * Servlet implementation class CenterFaqSearchServlet
 */
@WebServlet("/ctFaqSearch.ad")
public class adCenterFaqSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adCenterFaqSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount;		
		int currentPage;	
		int pageLimit;		
		int boardLimit;		
				
		int maxPage; 		
		int startPage;		
		int endPage;		
		
		
		request.setCharacterEncoding("utf-8");
		
		String searchFaq = request.getParameter("searchFaq"); // 검색어
		
		listCount = new adCenterService(). searchFaqListCount(searchFaq); //검색어로 검색된 총 페이지수
		
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		pageLimit = 10;
				
		boardLimit = 8;
				
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
				
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
				
		endPage = startPage + pageLimit - 1;
				
		if(endPage > maxPage) {
			endPage = maxPage;
		}
				
		
		// 1. 페이징바 만들때 필요한 PageInfo객체
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		// 2. 현재 요청한 페이지(currentPage)에 보여질 게시글 리스트 조회해오기
		ArrayList<adCenterFaq> searchList = new adCenterService().searchFaqList(pi, searchFaq);
		
		request.setAttribute("searchFaq", searchFaq);
		request.setAttribute("listCount", listCount);
		request.setAttribute("pi", pi);
		request.setAttribute("searchList", searchList);
		
		request.getRequestDispatcher("views/admin/center/adCenterFaqSearchList.jsp").forward(request, response);
		
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
