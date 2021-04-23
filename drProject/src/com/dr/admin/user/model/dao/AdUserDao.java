package com.dr.admin.user.model.dao;
import static com.dr.common.JDBCTemplate.*;

import static com.dr.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.dr.admin.user.model.vo.AdUser;
import com.dr.common.model.vo.PageInfo;
import com.dr.member.user.model.dao.UserDao;
import com.dr.member.user.model.vo.User;

public class AdUserDao {

private Properties prop = new Properties();
	
	public AdUserDao() {
		
		String fileName = UserDao.class.getResource("/sql/admin/user/adUser-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 1. 로그인
	 */
	public AdUser loginUser(Connection conn, String userId, String userPwd) {
		// select 문 => resultSet 객체 (한행) => User객체
		
		AdUser u = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				u = new AdUser(rset.getInt("user_no"),
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
	 * 1. 회원전체 조회 : 갯수 조회
	 */
	public int selectListCount(Connection conn) {
		//select 문 => rset => 여러행
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
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
	
	/**
	 * 1. 회원 전체 조회
	 */
	public ArrayList<AdUser> selectList(Connection conn, PageInfo pi){
		//select 문 여러행 resultSet
		
		ArrayList<AdUser> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1);
			pstmt.setInt(2, pi.getCurrentPage() * pi.getBoardLimit());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new AdUser(rset.getInt("user_no"),
						  		  rset.getString("user_id"),
						  		  rset.getString("user_name"),
						  		  rset.getString("gender"),
						  		  rset.getString("phone"),
						  		  rset.getDate("enroll_date"),
						  		  rset.getString("leave_check")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
		
		
	}

	
	/**
	 * 2. 관리자 - 회원 탈퇴시키기
	 */
	public int deleteUser(Connection conn, String userId, String userPwd) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("adDeleteUser");
		
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
