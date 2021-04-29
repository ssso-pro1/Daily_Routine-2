package com.dr.admin.info.model.service;

import static com.dr.common.JDBCTemplate.close;
import static com.dr.common.JDBCTemplate.commit;
import static com.dr.common.JDBCTemplate.getConnection;
import static com.dr.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;


import com.dr.admin.info.model.dao.adInfoDao;
import com.dr.admin.info.model.vo.adInfo;
import com.dr.admin.info.model.vo.adInfoFile;
import com.dr.common.model.vo.PageInfo;


public class adInfoService {

	//전체게시글 카운트
	public int infoSelectListCountAll() {
		Connection conn = getConnection();
		
		int listCount = new adInfoDao().InfoSelectListCountAll(conn);
		
		close(conn);
		return listCount;
	}	

	// 전체게시글 리스트
	public ArrayList<adInfo> InfoSelectListAll(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList <adInfo> list = new adInfoDao().InfoSelectListAll(conn, pi);
		close(conn);
		return list;
		
	}	
	
	
	
	//카테고리별 카운트
	public int infoSelectListCount(String category) {
		Connection conn = getConnection();
		
		int listCount = new adInfoDao().InfoSelectListCount(conn, category);
		
		close(conn);
		return listCount;
	}

	// 카테고리 리스트
	public ArrayList<adInfo> InfoSelectList(PageInfo pi, String category) {
		Connection conn = getConnection();
		ArrayList <adInfo> list = new adInfoDao().InfoSelectList(conn, pi, category);
		close(conn);
		return list;
		
	}

	// 글삭제 메소드
	public int deleteInfo(String[] infoNo) {
		Connection conn = getConnection();
		int result = new adInfoDao().deleteInfo(conn, infoNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		} return result;
		
	}

	//글쓰기
	public int insertInfo(adInfo i, adInfoFile fi) {
		Connection conn = getConnection();
		
		int result1 = new adInfoDao().insertInfo(conn, i);
		
		int result2 = 1;
		if(fi != null) { // 첨부파일이 있었을 경우 
			result2 = new adInfoDao().insertAttachment(conn, fi);
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
	}

	//게시글 조회
	public int infoIncreaseCount(int infoNo) {
		Connection conn = getConnection();
		
		int result = new adInfoDao().infoIncreaseCount(conn, infoNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
		
	}

	public adInfo selectInfo(int infoNo) {
		Connection conn = getConnection();
		
		adInfo i = new adInfoDao().selectInfo(conn, infoNo);
		close(conn);
		return i;
		
	}

	public adInfoFile selectAttachment(int infoNo) {
		Connection conn = getConnection();
		adInfoFile fi = new adInfoDao().selectAttachment(conn, infoNo);
		close(conn);
		return fi;
	}

	public int updateInfo(adInfo i, adInfoFile fi) {
		Connection conn = getConnection();
		
		int result1 = new adInfoDao().updateInfo(conn, i);
		
		int result2 = 1;
		if(fi !=null) { // 새로운 첨부파일이 있을경우
			if(fi.getFileNo() !=0) { 
				// 기존dml 첨부파일이 있었을 경우 => Attachment Update
				result2 = new adInfoDao().updateAttachment(conn, fi);
				
			} else {
				// 기존의 첨부파일이 없었을 경우 => Attachment Insert
				result2 = new adInfoDao().insertNewAttachment(conn, fi);
					
			}
			
			if(result1 > 0 && result2 > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
			close(conn);
			
		} return result1 * result2;
	}
}	
