package com.dr.member.comm.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.dr.common.MyFileRenamePolicy;
import com.dr.member.comm.model.service.CommService;
import com.dr.member.comm.model.vo.Comm;
import com.dr.member.comm.model.vo.CommFile;
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
			
			// 1. 전송되는 파일을 처리할 작업 내용 
			// 1_1. 전달되는 파일의 용량 제한 (int maxSize => byte 단위): 10Mbyte로 제한 
			int maxSize = 10 * 1024 * 1024; 
			
			// 1_2. 전달된 파일을 저장할 서버의 폴더 경로 알아내기 (String savePath) 
			String savePath = request.getSession().getServletContext().getRealPath("/resources/file/comm/commTip_upfiles/"); 
			
			// 2. 전달된 파일명 수정 후 서버에 업로드 작업 (MultipartRequest 객체 생성) request => multiRequest
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy()); 
			
			// 3. 요청 시 전달된 값 뽑아서 vo에 담기
			// 3_1. Comm 테이블에 insert 할 카테고리번호, 게시판제목, 게시판내용, 작성자회원번호를 Comm 객체에 담기 
			Comm c = new Comm();
			c.setCategoryName(multiRequest.getParameter("category")); 
			c.setPostTitle(multiRequest.getParameter("commTitle")); 
			c.setPostContent(multiRequest.getParameter("commContent"));
			c.setUserNo(multiRequest.getParameter("userNo"));
			
			// 3_2. CommFile 테이블에 Insert할 원본명, 수정명, 저장폴더경로를 CommFile 객체에 담기 
			//      단, 여러 개의 첨부파일을 담을 예정이기 때문에 해당 CommFile 객체들을 ArrayList에 담을 것! 
			ArrayList<CommFile> list = new ArrayList<>(); 		
			
			for(int i=1; i<=3; i++) {
				
				String key = "file" + i; 
				if(multiRequest.getOriginalFileName(key) != null) { 
					// CommFile 객체 생성 + 원본명,수정명,폴더경로,파일레벨(0/1)
					CommFile cf = new CommFile();
					cf.setFileName(multiRequest.getOriginalFileName(key)); 
					cf.setFileUpdate(multiRequest.getFilesystemName(key)); 
					cf.setFilePath("resources/file/comm/commTip_upfiles/");
					
					/* 인포앤팁 첨부파일 파일레벨 추가 
					 * if(i == 1) { 
					 * 	   at.setFileLevel(0); 
					 * }else { 
					 * 	   at.setFileLevel(1); 
					 * }
					 */
					
					list.add(cf); 	
				}
			}
			
			// 4. 게시판 작성용 서비스 요청 및 결과 받기 
			int result = new CommService().insertCommTip(c, list);
			
			if(result > 0) { // 성공 => /commMain.co url 재요청 => 나만의운동tip!게시판리스트페이지 
				
				request.getSession().setAttribute("alertMsg", "작성하신 게시글이 등록되었습니다.");
				response.sendRedirect(request.getContextPath() + "/commMain.co?currentPage=1"); 
				
			}else { // 실패 => 에러 문구 담아서 에러 페이지 포워딩 
				
				request.setAttribute("errorMsg", "게시글 등록을 실패하였습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp");
					
			}
			
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
