package com.dr.member.comm.controller;

import java.io.File;
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
 * Servlet implementation class CommTipUpdateServlet
 */
@WebServlet("/tipUpdate.co")
public class CommTipUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommTipUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8"); 
		
		if(ServletFileUpload.isMultipartContent(request)) { 
			
			// 1_1. 전송되는 파일의 용량 제한 
			int maxSize = 10 * 1024 * 1024; // 10Mb
			// 1_2. 전송되는 파일을 저장시킬 서버의 폴더 물리적 경로 (String savePath) 
			String savePath = request.getSession().getServletContext().getRealPath("/resources/file/comm/commTip_upfiles/");
			
			// 2. HttpServletRequest request => MultipartRequest multiRequest 변환 
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 3. sql문을 실행하기 위해 요청 시 전달된 값 뽑기 
			// 3_1. 첨부파일과 무관하게 Comm 테이블에 Update할 값 뽑기 
			int commPostNo = Integer.parseInt(multiRequest.getParameter("cno"));
			String categoryName = multiRequest.getParameter("category"); 
			String postTitle = multiRequest.getParameter("title");
			String postContent = multiRequest.getParameter("content"); 
			
			Comm c = new Comm();
			c.setCommPostNo(commPostNo);
			c.setCategoryName(categoryName);
			c.setPostTitle(postTitle);
			c.setPostContent(postContent);
			
			// 3_2. 첨부파일 관련한 CommFile 테이블에 Update 또는 Insert할 값을 CommFile 객체에 담기 
			// 		=> 여러 개의 첨부파일을 담을 것이므로 CommFile 객체를 ArrayList에 담을 것! 
			ArrayList<CommFile> list = new ArrayList<>();
			
			for(int i=1; i<=3; i++) {
				
				String key = "reUpfile" + i; 
						
				// 새로 넘어온 첨부파일이 있을 경우 
				if(multiRequest.getOriginalFileName("reUpfile") != null) {

					// 기존의 첨부파일 유무를 떠나 무조건 db에 기록할 값 3개 
					CommFile cf = new CommFile();
					cf.setFileName(multiRequest.getOriginalFileName("reUpfile"));
					cf.setFileUpdate(multiRequest.getFilesystemName("reUpfile"));
					cf.setFilePath("resources/file/comm/commTip_upfiles/");
					
					// 새로운 첨부파일이 있고, 기존의 첨부파일이 있을 경우 
					if(multiRequest.getParameter("originFileNo") != null) {
						
						// => CommFile Update + 기존의 첨부파일 고유번호 
						cf.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
						
						// 서버에 업로드되어있던 기존의 첨부파일 찾아서 폴더에서 삭제 
						new File(savePath + multiRequest.getParameter("originFileName")).delete(); 
						
					}else {
						// 새로운 첨부파일이 있고, 기존의 첨부파일이 없을 경우 
						// => CommFile Insert + 수정하고 있는 게시글번호 
						cf.setCommPostNo(commPostNo); 
					}
					
					list.add(cf); 
					
				}
			}

			// 4. 게시판 작성용 서비스 요청 및 결과 받기 
			int result = new CommService().updateCommTip(c, list); 
			// case 1 : 새로운 첨부파일 x 				  => updateComm(c, null)  				=> Comm update
			// case 2 : 새로운 첨부파일 o, 기존의 첨부파일 o  => updateComm(c, fileNo이 담긴 cf)  	=> Comm Update, CommFile Update
			// case 3 : 새로운 첨부파일 o, 기존의 첨부파일 x  => updateComm(c, commPostNo이 담긴 cf)  => Comm Update, CommFile Insert  
				
			if(result > 0) { // 성공 => 해당 게시글 상세조회 페이지 
				request.getSession().setAttribute("alertMsg", "게시글이 수정되었습니다.");
				response.sendRedirect(request.getContextPath() + "/tipDetail.co?cno=" + commPostNo);
					
			}else { // 실패 => 에러 문구 담아서 에러 페이지 포워딩 
				request.setAttribute("errorMsg", "게시글 수정 실패했습니다.");
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
