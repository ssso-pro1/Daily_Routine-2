package com.dr.admin.user.model.service;
import static com.dr.common.JDBCTemplate.close;
import static com.dr.common.JDBCTemplate.commit;
import static com.dr.common.JDBCTemplate.getConnection;
import static com.dr.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.dr.admin.user.model.dao.AdUserDao;
import com.dr.common.model.vo.PageInfo;
import com.dr.member.user.model.vo.User;

public class AdUserService {

	/**
	 * 1. 로그인
	 */
	public User loginUser(String userId, String userPwd) {
		Connection conn = getConnection();
		
		User loginUser = new AdUserDao().loginUser(conn, userId, userPwd);
		return loginUser;
		
	}
	
	
	
	/**
	 * 1. 회원전체 조회 : 갯수 조회
	 */
	public int selectListCount() {
		Connection conn = getConnection();
		
		int listCount = new AdUserDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	/**
	 * 1. 회원 전체 조회
	 */
	public ArrayList<User> selectList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<User> list = new AdUserDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
		
	}
	
	
	
	/**
	 * 2. 관리자- 회원 탈퇴시키기
	 */
	public int deleteUser(String userId, String userPwd) {
		Connection conn = getConnection();
		
		int result = new AdUserDao().deleteUser(conn, userId, userPwd);
		
		if(result > 0 ) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	
	
}
