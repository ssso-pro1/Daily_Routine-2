package com.dr.admin.ht.model.service;

import static com.dr.common.JDBCTemplate.close;
import static com.dr.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.dr.admin.ht.model.dao.AdHTDao;
import com.dr.admin.ht.model.vo.AdHT;
import com.dr.common.model.vo.PageInfo;

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
	
	/**
	 * 1. 홈트 게시글 전체 조회 
	 */
	public ArrayList<AdHT> selectList(PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<AdHT> list = new AdHTDao().selectList(conn, pi);
		
		close(conn);
		return list;
		
	}
}
