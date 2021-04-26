package com.dr.member.info.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.dr.common.model.vo.PageInfo;
import com.dr.member.info.model.dao.InfoDao;
import com.dr.member.info.model.vo.Info;
import com.dr.member.info.model.vo.InfoFile;

import static com.dr.common.JDBCTemplate.*; 

public class InfoService {
	
	// 운동 게시판 
	public int selectWorkoutListCount() {
		
		Connection conn = getConnection();
		int listCount = new InfoDao().selectWorkoutListCount(conn); 
		
		close(conn); 
		
		return listCount; 
		
	}
	
	public ArrayList<Info> selectWorkoutThumbnailList(PageInfo pi) {
		
		Connection conn = getConnection(); 
		ArrayList<Info> list = new InfoDao().selectWorkoutThumbnailList(conn, pi); 
		
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
	
	public Info selectWorkout(int intPostNo) {
		
		Connection conn = getConnection();
		Info i = new InfoDao().selectWorkout(conn, intPostNo); 
		
		close(conn);
		
		return i; 
		
	}
	
	public ArrayList<InfoFile> selectWorkoutFileList(int intPostNo) {
		
		Connection conn = getConnection();
		ArrayList<InfoFile> list = new InfoDao().selectWorkoutFileList(conn, intPostNo); 
		
		close(conn);
		
		return list; 
		
	}
	
	
	
	
	// 식단 게시판 
	public int selectMenuListCount() {
		
		Connection conn = getConnection();
		int listCount = new InfoDao().selectMenuListCount(conn); 
		
		close(conn); 
		
		return listCount; 
		
	}
	
	public ArrayList<Info> selectMenuThumbnailList(PageInfo pi) {
		
		Connection conn = getConnection(); 
		ArrayList<Info> list = new InfoDao().selectMenuThumbnailList(conn, pi); 
		
		close(conn);
		
		return list; 
		
	}
	
	public Info selectMenu(int intPostNo) {
		
		Connection conn = getConnection();
		Info i = new InfoDao().selectMenu(conn, intPostNo); 
		
		close(conn);
		
		return i; 
		
	}
	
	public ArrayList<InfoFile> selectMenuFileList(int intPostNo) {
		
		Connection conn = getConnection();
		ArrayList<InfoFile> list = new InfoDao().selectMenuFileList(conn, intPostNo); 
		
		close(conn);
		
		return list; 
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
