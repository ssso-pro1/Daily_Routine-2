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
	
	public ArrayList<Info> workoutSelectThumbnailList(Connection conn, PageInfo pi) {
		// select문 
		ArrayList<Info> list = new ArrayList<>(); 
		PreparedStatement pstmt = null; 
		ResultSet rset = null; 
		
		String sql = prop.getProperty("workoutSelectThumbnailList"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
			pstmt.setInt(2, pi.getCurrentPage() * pi.getBoardLimit());
			
			rset = pstmt.executeQuery(); 
			 
			while(rset.next()) {
				
				Info i = new Info();
				i.setIntPostNo(rset.getInt("int_post_no"));
				i.setPostTitle(rset.getString("post_title"));
				i.setEnrollDate(rset.getDate("enroll_date"));
				i.setBoardView(rset.getInt("board_view"));
				i.setLikeCount(rset.getInt("like_count"));
				i.setTitleImg(rset.getString("titleimg"));
				
				list.add(i); 
				
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
	
	public ArrayList<Info> menuSelectThumbnailList(Connection conn, PageInfo pi) {
		// select문 
		ArrayList<Info> list = new ArrayList<>(); 
		PreparedStatement pstmt = null; 
		ResultSet rset = null; 
		
		String sql = prop.getProperty("menuSelectThumbnailList"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
			pstmt.setInt(2, pi.getCurrentPage() * pi.getBoardLimit());
			
			rset = pstmt.executeQuery(); 
			 
			while(rset.next()) {
				
				Info i = new Info();
				i.setIntPostNo(rset.getInt("int_post_no"));
				i.setPostTitle(rset.getString("post_title"));
				i.setEnrollDate(rset.getDate("enroll_date"));
				i.setBoardView(rset.getInt("board_view"));
				i.setLikeCount(rset.getInt("like_count"));
				i.setTitleImg(rset.getString("titleimg"));
				
				list.add(i); 
				
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
	public int mainSelectListCount(Connection conn) { 
		// select문 
		int listCount = 0; 
		
		PreparedStatement pstmt = null; 
		ResultSet rset = null; 
		
		String sql = prop.getProperty("mainSelectListCount");
		
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
	
	public ArrayList<Info> mainSelectThumbnailList(Connection conn, PageInfo pi) {
		// select문 
		ArrayList<Info> list = new ArrayList<>(); 
		PreparedStatement pstmt = null; 
		ResultSet rset = null; 
		
		String sql = prop.getProperty("mainSelectThumbnailList"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
			pstmt.setInt(2, pi.getCurrentPage() * pi.getBoardLimit());
			
			rset = pstmt.executeQuery(); 
			 
			while(rset.next()) {
				
				Info i = new Info();
				i.setIntPostNo(rset.getInt("int_post_no"));
				i.setPostTitle(rset.getString("category_name"));
				i.setPostTitle(rset.getString("post_title"));
				i.setEnrollDate(rset.getDate("enroll_date"));
				i.setBoardView(rset.getInt("board_view"));
				i.setLikeCount(rset.getInt("like_count"));
				i.setTitleImg(rset.getString("titleimg"));
				
				list.add(i); 
				
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
