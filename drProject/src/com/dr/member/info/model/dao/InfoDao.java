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
import com.dr.member.comm.model.vo.Comm;
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
	public int selectWorkoutListCount(Connection conn) { 
		// select문 
		int listCount = 0; 
		
		PreparedStatement pstmt = null; 
		ResultSet rset = null; 
		
		String sql = prop.getProperty("selectWorkoutListCount");
		
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
	
	public ArrayList<Info> selectWorkoutThumbnailList(Connection conn, PageInfo pi) {
		// select문 
		ArrayList<Info> list = new ArrayList<>(); 
		PreparedStatement pstmt = null; 
		ResultSet rset = null; 
		
		String sql = prop.getProperty("selectWorkoutThumbnailList"); 
		
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
	
	public Info selectWorkout(Connection conn, int intPostNo) {
		// select문 
		Info i = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectWorkout");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, intPostNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				i = new Info(rset.getInt("int_post_no"),
							 rset.getString("post_content"),
							 rset.getString("post_title"),
							 rset.getDate("enroll_date"),
							 rset.getInt("board_view"),
							 rset.getInt("like_count"));
						
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return i; 
				
	}
	
	public InfoFile selectWorkoutFile(Connection conn, int intPostNo) {
		// select문 
		InfoFile inf = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectWorkoutFile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, intPostNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) { 
				inf = new InfoFile();
				inf.setFileNo(rset.getInt("file_no"));
				inf.setFileName(rset.getString("file_name"));
				inf.setFileUpdate(rset.getString("file_update"));
				inf.setFilePath(rset.getString("file_path"));	
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return inf; 		
		 
	}
	
	
	
	
	
	
	// 식단 게시판 
	public int selectMenuListCount(Connection conn) { 
		// select문 
		int listCount = 0; 
		
		PreparedStatement pstmt = null; 
		ResultSet rset = null; 
		
		String sql = prop.getProperty("selectMenuListCount");
		
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
	
	public ArrayList<Info> selectMenuThumbnailList(Connection conn, PageInfo pi) {
		// select문 
		ArrayList<Info> list = new ArrayList<>(); 
		PreparedStatement pstmt = null; 
		ResultSet rset = null; 
		
		String sql = prop.getProperty("selectMenuThumbnailList"); 
		
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
	
	public Info selectMenu(Connection conn, int intPostNo) {
		// select문 
		Info i = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMenu");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, intPostNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				i = new Info(rset.getInt("int_post_no"),
							 rset.getString("post_content"),
							 rset.getString("post_title"),
							 rset.getDate("enroll_date"),
							 rset.getInt("board_view"),
							 rset.getInt("like_count"));
						
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return i; 
				
	}
	
	public InfoFile selectMenuFile(Connection conn, int intPostNo) {
		// select문 
		InfoFile inf = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMenuFile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, intPostNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) { 
				inf = new InfoFile();
				inf.setFileNo(rset.getInt("file_no"));
				inf.setFileName(rset.getString("file_name"));
				inf.setFileUpdate(rset.getString("file_update"));
				inf.setFilePath(rset.getString("file_path"));	
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return inf; 		
		 
	}
	
	
	
	
	//mainPage 최신인기글 list
	public ArrayList<Info> mainList(Connection conn) {
		// select문 => 여러행 
		ArrayList<Info> list = new ArrayList<>(); 
		PreparedStatement pstmt = null; 
		ResultSet rset = null; 
		
		String sql = prop.getProperty("mainList"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) { 
	            list.add(new Info(rset.getInt("int_post_no"),
	                          	  rset.getString("category_name"),
	                              rset.getString("post_title"),
	                              rset.getDate("enroll_date"),
	                              rset.getInt("board_view"))); 
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
