package com.dr.member.user.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;


import static com.dr.common.JDBCTemplate.*;
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
	
	/**
	 * 1. 로그인
	 */
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
						     rset.getString("user_id"),
						     rset.getString("user_pwd"),
						     rset.getString("user_name"),
						     rset.getString("birth"),
						     rset.getString("gender"),
						     rset.getString("email"),
						     rset.getString("phone"),
						     rset.getDate("enroll_date"),
						     rset.getString("leave_check"),
						     rset.getString("suspended"),
						     rset.getString("report_check"),
						     rset.getString("admin_check"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
		close(rset);
		close(pstmt);
	}
	return u;
	
	}
	
	
	/**
	 * 2. 회원가입
	 */
	public int insertUser(Connection conn, User u) {
		//insert문 => DML 처리된 행수 
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, u.getUserId());
			pstmt.setString(2, u.getUserPwd());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	

	
	
	
	
	}

