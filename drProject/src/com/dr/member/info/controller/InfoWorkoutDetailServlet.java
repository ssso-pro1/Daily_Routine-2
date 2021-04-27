package com.dr.member.info.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dr.member.info.model.service.InfoService;
import com.dr.member.info.model.vo.Info;
import com.dr.member.info.model.vo.InfoFile;

/**
 * Servlet implementation class InfoWorkoutDetailServlet
 */
@WebServlet("/workoutDetail.in")
public class InfoWorkoutDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InfoWorkoutDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int intPostNo = Integer.parseInt(request.getParameter("ino")); 
		
		int result = new InfoService().increaseCount(intPostNo);
		
		if(result > 0) { // 유효한 게시글 => 게시글 정보 조회, 게시글 썸네일 조회  => 상세조회 페이지 
			
			Info i = new InfoService().selectWorkout(intPostNo); 
			InfoFile inf = new InfoService().selectWorkoutFile(intPostNo); 
			
			request.setAttribute("i", i);
			request.setAttribute("inf", inf);
			
			request.getRequestDispatcher("views/member/info/infoWorkoutDetailView.jsp").forward(request, response);
			
			
		}else { // 유효한 게시글 x => 에러 페이지 포워딩 
				
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
