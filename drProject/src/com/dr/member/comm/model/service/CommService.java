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
	
	public int increaseCount(int commPostNo) {
		
		Connection conn = getConnection();
		int result = new CommDao().increaseCount(conn, commPostNo); 
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	public Comm selectCommTip(int commPostNo) {
		
		Connection conn = getConnection();
		Comm c = new CommDao().selectCommTip(conn, commPostNo); 
		
		close(conn);
		
		return c; 
		
	}
	
	public ArrayList<CommFile> selectCommTipFileList(int commPostNo) {
	
		Connection conn = getConnection();
		ArrayList<CommFile> list = new CommDao().selectCommTipFileList(conn, commPostNo); 
		
		close(conn);
		
		return list;
		
	}
	
	public int updateCommTip(Comm c, ArrayList<CommFile> list) {
		// 하나의 서비스에 2개의 Dao 호출 
		Connection conn = getConnection();
		
		int result1 = new CommDao().updateCommTip(conn, c);
		int result2 = new CommDao().updateCommFileList(conn, list); 
		
		// 새로운 첨부파일이 있을 경우 
		if(list != null) { 
			
			// 기존의 첨부파일이 있을 경우 => CommFile Update  
			if(list.getFileNo() != 0) { 
				result2 = new CommDao().updateCommFileList(conn, list);
			// 기존의 첨부파일이 없을 경우 => CommFile Insert 
			}else {
				result2 = new CommDao().insertNewCommFile(conn, list); 
			}
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn); 
		}

		close(conn);
		
		return result1 * result2; 
		
	}
	
	
	
	
	
	
	
	
	
}
