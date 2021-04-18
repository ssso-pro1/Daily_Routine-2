package com.dr.member.comm.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.dr.common.model.vo.PageInfo;
import com.dr.member.comm.model.dao.CommDao;
import com.dr.member.comm.model.vo.Comm;
import com.dr.member.comm.model.vo.CommFile;

import static com.dr.common.JDBCTemplate.*; 

public class CommService {
	
	public int tipselectListCount() {
		
		Connection conn = getConnection();
		int listCount = new CommDao().tipselectListCount(conn); 
		
		close(conn);
		
		return listCount; 

	}
	
	public ArrayList<Comm> tipselectList(PageInfo pi) {
		// 조회문 
		Connection conn = getConnection();
		ArrayList<Comm> list = new CommDao().tipselectList(conn, pi); 
		close(conn);
		return list; 
		
	}
	
	public int insertCommTip(Comm c, ArrayList<CommFile> list) {
		
		Connection conn = getConnection();
		
		int result1 = new CommDao().insertCommTip(conn, c); 
		int result2 = new CommDao().insertCommFileList(conn, list); 
		
		if(result1 > 0 && result2 > 0) { 
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2; 
				
	}
	
	
	
	
	
}
