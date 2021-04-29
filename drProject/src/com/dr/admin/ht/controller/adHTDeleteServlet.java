package com.dr.admin.ht.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dr.admin.ht.model.service.adHTService;

/**
 * Servlet implementation class adHTDeleteServlet
 */
@WebServlet("/htDelete.aht")
public class adHTDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adHTDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int htNo = Integer.parseInt(request.getParameter("hno"));
		
		int result = new adHTService().deleteHT(htNo);
		
		
		if(result > 0) { //  성공 
			
			request.getSession().setAttribute("alertMsg", "게시글 삭제 성공했습니다");
			response.sendRedirect(request.getContextPath()+ "/htList.aht?currentPage=1");
			
		} else { // 실패
			
			request.setAttribute("errorMsg", "게시글 등록실패!");
			request.getRequestDispatcher("views/common/errorPage/jsp").forward(request, response);
			
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
