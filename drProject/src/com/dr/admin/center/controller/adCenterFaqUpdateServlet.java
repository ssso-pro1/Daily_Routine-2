package com.dr.admin.center.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dr.admin.center.model.service.adCenterService;
import com.dr.admin.center.model.vo.adCenterFaq;

/**
 * Servlet implementation class adCenterFaqUpdateServlet
 */
@WebServlet("/ctFaqUpdate.ad")
public class adCenterFaqUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adCenterFaqUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		request.setCharacterEncoding("utf-8");
		int faqNo = Integer.parseInt(request.getParameter("fno"));
		
		String fCategory = request.getParameter("fCategory");
		String fTitle = request.getParameter("fTitle");
		String fContent = request.getParameter("fContent");
		String status = request.getParameter("status");
		
		
		adCenterFaq f= new adCenterFaq();
		f.setFaqNo(faqNo);
		f.setFaqCategory(fCategory);
		f.setFaqTitle(fTitle);
		f.setFaqContent(fContent);
		f.setStatus(status);
		
		
		int result = new adCenterService().updateFaq(f);
		
		if (result > 0) { // 수정성공
			
			
			request.getSession().setAttribute("alertMsg", "FAQ 수정에 성공했습니다");
			response.sendRedirect(request.getContextPath()+"/ctFaqDetail.ad?fno=" + faqNo); // 자기가 수정한글 보여지게 
			
			
		
		} else { //수정실패
			
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
