package com.dr.member.ht.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dr.member.ht.model.service.HtService;
import com.dr.member.ht.model.vo.Ht;

/**
 * Servlet implementation class HtDetailViewServlet
 */
@WebServlet("/detail.ht")
public class HtDetailViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HtDetailViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int hno = Integer.parseInt(request.getParameter("hno"));
		
		int result = new HtService().increaseCount(hno);
		
		if(result > 0) { // 유효한 게시글 -> 정보 조회
			Ht h = new HtService().selectPost(hno);
			
			request.setAttribute("h", h);
			request.getRequestDispatcher("views/member/ht/htDetailView.jsp").forward(request, response);
		}else { // 실패
			request.setAttribute("errorMsg", "실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
