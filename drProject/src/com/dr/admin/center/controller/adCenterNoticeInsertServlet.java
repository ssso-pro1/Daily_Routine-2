package com.dr.admin.center.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.dr.admin.center.model.service.adCenterService;
import com.dr.admin.center.model.vo.adCenterNotice;
import com.dr.admin.center.model.vo.centerNoticeFile;
import com.dr.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class adCenterNoticeInsertServlet
 */
@WebServlet("/ctNoticeInsert.ad")
public class adCenterNoticeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adCenterNoticeInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("utf-8");
		
		/*
		폼 전송을 일반 방식이 아닌 multipart/form-data로 전송하는 경우 request로 부터 값을 뽑을 수 없음!
		String category = request.getParameter("category");
		String boardTitle = request.getParameter("title");
		*/
		
		// enctype이 multipart/form-data로 잘 전송 되었을 경우 
		if(ServletFileUpload.isMultipartContent(request)) {
			
			
			// 1. 전송되는 파일을 처리할 작업 내용 (전송되는 파일의 용량제한, 전달된 파일을 저장할 폴더 경로)
			// 1_1. 전달되는 파일의 용량 제한 (int maxSize => byte단위) : 10Mbyte로 제한
			
			int maxSize = 10*1024*1024;
			
			// 1_2. 전달된 파일을 저장할 서버의 폴더 경로 알아내기 (String savePath)
			String savePath = request.getSession().getServletContext().getRealPath("/resources/file/center/centerNotice_upfiles/");
			//System.out.println(savePath);
			
			
			// 2. 전달된 파일명 수정 후 서버에 업로드 작업 (MultipartRequest 객체 생성)
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 3. 요청시 전달된 값들 뽑아서 vo에 주섬주섬 담기 (DB에 기록할 데이터들뽑기)
			// 3_1. Board테이블 insert할 카테고리번호, 게시판제목, 게시판내용, 작성자회원번호를 adCenterNotice객체에담기
			String noticeTitle = multiRequest.getParameter("noticeTitle"); 
			int userNo = Integer.parseInt(multiRequest.getParameter("userNo")); 
			String noticeContent = multiRequest.getParameter("noticeContent");
			String status = multiRequest.getParameter("status");
			
			
			
			adCenterNotice n = new adCenterNotice();
			n.setNoticeTitle(noticeTitle);
			n.setUserNo(userNo);
			n.setNoticeContent(noticeContent);
			n.setStatus(status); 
			
			// 3_2. 첨부파일이 있다면 centerNoticeFile테이블에 Insert할 원본명, 수정명, 저장폴더경로를 Attachment객체에 담기
			//System.out.println(multiRequest.getOriginalFileName("upfile")); 
			
			
			centerNoticeFile fi = null; // 처음엔 null로 초기화, 넘어온 첨부파일이 있다면 그 때 생성
			
			if(multiRequest.getOriginalFileName("upfile") != null) { // 넘어온 첨부파일이 존재할 경우
				
				fi = new centerNoticeFile();
				// 원본명, 수정명(실제서버에업로드된파일명), 저장된폴더경로
				fi.setFileName(multiRequest.getOriginalFileName("upfile"));
				fi.setFileUpdate(multiRequest.getFilesystemName("upfile"));
				fi.setFilePath("resources/file/center/centerNotice_upfiles/");
				
				
				
			}
			
			
			
			// 4. 게시판 작성용 서비스 요청 및 결과 받기
			int result = new adCenterService().insertNotice(n, fi);
			// case 1 : 첨부파일이 있었을 경우 => insertBoard(생성된 Board객체, 생성된 Attachment 객체)
			// case 2 : 첨부파일이 없었을 경우 => insertBoard(생성된 Board객체, null)
			
			if(result > 0) { //  성공 => list.bo?currentPage=1 url재요청 => 게시판 리스트 페이지
				
				request.getSession().setAttribute("alertMsg", "게시글 등록에 성공했습니다");
				response.sendRedirect(request.getContextPath()+ "/ctNotice.ad?currentPage=1");
				
			} else { // 실패
				
				request.setAttribute("errorMsg", "게시글 등록실패!");
				request.getRequestDispatcher("views/common/errorPage/jsp").forward(request, response);
				
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
