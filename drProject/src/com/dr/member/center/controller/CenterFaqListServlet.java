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
import com.dr.member.center.model.vo.CenterFaq;

/**
 * Servlet implementation class CenterQueryFaqListServlet
 */
@WebServlet("/faqList.ct")
public class CenterFaqListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CenterFaqListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String category = request.getParameter("ctg");
		
		
		//ArrayList<CenterFaq> faqList = new CenterService().faqList(category);
		//request.setAttribute("faqList", faqList);
		
		
		//------------------------------------------------------------------------------------------------
		
		// 페이징
		
		int listCount;		
		int currentPage;	
		int pageLimit;		
		int boardLimit;		
						
		int maxPage; 		
		int startPage;		
		int endPage;		
						
				
		listCount = new CenterService().faqSelectListCount(category); // 각자카테고리에 들어있는 리스트 수
						
				
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
						
		// * pageLimit : 한페이지 하단에 보여질 페이지 최대 갯수 (페이지 목록들 몇 개 단위)
		pageLimit = 10;
						
				
		boardLimit = 10;
						
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
						
		// * startPage : 현재 페이지에 보여질 페이징바의 시작수
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
						
		// * endPage : 현재 페이지에 보여지는 페이징바의 끝 수
		endPage = startPage + pageLimit - 1;
						
		// 만약 maxPage가 고작 13까지 밖에 안된다면? endPage를 13로 해줘야됨!!
		if(endPage > maxPage) {
			endPage = maxPage;
		}
						
		// 페이징정보들을 어딘가의 한 공간에 담자!!
		// 1. 페이징바 만들때 필요한 PageInfo객체
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		
		// 2. 현재 요청한 페이지(currentPage)에 보여질 게시글 리스트 조회해오기
		ArrayList<CenterFaq> list = new CenterService().faqselectList(pi, category);
						
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/member/center/centerFaqList.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
