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
@WebServlet("/notice.ct")
public class CenterNoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CenterNoticeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 페이징
		
		int listCount;		// 현재 총 게시글 갯수
		int currentPage;	// 현재 페이지 (즉, 요청한 페이지)
		int pageLimit;		// 한 페이지 하단에 보여질 페이징바의 페이지 최대갯수 (몇개단위)
		int boardLimit;		// 한 페이지 내에 보여질 게시글 최대 갯수 (몇개단위)
				
		int maxPage; 		// 전체페이지들 중에서의 가장 마지막페이지 (listCount, boardLimit를 가지고 구할꺼임)
		int startPage;		// 현재 페이지에 하단에 보여질 페이징 바의 시작수 (currentPage, pageLimit를 가지고 구할꺼임)
		int endPage;		// 현재 페이지에 하단에 보여질 페이징 바의 끝 수 (startPage, pageLimit, maxPage를 가지고 구할꺼임)
				
		// * listCount : 총 게시글 갯수 조회해서 담기
		listCount = new CenterService().noticeSelectListCount();
				
		// * currentPage : 현재 요청한 페이지
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
				
		// * pageLimit : 한페이지 하단에 보여질 페이지 최대 갯수 (페이지 목록들 몇 개 단위)
		pageLimit = 10;
				
		// * boardLimit : 한페이지 내에 보여질 게시글 최대 갯수
		boardLimit = 10;
				
		// * maxPage : 총 페이지 수 (마지막 페이지)
				
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
		ArrayList<CenterNotice> list = new CenterService().noticeSelectList(pi);
				
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/member/center/centerNoticeList.jsp").forward(request, response);
		
		
		
		
		
		
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
