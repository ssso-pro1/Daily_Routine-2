package com.dr.member.user.model.service;

import com.dr.common.JDBCTemplate;
import com.dr.member.user.model.dao.UserDao;
import com.dr.member.user.model.vo.User;
import com.sun.corba.se.pept.transport.Connection;

public class UserService {

	/**
	 * 1. 로그인하기
	 */
	public User loginUser(String userId, String userPwd) {
		Connection conn = JDBCTemplate.getConnection();
		
		User loginUser = new UserDao().loginUser(conn, userId, userPwd);
		
		return loginUser;
	}
}
