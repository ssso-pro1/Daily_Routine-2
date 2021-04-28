package com.dr.admin.info.controller;

import java.io.File;
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
 * Servlet implementation class adInfoUpdateServlet
 */
@WebServlet("/infoUpdate.ad")
public class adInfoUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adInfoUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			
			int maxSize = 10 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/file/admin/adInfo_upfiles/");
			
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			
			int infoNo = Integer.parseInt(multiRequest.getParameter("ino"));
			String infoTitle = multiRequest.getParameter("infoTitle");
			String infoContent = multiRequest.getParameter("infoContent");
			String catogory = multiRequest.getParameter("category");
			String status = multiRequest.getParameter("status");
			
			adInfo i = new adInfo();
			i.setIntPostNo(infoNo);
			i.setPostTitle(infoTitle);
			i.setPostContent(infoContent);
			i.setCategoryName(catogory);
			i.setStatus(status);
			
			
			
			
			adInfoFile fi = null;
			
			// 새로이 넘어온 첨부파일이 있을 경우
			if(multiRequest.getOriginalFileName("reUpfile") !=null) {
				
				fi = new adInfoFile();
				fi.setFileName(multiRequest.getOriginalFileName("reUpfile"));
				fi.setFileUpdate(multiRequest.getFilesystemName("reUpfile"));
				fi.setFilePath("resources/file/admin/adInfo_upfiles/");
				// 위의 3개는 기존의 첨부파일이 있었든 없었든간에 무조건 db에 기록할 값
				
				if(multiRequest.getParameter("originFileNo") !=null) {
					
					fi.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
					
					// 기존의 첨부파일 찾아서 폴더에서 삭제
					new File(savePath + multiRequest.getParameter("originFileName")).delete();
					
				} else {
					// 새로운 첨부파일이 있고, 기존의 첨부파일이 없었을경우
					// => Attachement Insert
					//	+ 수정하고있는 게시글번호
					fi.setIntPostNo(infoNo);
					
				}
			}
			
			
			int result = new adInfoService().updateInfo(i, fi);
			// case1 : 새로운 첨부파일 x					=> updateBoard(b, null)				=> Board Update
			// case2 : 새로운 첨부파일 o, 기존의 첨부파일 o	=> updateBoard(b, fileNo담긴at)		=> Board Update, Attachment Update
			// case3 : 새로운 첨부파일 o, 기존의 첨부파일 x 	=> updateBoard(b, refBoardNo담긴at)	=> Board Update, Attachement Insert
			
			if(result > 0) { // 성공 => /detail.no?bno=해당글번호 url재요청 => 해당게시글상세조회페이지
				request.getSession().setAttribute("alertMsg", "게시글 수정 성공");
				response.sendRedirect(request.getContextPath() + "/infoDetail.ad?ino=" + infoNo);
				
			}else { // 실패 => 에러문구 담아서 에러페이지 포워딩
				request.setAttribute("errorMsg", "게시글수정실패");
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
