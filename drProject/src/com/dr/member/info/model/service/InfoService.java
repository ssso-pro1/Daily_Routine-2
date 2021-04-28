package com.dr.member.info.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.dr.common.model.vo.PageInfo;
import com.dr.member.comm.model.dao.CommDao;
import com.dr.member.comm.model.vo.Comm;
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
	
	public InfoFile selectWorkoutFile(int intPostNo) {
		
		Connection conn = getConnection();
		InfoFile inf = new InfoDao().selectWorkoutFile(conn, intPostNo); 
		
		close(conn);
		
		return inf; 
		
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
	
	public InfoFile selectMenuFile(int intPostNo) {
		
		Connection conn = getConnection();
		InfoFile inf = new InfoDao().selectMenuFile(conn, intPostNo); 
		
		close(conn);
		
		return inf; 
		
	}
	
	
	// workout 검색	
	public int searchWorkoutCount(String searchWorkoutCtg, String searchWorkoutText) {
		
		Connection conn = getConnection();	
		int listCount = new InfoDao().searchWorkoutCount(conn, searchWorkoutCtg, searchWorkoutText);
		
		close(conn);
		
		return listCount; 
		
	}
	
	public ArrayList<Info> searchWorkoutList(PageInfo pi, String searchWorkoutCtg, String searchWorkoutText) {
		
		Connection conn = getConnection();
		ArrayList<Info> list = new InfoDao().searchWorkoutList(conn, pi, searchWorkoutCtg, searchWorkoutText);
		
		close(conn);
		
		return list; 
		
	}
	
	
	// menu 검색 	
	public int searchMenuCount(String searchMenuCtg, String searchMenuText) {
		
		Connection conn = getConnection();	
		int listCount = new InfoDao().searchMenuCount(conn, searchMenuCtg, searchMenuText);
		
		close(conn);
		
		return listCount; 
		
	}
	
	public ArrayList<Info> searchMenuList(PageInfo pi, String searchMenuCtg, String searchMenuText) {
		
		Connection conn = getConnection();
		ArrayList<Info> list = new InfoDao().searchMenuList(conn, pi, searchMenuCtg, searchMenuText);
		
		close(conn);
		
		return list; 
		
	}
	
	
	// mainPage 최신인기글 list
	public ArrayList<Info> mainList() {
		
		Connection conn = getConnection(); 
		ArrayList<Info> list = new InfoDao().mainList(conn); 
		
		close(conn);
		
		return list; 
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
