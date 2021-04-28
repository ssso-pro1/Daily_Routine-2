package com.dr.member.comm.model.service;

import static com.dr.common.JDBCTemplate.close;
import static com.dr.common.JDBCTemplate.commit;
import static com.dr.common.JDBCTemplate.getConnection;
import static com.dr.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.dr.common.model.vo.PageInfo;
import com.dr.member.comm.model.dao.CommDao;
import com.dr.member.comm.model.vo.Comm;
import com.dr.member.comm.model.vo.CommFile;
import com.dr.member.comm.model.vo.Reply; 

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
	
	
	// 나만의운동팁 검색 
	public int searchTipCount(String searchTipCtg, String searchTipText) {
		
		Connection conn = getConnection();	
		int listCount = new CommDao().searchTipCount(conn, searchTipCtg, searchTipText);
		
		close(conn);
		
		return listCount; 
		
	}
	
	public ArrayList<Comm> searchTipList(PageInfo pi, String searchTipCtg, String searchTipText) {
		
		Connection conn = getConnection();
		ArrayList<Comm> list = new CommDao().searchTipList(conn, pi, searchTipCtg, searchTipText);
		
		close(conn);
		
		return list; 
		
	}
	
	// 나만의운동팁 좋아요 
	public boolean likeCheck(int commPostNo, int userNo) {
		
		Connection conn = getConnection();
		boolean check = new CommDao().likeCheck(conn, commPostNo, userNo); 
		
		close(conn);
		
		return check; 
		
	}
	
	public int deleteLike(int commPostNo, int userNo) {
		
		Connection conn = getConnection();
		int result = new CommDao().deleteLike(conn, commPostNo, userNo);
		
		if(result > 0) {
			commit(conn);
		}else { 
			rollback(conn); 
		}
		
		return result; 
			
	}
	
	public int insertLike(int commPostNo, int userNo) { 
		
		Connection conn = getConnection();
		int result = new CommDao().insertLike(conn, commPostNo, userNo); 
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result; 
		
	}
	
	public int subLikeCount(int commPostNo) {
		
		Connection conn = getConnection();
		int result = new CommDao().subLikeCount(conn, commPostNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result; 
		
	}
	
	public int sumLikeCount(int commPostNo) { 
		
		Connection conn = getConnection();
		int result = new CommDao().sumLikeCount(conn, commPostNo);
		
		if(result > 0) {
			commit(conn);
		}else{
			rollback(conn);
		}
		
		return result;
		
	}
	
	// 나만의운동팁 댓글 
	public ArrayList<Reply> selectReplyList(int commPostNo) { 
			
		Connection conn = getConnection();
		ArrayList<Reply> list = new CommDao().selectReplyList(conn, commPostNo); 
			
		close(conn);
			
		return list; 
			
	}
	
	public int insertReply(Reply r) {
		
		Connection conn = getConnection();
		int result = new CommDao().insertReply(conn, r); 
		
		close(conn);
		
		return result; 
	
	}
	
	public int insertReplyFree(Reply r) {
		
		Connection conn = getConnection();
		int result = new CommDao().insertReply(conn, r); 
		
		close(conn);
		
		return result; 
	
	}
	
	public int insertReplyQ(Reply r) {
		
		Connection conn = getConnection();
		int result = new CommDao().insertReply(conn, r); 
		
		close(conn);
		
		return result; 
	
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
	

	// 자유게시판 검색 
	public int searchFreeCount(String searchFreeCtg, String searchFreeText) {
		
		Connection conn = getConnection();	
		int listCount = new CommDao().searchFreeCount(conn, searchFreeCtg, searchFreeText);
		
		close(conn);
		
		return listCount; 
		
	}
	
	public ArrayList<Comm> searchFreeList(PageInfo pi, String searchFreeCtg, String searchFreeText) {
		
		Connection conn = getConnection();
		ArrayList<Comm> list = new CommDao().searchFreeList(conn, pi, searchFreeCtg, searchFreeText);
		
		close(conn);
		
		return list; 
		
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
	
	
	// 질문게시판 검색 
	public int searchQCount(String searchQCtg, String searchQText) {
			
		Connection conn = getConnection();	
		int listCount = new CommDao().searchQCount(conn, searchQCtg, searchQText);
			
		close(conn);
			
		return listCount; 
			
	}
		
	public ArrayList<Comm> searchQList(PageInfo pi, String searchQCtg, String searchQText) {
			
		Connection conn = getConnection();
		ArrayList<Comm> list = new CommDao().searchQList(conn, pi, searchQCtg, searchQText);
			
		close(conn);
			
		return list; 
			
	}	
	
	//mainPage Comm list
	public ArrayList<Comm> mainList(){
		Connection conn = getConnection();
		
		ArrayList<Comm> list1 = new CommDao().mainList(conn);
		
		close(conn);
		
		return list1;
	}
	
	
	
	
	
	
	
}
