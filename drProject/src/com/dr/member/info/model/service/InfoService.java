package com.dr.member.info.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.dr.common.model.vo.PageInfo;
import com.dr.member.comm.model.dao.CommDao;
import com.dr.member.comm.model.vo.CommFile;
import com.dr.member.info.model.dao.InfoDao;
import com.dr.member.info.model.vo.Info;
import com.dr.member.info.model.vo.InfoFile;

import static com.dr.common.JDBCTemplate.*; 

public class InfoService {
	
	// 운동 게시판 
	public int workoutSelectListCount() {
		
		Connection conn = getConnection();
		int listCount = new InfoDao().workoutSelectListCount(conn); 
		
		close(conn); 
		
		return listCount; 
		
	}
	
	public ArrayList<Info> workoutSelectThumbnailList(PageInfo pi) {
		
		Connection conn = getConnection(); 
		ArrayList<Info> list = new InfoDao().workoutSelectThumbnailList(conn, pi); 
		
		close(conn);
		
		return list; 
		
	}
	
	public int increaseCount(int intPostNo) {
		
		Connection conn = getConnection();
		int result = new InfoDao().increaseCount(conn, intPostNo); 
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	} 
	
	
	
	
	
	
	// 식단 게시판 
	public int menuSelectListCount() {
		
		Connection conn = getConnection();
		int listCount = new InfoDao().menuSelectListCount(conn); 
		
		close(conn); 
		
		return listCount; 
		
	}
	
	public ArrayList<Info> menuSelectThumbnailList(PageInfo pi) {
		
		Connection conn = getConnection(); 
		ArrayList<Info> list = new InfoDao().menuSelectThumbnailList(conn, pi); 
		
		close(conn);
		
		return list; 
		
	}
	
	
	
	
	
	
	// 전체 게시판 
	public int mainSelectListCount() {
		
		Connection conn = getConnection();
		int listCount = new InfoDao().mainSelectListCount(conn); 
		
		close(conn); 
		
		return listCount; 
		
	}
	
	public ArrayList<Info> mainSelectThumbnailList(PageInfo pi) {
		
		Connection conn = getConnection(); 
		ArrayList<Info> list = new InfoDao().mainSelectThumbnailList(conn, pi); 
		
		close(conn);
		
		return list; 
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
