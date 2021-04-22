package com.dr.member.comm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dr.member.comm.model.service.CommService;

/**
 * Servlet implementation class CommFreeDeleteServlet
 */
@WebServlet("/freeDelete.co")
public class CommFreeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommFreeDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int commPostNo = Integer.parseInt(request.getParameter("cno")); // 문자열로 뽑히기 때문에 파싱 필요 
		
		int result = new CommService().deleteCommFree(commPostNo);
		
		if(result > 0) {
			
			request.getSession().setAttribute("alertMsg", "게시글이 삭제되었습니다."); 
			response.sendRedirect(request.getContextPath() + "/free.co"); 
			
		}else { 
			
			request.setAttribute("errorMsg", "게시글 삭제를 실패하였습니다.");
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
