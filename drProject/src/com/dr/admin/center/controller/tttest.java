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
@WebServlet("/")
public class tttest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public tttest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("utf-8");
		
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			
			
			int maxSize = 10*1024*1024;
			
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/file/center/centerNotice_upfiles/");
			
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			
			String noticeTitle = multiRequest.getParameter("noticeTitle"); 
			int userNo = Integer.parseInt(multiRequest.getParameter("userNo")); 
			String noticeContent = multiRequest.getParameter("noticeContent");
			String status = multiRequest.getParameter("status");
			
			
			
			adCenterNotice n = new adCenterNotice();
			n.setNoticeTitle(noticeTitle);
			n.setUserNo(userNo);
			n.setNoticeContent(noticeContent);
			n.setStatus(status);
			
			
			
			centerNoticeFile fi = null; 
			
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
				
				//request.getSession().setAttribute("alertMsg", "게시글 등록성공!!");
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
