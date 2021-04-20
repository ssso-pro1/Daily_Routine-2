package com.dr.admin.center.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dr.admin.center.model.service.adCenterService;

/**
 * Servlet implementation class adCenterFaqDeleteServlet
 */
@WebServlet("/ctFaqDelete.ad")
public class adCenterFaqDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adCenterFaqDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int faqNo = Integer.parseInt(request.getParameter("fno")); // 삭제하기 누른 문의글번호
		
		
		
		int result = new adCenterService().deleteFaq(faqNo);
		
		
		if(result > 0) { // 삭제성공 (테이블에서 완전삭제해버림)
			
			
			//request.getSession().setAttribute("alertMsg", "게시글이 삭제되었습니다");
			
			request.setCharacterEncoding("utf-8");
			String ctg = request.getParameter("ctg");
			
			response.sendRedirect(request.getContextPath()+"/ctFaqList.ad?currentPage=1&ctg="+ctg); // 삭제눌렀던 목록으로 돌아가기
			
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
