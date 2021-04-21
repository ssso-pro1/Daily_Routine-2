package com.dr.member.user.model.service;


import static com.dr.common.JDBCTemplate.*;

import java.sql.Connection;

import com.dr.member.user.model.dao.UserDao;
import com.dr.member.user.model.vo.User;

public class UserService {

	/**
	 * 1. 로그인
	 */
	public User loginUser(String userId, String userPwd) {
		Connection conn = getConnection();
		
		User loginUser = new UserDao().loginUser(conn, userId, userPwd);
		
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
	
	
	
}
