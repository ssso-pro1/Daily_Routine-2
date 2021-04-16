package com.dr.member.user.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.dr.common.JDBCTemplate;
import com.dr.common.JDBCTemplate.*;
import com.dr.member.user.model.vo.User;

public class UserDao {

	private Properties prop = new Properties();
	
	public UserDao() {
		
		String fileName = UserDao.class.getResource("/sql/user/user-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public User loginUser(Connection conn, String userId, String userPwd) {
		// select 문 => resultSet 객체 (한행) => User객체
		
		User u = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				u = new User(rset.getInt("user_no"),
						     rset.getString("userId"),
						     rset.getString("userPwd"),
						     rset.getString("userName"),
						     rset.getString("birth"),
						     rset.getString("gender"),
						     rset.getString("email"),
						     rset.getString("phone"),
						     rset.getDate("enrollDate"),
						     rset.getString("leaveCheck"),
						     rset.getString("suspended"),
						     rset.getString("reportCheck"),
						     rset.getString("adminCheck"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
	}
	return u;
	
	
	
	
	
	}
}
