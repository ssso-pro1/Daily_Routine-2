package com.dr.common;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dr.member.comm.model.service.CommService;
import com.dr.member.comm.model.vo.Comm;
import com.dr.member.ht.model.service.HtService;
import com.dr.member.ht.model.vo.Ht;
import com.dr.member.info.model.service.InfoService;
import com.dr.member.info.model.vo.Info;

/**
 * Servlet implementation class MainPageServlet
 */
@WebServlet("/mainPage.us")
public class MainPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//int commPostNo = Integer.parseInt(request.getParameter("cno"));
		
		ArrayList<Comm> list1 = new CommService().selectCommList();
		ArrayList<Info> list2 = new InfoService().selectInfoList();
		ArrayList<Ht> list3 = new HtService().selectHtList();

		
		request.setAttribute("list1", list1);
		request.setAttribute("list2", list2);
		request.setAttribute("list3", list3);

		
		request.getRequestDispatcher("views/common/mainPage.jsp").forward(request, response);
		
		
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
