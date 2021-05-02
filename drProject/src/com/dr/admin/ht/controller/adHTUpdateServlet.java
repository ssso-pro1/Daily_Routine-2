package com.dr.admin.ht.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.dr.admin.ht.model.service.adHTService;
import com.dr.admin.ht.model.vo.adHT;
import com.dr.admin.info.model.service.adInfoService;
import com.dr.admin.info.model.vo.adInfo;
import com.dr.admin.info.model.vo.adInfoFile;
import com.dr.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class adHTUpdateServlet
 */
@WebServlet("/htUpdate.aht")
public class adHTUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adHTUpdateServlet() {
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
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/file/admin/adHT_upfiles/");
			
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			int userNo = Integer.parseInt(multiRequest.getParameter("userNo")); 
			int htNo = Integer.parseInt(multiRequest.getParameter("hno"));
			String title = multiRequest.getParameter("title"); 
			String content = multiRequest.getParameter("content");
			String catogory = multiRequest.getParameter("category");
			String status = multiRequest.getParameter("status");
			
			
			
			adHT t = new adHT();
			t.setUserNo(userNo);
			t.setHtPostNo(htNo);
			t.setHtPostTitle(title);
			t.setHtPostContent(content);
			t.setCategoryName(catogory);
			t.setStatus(status);
			
			
			
			
			
			
			// 새로이 넘어온 첨부파일이 있을 경우
			if(multiRequest.getOriginalFileName("reUpfile") !=null) {
				
				t.setFileName(multiRequest.getOriginalFileName("reUpfile"));
				t.setFileUpdate(multiRequest.getFilesystemName("reUpfile"));
				t.setFilePath("resources/file/admin/adHT_upfiles/");
			
			}
			
			int result = new adHTService().updateHT(t);
				
				
			if(result > 0) { //  성공 
					
				//request.getSession().setAttribute("alertMsg", "게시글 수정에 성공했습니다");
				response.sendRedirect(request.getContextPath()+ "/htDetail.aht?hno=" + htNo);
					
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
