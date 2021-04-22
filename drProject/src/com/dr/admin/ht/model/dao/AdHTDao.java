package com.dr.admin.ht.model.dao;

import static com.dr.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.dr.member.user.model.dao.UserDao;

public class AdHTDao {

	
	private Properties prop = new Properties();

	
	public AdHTDao() {
			
			String fileName = UserDao.class.getResource("/sql/admin/ht/adHT-mapper.xml").getPath();
	
			try {
				prop.loadFromXML(new FileInputStream(fileName)); //XMl파일 읽어들일 땐 그냥 load(X)
			} catch (IOException e) {
				e.printStackTrace();
			}  
	}
	
	/**
	 * 1. 홈트 게시글 리스트 갯수
	 */
	public int selectListCount(Connection conn) {
		//select문 => ResultSet (총게시글 갯수==정수)
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("LISTCOUNT"); //갯수조회값
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
