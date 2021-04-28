package com.dr.admin.info.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.dr.admin.info.model.service.adInfoService;
import com.dr.admin.info.model.vo.adInfo;
import com.dr.admin.info.model.vo.adInfoFile;
import com.dr.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class adInfoInsertServlet
 */
@WebServlet("/infoInsert.ad")
public class adInfoInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adInfoInsertServlet() {
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
			
			// 1_2. 전달된 파일을 저장할 서버의 폴더 경로 알아내기 (String savePath)
			String savePath = request.getSession().getServletContext().getRealPath("/resources/file/admin/adInfo_upfiles/");
			
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 3. 요청시 전달된 값들 뽑아서 vo에  담기 (DB에 기록할 데이터들뽑기)
			String infoTitle = multiRequest.getParameter("infoTitle"); 
			int userNo = Integer.parseInt(multiRequest.getParameter("userNo")); 
			String infoContent = multiRequest.getParameter("infoContent");
			String catogory = multiRequest.getParameter("category");
			String status = multiRequest.getParameter("status");
			
			
			
			adInfo i = new adInfo();
			i.setPostTitle(infoTitle);
			i.setUserNo(userNo);
			i.setPostContent(infoContent);
			i.setCategoryName(catogory);
			i.setStatus(status);
			
			// 3_2. 첨부파일이 있다면 centerNoticeFile테이블에 Insert할 원본명, 수정명, 저장폴더경로를 Attachment객체에 담기
			//System.out.println(multiRequest.getOriginalFileName("upfile"));
			
			adInfoFile fi = null; // 처음엔 null로 초기화, 넘어온 첨부파일이 있다면 그 때 생성
			
			if(multiRequest.getOriginalFileName("upfile") != null) { // 넘어온 첨부파일이 존재할 경우
				
				fi = new adInfoFile();
				// 원본명, 수정명(실제서버에업로드된파일명), 저장된폴더경로
				fi.setFileName(multiRequest.getOriginalFileName("upfile"));
				fi.setFileUpdate(multiRequest.getFilesystemName("upfile"));
				fi.setFilePath("resources/file/admin/adInfo_upfiles/");
				
				
				
			}
			
			
			
			// 4. 게시판 작성용 서비스 요청 및 결과 받기
			int result = new adInfoService().insertInfo(i, fi);
			// case 1 : 첨부파일이 있었을 경우 => insertBoard(생성된 Board객체, 생성된 Attachment 객체)
			// case 2 : 첨부파일이 없었을 경우 => insertBoard(생성된 Board객체, null)
			
			if(result > 0) { //  성공 
				
				request.getSession().setAttribute("alertMsg", "게시글 등록에 성공했습니다");
				response.sendRedirect(request.getContextPath()+ "/info.ad?currentPage=1");
				
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
