package com.dr.member.comm.controller;

import java.io.IOException;
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
 * Servlet implementation class CommFreeInsertServlet
 */
@WebServlet("/freeInsert.co")
public class CommFreeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommFreeInsertServlet() {
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
			String savePath = request.getSession().getServletContext().getRealPath("/resources/file/comm/commFree_upfiles/"); 
			
			// 2. 전달된 파일명 수정 후 서버에 업로드 작업 (MultipartRequest 객체 생성) request => multiRequest
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy()); 
			
			// 3. 요청 시 전달된 값 뽑아서 vo에 담기
			// 3_1. Comm 테이블에 insert 할 게시판제목, 게시판내용, 작성자회원번호를 Comm 객체에 담기 
			String commTitle = multiRequest.getParameter("title"); 
			String commContent = multiRequest.getParameter("content");
			String userNo = multiRequest.getParameter("userNo"); 
			
			Comm c = new Comm();
			c.setPostTitle(commTitle); 
			c.setPostContent(commContent);
			c.setUserNo(userNo);
			
			// 3_2. CommFile 테이블에 Insert할 원본명, 수정명, 저장폴더경로를 CommFile 객체에 담기 
			CommFile cf = null;  		
			
			if(multiRequest.getOriginalFileName("upfile") != null) { 
				
				cf = new CommFile(); 
				// 원본명, 수정명(실제 서버에 업로드된 파일명), 저장 폴더 경로 
				cf.setFileName(multiRequest.getOriginalFileName("upfile")); 
				cf.setFileUpdate(multiRequest.getFilesystemName("upfile")); 
				cf.setFilePath("resources/file/comm/commFree_upfiles/");

			}
			
			// 4. 게시판 작성용 서비스 요청 및 결과 받기 
			int result = new CommService().insertCommFree(c, cf);
			// case 1 : 첨부파일 있던 경우 => insertCommFree(생성된 Comm객체, 생성된 CommFile 객체) 
			// case 2 : 첨부파일 없던 경우 => insertCommFree(생성된 Comm객체, null)  
			
			if(result > 0) { // 성공 => /free.co url 재요청 => 자유게시판 리스트 페이지 
				
				request.getSession().setAttribute("alertMsg", "작성하신 게시글이 등록되었습니다.");
				response.sendRedirect(request.getContextPath() + "/free.co?currentPage=1"); 
				
			}else { // 실패 => 에러 문구 담아서 에러 페이지 포워딩 
				
				request.setAttribute("errorMsg", "게시글 등록을 실패하였습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
					
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
