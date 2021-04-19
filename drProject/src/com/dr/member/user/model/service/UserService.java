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
	
	
	
	
}
