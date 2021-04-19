package com.dr.admin.user.model.service;

import static com.dr.common.JDBCTemplate.close;
import static com.dr.common.JDBCTemplate.commit;
import static com.dr.common.JDBCTemplate.getConnection;
import static com.dr.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.dr.admin.user.model.dao.AdUserDao;

public class AdUserService {

	/**
	 * 1. 관리자- 회원 탈퇴시키기
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
