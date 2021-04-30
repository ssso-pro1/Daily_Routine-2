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
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * Servlet implementation class MainPageServlet
 */
@WebServlet("/index.us") //mainPage.us에서 변경
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
		/*
		ArrayList<Comm> list1 = new CommService().selectMaCommList();
		ArrayList<Info> list2 = new InfoService().selectMaInfoList();
		ArrayList<Ht> list3 = new HtService().selectMaHtList();

		System.out.println(list1);
		System.out.println(list2);
		System.out.println(list3);
		*/
		/*
		request.setAttribute("list1", list1);
		request.setAttribute("list2", list2);
		request.setAttribute("list3", list3);

		
		//request.getRequestDispatcher("views/common/mainPage.jsp").forward(request, response);
		
		*/
		
		
		ArrayList<Comm> list1 = new CommService().selectMaCommList();
		
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyy년 MM월 dd일").create();
		gson.toJson(list1, response.getWriter());
		
		request.getRequestDispatcher("index.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
