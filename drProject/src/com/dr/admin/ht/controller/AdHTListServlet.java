package com.dr.admin.ht.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dr.admin.ht.model.service.AdHTService;
import com.dr.admin.ht.model.vo.AdHT;
import com.dr.common.model.vo.PageInfo;

/**
 * Servlet implementation class AdHTListServlet
 */
@WebServlet("/htList.aht")
public class AdHTListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdHTListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		int listCount;		// 현재 총 게시글 갯수 (db에서 조회해옴)
		int currentPage;	// 현재 페이지 (요청한 페이지)
		int pageLimit;		// 한 페이지 하단에 보여질 페이징바의 페이지 최대갯수 (몇개단위)
		int boardLimit; 	// 한 페이지내에 보여질 게시글 최대갯수 (몇개단위)
		
		int maxPage;		// 전체 페이지들 중에서 가장 마지막페이지 (listCount, boardLimit를 갖고 구할거임)
		int startPage; 		// 현재 페이지의 하단에 보여질 페이징 바의 시작 수 (currentPage, pageLimit를 가지고 구할거임)
		int endPage;		// 현재 페이지의 하단에 보여질 페이징 바의 끝 수
		
		listCount = new AdHTService().selectListCount();
		
		//System.out.println(listCount);
		
		
		
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		pageLimit = 5; //한페이지 하단에 보여질 페이지 최대 갯수
		
		boardLimit = 10; //한페이지 내에 보여질 게시글 최대 갯수
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit); //총 페이지 수 (마지막 페이지)
		
		startPage = (currentPage -1) / pageLimit * pageLimit + 1 ;
		
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
	
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		System.out.println(pi);
		
		ArrayList<AdHT> list = new AdHTService().selectList(pi);
		
		/*
		for(int i=0; i<list.size(); i++) {
			System.out.println(list.get(i));
		}
		
		for(AdHT a : list) {
			System.out.println(a); //아직흰페이지 보이고 , 리스트 출력된느지
			
		}
		System.out.println("===================="); //다음단계가기 전 한번 출력해보기 
		*/
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/admin/ht/adHTListView.jsp").forward(request,response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
