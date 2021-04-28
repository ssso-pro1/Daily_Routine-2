package com.dr.member.user.model.service;


import static com.dr.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.dr.admin.user.model.dao.AdUserDao;
import com.dr.admin.user.model.vo.AdUser;
import com.dr.common.model.vo.PageInfo;
import com.dr.member.user.model.dao.UserDao;
import com.dr.member.user.model.vo.User;

public class UserService {

	/**
	 * 1. 로그인
	 */
	public User loginUser(String userId, String userPwd) {
		Connection conn = getConnection();
		
		User loginUser = new UserDao().loginUser(conn, userId, userPwd);
		//System.out.println(loginUser);
		return loginUser;
	}
	
	/**
	 * 2. 회원가입
	 */
	public int insertUser(User u) {
		Connection conn = getConnection();
		
		int result = new UserDao().insertUser(conn, u);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/**
	 * 회원가입 시 아이디 중복체크
	 */
	public int idCheck(String checkId) {
		Connection conn = getConnection();
		
		int count = new UserDao().idCheck(conn, checkId);
		
		close(conn);
		return count;
	}

	
		
	/**
	 * email update
	 */
	public User updateEmailUser(String userId, String updateEmail) {
		Connection conn = getConnection();
		int result = new UserDao().updateEmailUser(conn, userId, updateEmail);
		
		User updateUser = null;
		if(result > 0) {
			commit(conn);
			
			updateUser = new UserDao().selectUser(conn, userId);
			// 바뀐거 새로 조회해주기
		}else {
			rollback(conn);
		}
		close(conn);
		return updateUser;
	}

	public User updatePhoneUser(String userId, String updatePhone) {
		Connection conn = getConnection();
		int result = new UserDao().updatePhoneUser(conn, userId, updatePhone);
		
		User updateUser = null;
		if(result > 0) {
			commit(conn);
			
			updateUser = new UserDao().selectUser(conn, userId);
			// 바뀐거 새로 조회해주기
		}else {
			rollback(conn);
		}
		close(conn);
		return updateUser;
	}

	public User updatePwdUser(String userId, String userPwd, String updatePwd) {
		Connection conn = getConnection();
		int result = new UserDao().updatePwdUser(conn, userId, userPwd, updatePwd);
	
		User updateUser = null;
		if(result > 0) { // 성공 => 갱신된 회원 객체 다시 조회
			commit(conn);
			
			updateUser = new UserDao().selectUser(conn, userId);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return updateUser;
	}

	public int deleteUser(String userId, String userPwd) {
		Connection conn = getConnection();
		
		int result = new UserDao().deleteUser(conn, userId, userPwd);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	
	
}
