package com.dr.member.user.model.dao;

import static com.dr.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.dr.admin.user.model.dao.AdUser;
import com.dr.common.model.vo.PageInfo;
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
		
		System.out.println(userId);
		System.out.println(userPwd);
		
		User u = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginUser");
		
		System.out.println(sql);
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
			pstmt.setString(3, u.getUserName());
			pstmt.setString(4, u.getBirth());
			pstmt.setString(5, u.getGender());
			pstmt.setString(6, u.getEmail());
			pstmt.setString(7, u.getPhone());

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	/**
	 * 회원가입 시 아이디 중복체크
	 */
	public int idCheck(Connection conn, String checkId) {
		//select 문 => ResultSet 객체(한개의 값)
		int count = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("idCheck"); //받아온 값
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
		
		
	}

	
		
	
	
	public int updateEmailUser(Connection conn, String userId, String updateEmail) {
		// update문 
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateEmailUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, updateEmail);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public User selectUser(Connection conn, String userId) {
		// select
		User u = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
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
						     rset.getString("admin_check")
						    );
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return u;
		
	}

	public int updatePhoneUser(Connection conn, String userId, String updatePhone) {
		// update문 
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePhoneUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, updatePhone);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updatePwdUser(Connection conn, String userId, String userPwd, String updatePwd) {
		// update문 
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePwdUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, updatePwd);
			pstmt.setString(2, userId);
			pstmt.setString(3, userPwd);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteUser(Connection conn, String userId, String userPwd) {
		// update문  
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			result = pstmt.executeUpdate();
						
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	

	
	
	
	
	}

