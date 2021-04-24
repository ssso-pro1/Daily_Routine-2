package com.dr.admin.center.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dr.admin.center.model.service.adCenterService;
import com.dr.admin.center.model.vo.adCenterFaq;
import com.dr.member.user.model.vo.User;

/**
 * Servlet implementation class adCenterFaqInsertServlet
 */
@WebServlet("/ctFaqInsert.ad")
public class adCenterFaqInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adCenterFaqInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String fCategory = request.getParameter("fCategory");
		String fTitle = request.getParameter("fTitle");
		String fContent = request.getParameter("fContent");
		String status = request.getParameter("status");
		
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		
		
		adCenterFaq f= new adCenterFaq();
		f.setUserNo(userNo);
		f.setFaqCategory(fCategory);
		f.setFaqTitle(fTitle);
		f.setFaqContent(fContent);
		f.setStatus(status);
		
		int result = new adCenterService().insertFaq(f);
		
		if (result > 0) { // 등록성공
			request.setCharacterEncoding("utf-8");
			String ctg = request.getParameter("fCategory");
			
			request.getSession().setAttribute("alertMsg", "FAQ 등록에 성공했습니다");
			response.sendRedirect(request.getContextPath()+"/ctFaqList.ad?currentPage=1&ctg="+ctg); // 자기가 등록한 글있는 카테고리목록 보여지게 => 영어로만 값넘어감 ㅠㅠ 나중에 고쳐보자
			
		
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
