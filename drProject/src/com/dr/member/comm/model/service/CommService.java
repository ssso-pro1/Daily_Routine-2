package com.dr.member.comm.model.service;

import java.sql.Connection;

import com.dr.member.comm.model.dao.CommDao;

import static com.dr.common.JDBCTemplate.*; 

public class CommService {
	
	public int selectListCount() {
		
		Connection conn = getConnection();
		int listCount = new CommDao().selectListcount(conn); 
		
		close(conn);
		
		return listCount; 

	}
	
}
