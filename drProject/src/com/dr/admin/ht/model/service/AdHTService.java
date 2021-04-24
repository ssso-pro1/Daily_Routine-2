package com.dr.admin.ht.model.service;

import static com.dr.common.JDBCTemplate.*;
import static com.dr.common.JDBCTemplate.commit;
import static com.dr.common.JDBCTemplate.getConnection;
import static com.dr.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import com.dr.admin.ht.model.dao.AdHTDao;
import com.dr.admin.ht.model.vo.AdHT;
import com.dr.admin.ht.model.vo.HTFile;
import com.dr.common.model.vo.PageInfo;

public class AdHTService {

	/**
	 * 1. 홈트 게시글 리스트 갯수
	 */
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new AdHTDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	/**
	 * 1. 홈트 게시글 전체 조회 
	 */
	public ArrayList<AdHT> selectList(PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<AdHT> list = new AdHTDao().selectList(conn, pi);
		
		close(conn);
		return list;
		
	}
	
	
	
	
	//insert1
	public int insertAdHT(AdHT a, ArrayList<HTFile> list) {
		
		Connection conn = getConnection();
		
		// AdHT에 insert먼저
		int result1 = new AdHTDao().insertAdHT(conn, a); //홈트테이블에 insert하는 dao메소드
		int result2 = new AdHTDao().insertHTFileList(conn, list);
		
			
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2;
	}
	
	
	
	
	
	
	
	
	
}
