package com.dr.member.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dr.member.user.model.service.UserService;
import com.dr.member.user.model.vo.User;

/**
 * Servlet implementation class UserInsertServlet
 */
@WebServlet("/insert.us")
public class UserInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
	      
	      String userId = request.getParameter("userId");
	      String userPwd = request.getParameter("userPwd");
	      String userName = request.getParameter("userName");
	      
	      String[] birthArr = request.getParameterValues("birth");
	      
	      String birth = "";
	      if(birthArr != null) {
	    	  birth = String.join("", birthArr);
	      }
	      
	      String gender = request.getParameter("gender");
	      String email = request.getParameter("email");
	      String phone = request.getParameter("phone");
	      
	      
	      User u = new User(userId, userPwd, userName, birth, gender, email, phone);
	      
	      int result = new UserService().insertUser(u);
	      
	      if(result > 0) {
	    	
	    	  
//	         HttpSession session = request.getSession();
//	         session.setAttribute("alertMsg", "성공적으로 회원가입 되었습니다.");
	         
//	         response.sendRedirect(request.getContextPath());

	    	 //3단계로 가기 
		     request.getRequestDispatcher("/enrollForm3.us").forward(request, response);
	      }else {
	         request.setAttribute("errorMsg", "회원가입에 실패했습니다.");
	         RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			 view.forward(request, response); 
	         
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
