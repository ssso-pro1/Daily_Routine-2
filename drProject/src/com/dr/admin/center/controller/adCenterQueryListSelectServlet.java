package com.dr.admin.center.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dr.admin.center.model.service.adCenterService;
import com.dr.admin.center.model.vo.adCenterQuery;
import com.dr.common.model.vo.PageInfo;

/**
 * Servlet implementation class adCenterQueryListServlet
 */
@WebServlet("/ctQuerySelect.ad")
public class adCenterQueryListSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adCenterQueryListSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 문의내역 리스트로 보낼것
		// 페이징 처리해서
		// 처리중, 처리완료 + 회원삭제글
		
		request.setCharacterEncoding("utf-8");
		String reStatus = request.getParameter("reStatus"); //클릭되어 전달된 reply_status // 처리중
		
		// 페이징
		int listCount;		
		int currentPage;	
		int pageLimit;		
		int boardLimit;		
						
		int maxPage; 		
		int startPage;		
		int endPage;		
						
			
		listCount = new adCenterService().querySelectListCount(reStatus); // 각자 reStatus에 들어있는 리스트 수
						
				
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		pageLimit = 10;
		boardLimit = 10;
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
						
		if(endPage > maxPage) {
			endPage = maxPage;
		}
						
		// 1. 페이징바 만들때 필요한 PageInfo객체
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		
		// 2. 현재 요청한 페이지(currentPage)에 보여질 게시글 리스트 조회해오기
		ArrayList<adCenterQuery> list = new adCenterService().querySelectList(pi, reStatus);
						
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/admin/center/adCenterQueryListSelect.jsp").forward(request, response);
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
