package com.dr.admin.ht.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.dr.admin.ht.model.service.AdHTService;
import com.dr.admin.ht.model.vo.AdHT;
import com.dr.admin.ht.model.vo.HTFile;
import com.dr.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AdHTInsertServlet
 */
@WebServlet("/htInsert.aht")
public class AdHTInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdHTInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		/* multipart/form-data로 전송할 때 request로 값 뽑을 수 없음!
		String category = request.getParameter("category");
		String htPostTitle = request.getParameter("htPostTitle");
		*/
		
		//enctype 이 multipart/form-data로 잘 전송되었을 경우
		if(ServletFileUpload.isMultipartContent(request)) {
			//System.out.println("잘 실행되나?"); //글등록시 출력 (흰페이지)
			//resources-upfiles 사진담아둘 폴더 (사용자가 다운 간으)
			
			// 파일업로드를 위한 외부 라이브러리 : cos.jar
			
			// 1. 전송되는 파일을 처리할 작업 내용 (전송되는 파일의 용량제한, 전달된 파일을 저장할 폴더 경로)
			// 1-1. 전달되는 파일의 용량 제한 (int maxSize => byte단위) : 10Mbyte로 제한
			
			int maxSize = 10*1024*1024;
			
			// 1-2. 전달된 파일을 저장할 서버의 폴더 경로 알아내기 (String savePath)
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/file/admin/adminHT_upfiles/"); 
			//이폴더 내에 넣을거기 때문에 경로 마지막에 / 까지.
			//System.out.println(savePath); //경로확인
			
			
			
			// 2. 전달된 파일명 수정 후 서버에 업로드 작업 (MultipartRequest 객체 생성)
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			
			// 3. 요청시 전달된 값들 뽑아서 vo에 주섬주섬 담기 (DB에 기록할 데이터들 뽑기)
			// 3-1. Board테이블 insert할 카테고리번호, 게시판제목, 게시판내용, 작성자회원번호를 Board객체에 담기
			// 카테고리명, 제목, 영상, 썸네일, 게시글내용, 로그인회원번호
			String categoryName = multiRequest.getParameter("categoryName");
			String htPostTitle = multiRequest.getParameter("htPostTitle");
			String videoLink = multiRequest.getParameter("videoLink");

			String htPostContent = multiRequest.getParameter("htPostContent");

			AdHT a = new AdHT();
			a.setCategoryName(categoryName);
			a.setHtPostTitle(htPostTitle);
			a.setVideoLink(videoLink);

			a.setHtPostContent(htPostContent);
			
			// 3-2. 첨부파일이 있다면, Attachment테이블에 Insert할 원본명, 수정명, 저장폴더경로를 Attachment 객체에 담기
			// System.out.println(multiRequest.getOriginalFileName("upfile"));
			// 첨부파일 없이(빈페이지, null반환) /
			// 있게 해서 출력 테스트 해봄 (첨부파일의 원본명 출력)
			
			
			
			HTFile h = null; // 처음엔  null로 초기화, 넘어온 첨부파일이 있다면 그 때 생성
			
			if(multiRequest.getOriginalFileName("fileNo") != null) { // 넘어온 첨부파일이 존재할 경우
				
				h = new HTFile();
				// 원본명, 수정명 (실제서버에 업로드된 파일명), 저장된폴더경로
				h.setOriginName(multiRequest.getOriginalFileName("fileNo")); 
				h.setChangeName(multiRequest.getFilesystemName("fileNo")); 
				h.setFilePath("resources/file/admin/adminHT_upfiles/");
			}
			
			
			// 4. 게시판 작성용 서비스 요청 및 결과 받기 / 하나의 서비스에서 두개의 INSERT
			int result = new AdHTService().insertAdHT(a, h);
			// case1 : 첨부파일이 있었을 경우 => insertBoard(생성된 Board객체, 생성된 Attachment객체)
			// case2 : 첨부파일이 없었을 경우 => insertBoard(생성된 Board객체, null);
			
			if(result > 0) { // 성공 => (게시판리스트의 첫번째페이지)/ url재요청 => 게시판리스트페이지
				
				request.getSession().setAttribute("alertMsg", "게시글 등록성공!!");
				response.sendRedirect(request.getContextPath() + "/htList.aht?currentPage=1"); //url재요청
				
			}else { // 실패
				
				request.setAttribute("errorMsg", "게시글등록실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response); //(어떤뷰보여지게).포워딩(전달)
				
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
