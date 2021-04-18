package com.dr.member.comm.model.dao;

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
import com.dr.member.comm.model.vo.CommFile;

import static com.dr.common.JDBCTemplate.*; 

public class CommDao {
	
	private Properties prop = new Properties(); 
	
	public CommDao() {
		
		String fileName = CommDao.class.getResource("/sql/comm/comm-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public int tipselectListCount(Connection conn) {
		// select문 => ResultSet
		int listCount = 0; 
		
		PreparedStatement pstmt = null; 
		ResultSet rset = null; 
		
		String sql = prop.getProperty("tipselectListCount");
		
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
	
	public ArrayList<Comm> tipselectList(Connection conn, PageInfo pi) {
		// select문 => ResultSet (여러 행) 
		ArrayList<Comm> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("tipselectList"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
			pstmt.setInt(2, pi.getCurrentPage() * pi.getBoardLimit());
			
			rset = pstmt.executeQuery(); 
			
			while(rset.next()) { 
				list.add(new Comm(rset.getInt("comm_post_no"),
								  rset.getString("user_id"),
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
	
	public int insertCommTip(Connection conn, Comm c) {
		// insert문
		int result = 0; 
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCommTip"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getCategoryName());
			pstmt.setString(2, c.getPostTitle());
			pstmt.setString(3, c.getPostContent());
			pstmt.setString(4, c.getUserNo());
			
			result = pstmt.executeUpdate(); 
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt); 
		}
		
		return result;
		
	}
	
	public int insertCommFileList(Connection conn, ArrayList<CommFile> list) {
		// insert문 다수 
		int result = 0; 
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCommFileList"); // 미완성된 sql 
		
		try {
			
			for(CommFile cf : list) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, cf.getFileName());
				pstmt.setString(2, cf.getFileUpdate());
				pstmt.setString(3, cf.getFilePath());
				
				result = pstmt.executeUpdate(); 
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result; 
		
	}
	
	
	
	
	
	
	
}


