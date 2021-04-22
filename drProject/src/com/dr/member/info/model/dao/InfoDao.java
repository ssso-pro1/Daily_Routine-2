package com.dr.member.info.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.dr.common.model.vo.PageInfo;
import com.dr.member.info.model.vo.Info;
import com.dr.member.info.model.vo.InfoFile;

import static com.dr.common.JDBCTemplate.*; 

public class InfoDao {
	
	private Properties prop = new Properties(); 
	
	public InfoDao() {
		
		String fileName = InfoDao.class.getResource("/sql/info/info-mapper.xml").getPath();
	
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	}
	
	// 운동 게시판 
	public int workoutSelectListCount(Connection conn) { 
		// select문 
		int listCount = 0; 
		
		PreparedStatement pstmt = null; 
		ResultSet rset = null; 
		
		String sql = prop.getProperty("workoutSelectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery(); 
			
			if(rset.next()) { 
				listCount = rset.getInt("LISTCOUNT"); 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset); 
			close(pstmt); 
		}
		
		return listCount; 
		
	}
	
	public ArrayList<Info> workoutSelectList(Connection conn, PageInfo pi) {
		// select문 
		ArrayList<Info> list = new ArrayList<>(); 
		
		PreparedStatement pstmt = null; 
		ResultSet rset = null; 
		
		String sql = prop.getProperty("workoutSelectList"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
			pstmt.setInt(2, pi.getCurrentPage() * pi.getBoardLimit());
			
			rset = pstmt.executeQuery(); 
			 
			while(rset.next()) {
				list.add(new Info(rset.getInt("int_post_no"),
					   	          rset.getString("user_id"),
					   	          rset.getString("post_title"),
					   	          rset.getDate("enroll_date"),
					   	          rset.getInt("board_view"),
					   	          rset.getInt("like_count"))); 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset); 
			close(pstmt); 
		}
		
		return list; 
			
	}
	
	public int increaseCount(Connection conn, int intPostNo) {
		
		int result = 0; 
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, intPostNo);
			
			result = pstmt.executeUpdate(); 
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result; 
				
	} 
	
	
	
	
	
	
	
	// 식단 게시판 
	public int menuSelectListCount(Connection conn) { 
		// select문 
		int listCount = 0; 
		
		PreparedStatement pstmt = null; 
		ResultSet rset = null; 
		
		String sql = prop.getProperty("menuSelectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery(); 
			
			if(rset.next()) { 
				listCount = rset.getInt("LISTCOUNT"); 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset); 
			close(pstmt); 
		}
		
		return listCount; 
		
	}
	
	public ArrayList<Info> menuSelectList(Connection conn, PageInfo pi) {
		// select문 
		ArrayList<Info> list = new ArrayList<>(); 
		
		PreparedStatement pstmt = null; 
		ResultSet rset = null; 
		
		String sql = prop.getProperty("menuSelectList"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
			pstmt.setInt(2, pi.getCurrentPage() * pi.getBoardLimit());
			
			rset = pstmt.executeQuery(); 
			 
			while(rset.next()) {
				list.add(new Info(rset.getInt("int_post_no"),
					   	          rset.getString("user_id"),
					   	          rset.getString("post_title"),
					   	          rset.getDate("enroll_date"),
					   	          rset.getInt("board_view"),
					   	          rset.getInt("like_count"))); 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset); 
			close(pstmt); 
		}
		
		return list; 
			
	}
	
	
	
	
	
	
	
	
	
	
	
	
	// 전체 게시판 
	public int infoMainSelectListCount(Connection conn) { 
		// select문 
		int listCount = 0; 
		
		PreparedStatement pstmt = null; 
		ResultSet rset = null; 
		
		String sql = prop.getProperty("infoMainSelectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery(); 
			
			if(rset.next()) { 
				listCount = rset.getInt("LISTCOUNT"); 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset); 
			close(pstmt); 
		}
		
		return listCount; 
		
	}
	
	public ArrayList<Info> infoMainSelectList(Connection conn, PageInfo pi) {
		// select문 
		ArrayList<Info> list = new ArrayList<>(); 
		
		PreparedStatement pstmt = null; 
		ResultSet rset = null; 
		
		String sql = prop.getProperty("infoMainSelectList"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
			pstmt.setInt(2, pi.getCurrentPage() * pi.getBoardLimit());
			
			rset = pstmt.executeQuery(); 
			 
			while(rset.next()) {
				list.add(new Info(rset.getInt("int_post_no"),
					   	          rset.getString("user_id"),
					   	          rset.getString("category_name"),
					   	          rset.getString("post_title"),
					   	          rset.getDate("enroll_date"),
					   	          rset.getInt("board_view"),
					   	          rset.getInt("like_count"))); 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset); 
			close(pstmt); 
		}
		
		return list; 
			
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
