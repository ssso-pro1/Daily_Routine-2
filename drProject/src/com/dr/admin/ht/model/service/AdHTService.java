package com.dr.admin.ht.model.service;

import static com.dr.common.JDBCTemplate.close;
import static com.dr.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.dr.member.ht.model.dao.AdHTDao;

public class AdHTService {

	/**
	 * 1. 홈트 게시글 리스트 갯수
	 */
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new AdHTDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
}
