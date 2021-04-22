package com.dr.member.comm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dr.member.comm.model.service.CommService;
import com.dr.member.comm.model.vo.Comm;
import com.dr.member.comm.model.vo.CommFile;

/**
 * Servlet implementation class CommFreeDetailServlet
 */
@WebServlet("/freeDetail.co")
public class CommFreeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommFreeDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int commPostNo = Integer.parseInt(request.getParameter("cno"));
		
		// 조회수 증가 / 게시글 조회 (Comm) / 첨부파일 조회 (CommFile)
		int result = new CommService().increaseCount(commPostNo); 
		
		if(result > 0) { // 유효한 게시글 => 게시글, 첨부파일 조회 => 상세보기 페이지 
			
			Comm c = new CommService().selectCommFree(commPostNo); 
			CommFile cf = new CommService().selectCommFreeFile(commPostNo); 
			
			request.setAttribute("c", c);
			request.setAttribute("cf", cf);
			
			//System.out.println(c); 
			
			request.getRequestDispatcher("views/member/comm/commFreeDetailView.jsp").forward(request, response);
			
		}else { // 유효한 게시글 x => 에러 문구 담아서 에러 페이지로 포워딩 
		
			request.setAttribute("errorMsg", "유효한 게시글이 아닙니다. 다른 게시글을 선택해주세요.");
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
