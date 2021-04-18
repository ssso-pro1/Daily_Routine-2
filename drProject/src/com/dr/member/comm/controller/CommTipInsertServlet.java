package com.dr.member.comm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class CommTipInsertServlet
 */
@WebServlet("/insertTip.co")
public class CommTipInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommTipInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8"); 
		
		// 폼 전송을 일반 방식이 아닌 multipart/form-data로 전송하는 경우 request로 값을 뽑을 수 없음 
		// enctype이 multipart/form-data로 전송 
		if(ServletFileUpload.isMultipartContent(request)) { 
			
			// System.out.println("잘 실행되나?"); 
			
			// 파일 업로드를 위한 외부 라이브러리 : cos.jar 
			// 1. 전송되는 파일을 처리할 작업 내용 (전송되는 파일의 용량 제한, 전달된 파일을 저장할 폴더 경로) 
			// 1_1. 전달되는 파일의 용량 제한 (int maxSize => byte 단위): 10Mbyte로 제한 
			int maxSize = 10*1024*1024; 
			
			// 1_2. 전달된 파일을 저장할 서버의 폴더 경로 알아내기 (String savePath) 
			String savePath = request.getSession().getServletContext().getRealPath("/resources/file/comm/commTip_upfiles/"); 
			System.out.println(savePath); 
			
			// 2. 전달된 파일명 수정 후 서버에 업로드 작업 (MultipartRequest 객체 생성) 
			
			
		
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
