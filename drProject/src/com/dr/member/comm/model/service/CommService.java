package com.dr.member.comm.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.dr.common.model.vo.PageInfo;
import com.dr.member.comm.model.dao.CommDao;
import com.dr.member.comm.model.vo.Comm;
import com.dr.member.comm.model.vo.CommFile;
import com.dr.member.comm.model.vo.Reply;

import static com.dr.common.JDBCTemplate.*; 

public class CommService {
	
	// 나만의운동팁 게시판 
	
	public int tipSelectListCount() {
		
		Connection conn = getConnection();
		int listCount = new CommDao().tipSelectListCount(conn); 
		
		close(conn);
		
		return listCount; 

	}
	
	public ArrayList<Comm> tipSelectList(PageInfo pi) {
		// 조회문 
		Connection conn = getConnection();
		ArrayList<Comm> list = new CommDao().tipSelectList(conn, pi); 
		close(conn);
		return list; 
		
	}
 	
	public int insertCommTip(Comm c, CommFile cf) {
		
		Connection conn = getConnection();
		
		int result1 = new CommDao().insertCommTip(conn, c); 
		int result2 = 1; // 첨부파일이 없을 때도 result2를 1로 초기화하기 위해 1로 지정 
		
		if(cf != null) { // 첨부파일이 있던 경우 
			result2 = new CommDao().insertCommTipFile(conn, cf); 
		}
		
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
	
	public CommFile selectCommTipFile(int commPostNo) { 
		
		Connection conn = getConnection();
		CommFile cf = new CommDao().selectCommTipFile(conn, commPostNo); 
		
		close(conn);
		
		return cf; 
		
	}
	
	public int updateCommTip(Comm c, CommFile cf) { 
		
		Connection conn = getConnection();
		
		int result1 = new CommDao().updateCommTip(conn, c);
		int result2 = 1; 
		
		// 새로운 첨부파일이 있을 경우 
		if(cf != null) {
			// 기존의 첨부파일이 있을 경우 => CommFile Update 
			if(cf.getFileNo() != 0) {
				result2 = new CommDao().updateCommTipFile(conn, cf); 
			// 기존의 첨부파일이 없을 경우 => CommFile Insert 
			}else {
				result2 = new CommDao().insertNewCommTipFile(conn, cf); 
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
	
	public int deleteCommTip(int commPostNo) { 
		
		Connection conn = getConnection();
		int result = new CommDao().deleteCommTip(conn, commPostNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn); 
		}
		
		close(conn);
		
		return result; 
		
	}
	
	public ArrayList<Reply> selectTipReplyList(int commPostNo) { 
		
		Connection conn = getConnection();
		ArrayList<Reply> list = new CommDao().selectTipReplyList(conn, commPostNo); 
		
		close(conn);
		
		return list; 
		
	}
	
	
	// 자유게시판 
	
	public int freeSelectListCount() {
		
		Connection conn = getConnection();
		int listCount = new CommDao().freeSelectListCount(conn); 
		
		close(conn);
		
		return listCount; 

	}
	
	public ArrayList<Comm> freeSelectList(PageInfo pi) {
		// 조회문 
		Connection conn = getConnection();
		ArrayList<Comm> list = new CommDao().freeSelectList(conn, pi); 
		close(conn);
		return list; 
		
	}
	
	public int insertCommFree(Comm c, CommFile cf) {
		
		Connection conn = getConnection();
		
		int result1 = new CommDao().insertCommFree(conn, c); 
		int result2 = 1; // 첨부파일이 없을 때도 result2를 1로 초기화하기 위해 1로 지정 
		
		if(cf != null) { // 첨부파일이 있던 경우 
			result2 = new CommDao().insertCommFreeFile(conn, cf); 
		}
		
		if(result1 > 0 && result2 > 0) { 
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2; 
				
	}
	
	public Comm selectCommFree(int commPostNo) {
		
		Connection conn = getConnection();
		Comm c = new CommDao().selectCommFree(conn, commPostNo); 
		
		close(conn);
		
		return c; 
		
	}
	
	public CommFile selectCommFreeFile(int commPostNo) { 
		
		Connection conn = getConnection();
		CommFile cf = new CommDao().selectCommFreeFile(conn, commPostNo); 
		
		close(conn);
		
		return cf; 
		
	}
	
	public int updateCommFree(Comm c, CommFile cf) { 
		
		Connection conn = getConnection();
		
		int result1 = new CommDao().updateCommFree(conn, c);
		int result2 = 1; 
		
		// 새로운 첨부파일이 있을 경우 
		if(cf != null) {
			// 기존의 첨부파일이 있을 경우 => CommFile Update 
			if(cf.getFileNo() != 0) {
				result2 = new CommDao().updateCommFreeFile(conn, cf); 
			// 기존의 첨부파일이 없을 경우 => CommFile Insert 
			}else {
				result2 = new CommDao().insertNewCommFreeFile(conn, cf); 
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
	
	public int deleteCommFree(int commPostNo) { 
		
		Connection conn = getConnection();
		int result = new CommDao().deleteCommFree(conn, commPostNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn); 
		}
		
		close(conn);
		
		return result; 
		
	}
	
	
	
	// 질문게시판 
	
	public int qSelectListCount() {
		
		Connection conn = getConnection();
		int listCount = new CommDao().qSelectListCount(conn); 
		
		close(conn);
		
		return listCount; 

	}
	
	public ArrayList<Comm> qSelectList(PageInfo pi) {
		// 조회문 
		Connection conn = getConnection();
		ArrayList<Comm> list = new CommDao().qSelectList(conn, pi); 
		close(conn);
		return list; 
		
	}
	
	public int insertCommQ(Comm c, CommFile cf) {
		
		Connection conn = getConnection();
		
		int result1 = new CommDao().insertCommQ(conn, c); 
		int result2 = 1; // 첨부파일이 없을 때도 result2를 1로 초기화하기 위해 1로 지정 
		
		if(cf != null) { // 첨부파일이 있던 경우 
			result2 = new CommDao().insertCommQFile(conn, cf); 
		}
		
		if(result1 > 0 && result2 > 0) { 
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2; 
				
	}
	
	public Comm selectCommQ(int commPostNo) {
		
		Connection conn = getConnection();
		Comm c = new CommDao().selectCommQ(conn, commPostNo); 
		
		close(conn);
		
		return c; 
		
	}
	
	public CommFile selectCommQFile(int commPostNo) { 
		
		Connection conn = getConnection();
		CommFile cf = new CommDao().selectCommQFile(conn, commPostNo); 
		
		close(conn);
		
		return cf; 
		
	}
	
	public int updateCommQ(Comm c, CommFile cf) { 
		
		Connection conn = getConnection();
		
		int result1 = new CommDao().updateCommQ(conn, c);
		int result2 = 1; 
		
		// 새로운 첨부파일이 있을 경우 
		if(cf != null) {
			// 기존의 첨부파일이 있을 경우 => CommFile Update 
			if(cf.getFileNo() != 0) {
				result2 = new CommDao().updateCommQFile(conn, cf); 
			// 기존의 첨부파일이 없을 경우 => CommFile Insert 
			}else {
				result2 = new CommDao().insertNewCommQFile(conn, cf); 
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
	
	public int deleteCommQ(int commPostNo) { 
		
		Connection conn = getConnection();
		int result = new CommDao().deleteCommQ(conn, commPostNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn); 
		}
		
		close(conn);
		
		return result; 
		
	}
	
	
	
}
