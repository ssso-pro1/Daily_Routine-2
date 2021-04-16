package com.dr.member.comm.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

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
	
	public int selectListcount(Connection conn) {
		// select문 
		int listCount = 0; 
		
		PreparedStatement pstmt = null; 
		ResultSet rset = null; 
		
		String sql = prop.getProperty("selectListcount");
		
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
	
	
	
}
