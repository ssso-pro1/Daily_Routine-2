package com.dr.admin.info.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dr.admin.center.model.service.adCenterService;
import com.dr.admin.info.model.service.adInfoService;

/**
 * Servlet implementation class adInfoDeleteServlet
 */
@WebServlet("/infoDelete.ad")
public class adInfoDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adInfoDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] infoNo = request.getParameterValues("ino"); // 밸류 여러개가져오는건 String에만 담긴다
		
		int result = new adInfoService().deleteInfo(infoNo);
				
				
		if(result > 0) { // 삭제성공 (테이블에서 완전삭제해버림)
					
					
			request.getSession().setAttribute("alertMsg", "게시글이 삭제되었습니다");
					
			request.setCharacterEncoding("utf-8");
			
					
			response.sendRedirect(request.getContextPath()+"/info.ad?currentPage=1"); // 전체보기 페이지로가기
					
					
		} else { // 삭제실패 
			request.setAttribute("errorMsg", "오류가 발생했습니다");
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
