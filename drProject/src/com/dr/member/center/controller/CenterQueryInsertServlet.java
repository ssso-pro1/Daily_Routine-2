package com.dr.member.center.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dr.member.center.model.service.CenterService;
import com.dr.member.center.model.vo.CenterQuery;
import com.dr.member.user.model.vo.User;

/**
 * Servlet implementation class CenterQueryInsertServlet
 */
@WebServlet("/insertQuery.ct")
public class CenterQueryInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CenterQueryInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		
		if(loginUser != null) {
		
		
			request.setCharacterEncoding("utf-8");
			
			String qCategory = request.getParameter("qCategory");
			String qTitle = request.getParameter("qTitle");
			String qContent = request.getParameter("qContent");
			
			
			
			
			 
			
			
			CenterQuery q = new CenterQuery();
			q.setUserNo(userNo);
			q.setQueryCategory(qCategory);
			q.setQueryTitle(qTitle);
			q.setQueryContent(qContent);
			
			int result = new CenterService().insertQuery(q);
			
			if (result > 0) { // 등록성공
				request.getSession().setAttribute("alertMsg", "1:1문의글 등록에 성공했습니다");
				response.sendRedirect(request.getContextPath()+"/queryList.ct?currentPage=1"); //문의내역 리스트로 이동
			
			} else { //등록실패
				
				request.setAttribute("errorMsg", "오류가 발생했습니다");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
			
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
