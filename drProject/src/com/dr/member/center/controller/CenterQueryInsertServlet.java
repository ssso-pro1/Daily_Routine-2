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
		
		request.setCharacterEncoding("utf-8");
		
		String qCategory = request.getParameter("qCategory");
		String qTitle = request.getParameter("qTitle");
		String qContent = request.getParameter("qContent");
		
		//HttpSession session = request.getSession();
		//User loginUser = (User)session.getAttribute("loginUser");
		//int userNo = loginUser.getUserNo();
		
		//CenterQuery q = new CenterQuery();
		//q.setQueryContent(qContent);
		//q.setUserNo(String.valueOf(userNo)); // 1 => "1"
		
		//int result = new CenterService().insertQuery(q);
		
		// 지금은 회원번호를 2 라고 가정해서 넣어보겠음
		int userNo = 2;
		
		CenterQuery q = new CenterQuery();
		q.setUserNo(userNo);
		q.setQueryCategory(qCategory);
		q.setQueryTitle(qTitle);
		q.setQueryContent(qContent);
		
		int result = new CenterService().insertQuery(q);
		
		if (result > 0) { // 등록성공
			request.getSession().setAttribute("alertMsg", "1:1문의글 등록에 성공했습니다");
			response.sendRedirect(request.getContextPath() + "/queryList.ct"); //문의내역 리스트로 이동
		
		} else { //등록실패
			
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
