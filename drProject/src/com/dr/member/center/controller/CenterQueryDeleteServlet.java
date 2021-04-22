package com.dr.member.center.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dr.member.center.model.service.CenterService;

/**
 * Servlet implementation class CenterQueryDeleteServlet
 */
@WebServlet("/deleteQuery.ct")
public class CenterQueryDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CenterQueryDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int queryNo = Integer.parseInt(request.getParameter("qno")); // 삭제하기 누른 문의글번호
		
		int result = new CenterService().deleteQuery(queryNo);
		
		if(result > 0) { // 삭제성공 (QueryStaust 상태값 'N'으로 변경 / replyStatus 'D'로 변경)
			
			
			request.getSession().setAttribute("alertMsg", "게시글이 삭제되었습니다");
			response.sendRedirect(request.getContextPath() + "/queryList.ct?currentPage=1"); //문의내역 리스트로 이동
			
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
