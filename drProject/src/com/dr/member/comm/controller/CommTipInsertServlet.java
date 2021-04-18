package com.dr.member.comm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

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
			//System.out.println(savePath); 
			
			// 2. 전달된 파일명 수정 후 서버에 업로드 작업 (MultipartRequest 객체 생성) 
			// MultipartRequest 객체 생성과 동시에 넘어온 첨부파일이 해당 폴더에 무조건 업로드됨 
			
			// 원본 파일명을 그대로 해당 폴더에 업로드하지 않는 것이 일반적 
			// 기본적으로 수정명 작업을 해주는 객체 (DefaultFileRenamePolicy 객체(cos 라이브러리))
			// => 기존에 동일한 파일명 존재할 경우 카운팅된 숫자를 붙여줌 
			
			// 나만의 MyFileRenamePolicy 클래스 만들어서 rename 메소드 재정의할 것!
			// 나만의 com.dr.common.MyFileRenamePolicy 클래스 만들어서 재정의 
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", 나만의파일리네임폴리시객체); 
			
			
			
			// 3. 요청 시 전달된 값 뽑아서 vo에 담기
			
			// 4. 게시판 작성용 서비스 요청 및 결과 받기 
			
		
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
