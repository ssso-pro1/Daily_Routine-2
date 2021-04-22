package com.dr.admin.center.model.service;

import static com.dr.common.JDBCTemplate.close;
import static com.dr.common.JDBCTemplate.commit;
import static com.dr.common.JDBCTemplate.getConnection;
import static com.dr.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.dr.admin.center.model.dao.adCenterDao;
import com.dr.admin.center.model.vo.adCenterFaq;
import com.dr.admin.center.model.vo.adCenterNotice;
import com.dr.admin.center.model.vo.adCenterQuery;
import com.dr.admin.center.model.vo.centerNoticeFile;
import com.dr.common.model.vo.PageInfo;
import com.dr.member.center.model.dao.CenterDao;
import com.dr.member.center.model.vo.CenterNotice;

public class adCenterService {

	
	public int faqSelectListCount(String category) { //faq글 갯수 카운트 메소드
		Connection conn = getConnection();
		
		int listCount = new adCenterDao().faqSelectListCount(conn, category);
		
		close(conn);
		return listCount;
	}




	public ArrayList <adCenterFaq> faqselectList(PageInfo pi, String category) { //faq글 카테고리별 어레이리스트에 담기
		Connection conn = getConnection();
		ArrayList <adCenterFaq> list = new adCenterDao().faqSelectList(conn, pi, category);
		close(conn);
		return list;
	}




	public adCenterFaq selectFaq(int faqNo) { // faq디테일 내역조회
		Connection conn = getConnection();
		
		adCenterFaq f = new adCenterDao().selectFaq(conn, faqNo);
		close(conn);
		return f;
	}

	
	/*
	public int faqIncreaseCount(int faqNo) { // faq조회수 증가
		Connection conn = getConnection();
		int result = new adCenterDao().faqIncreaseCount(conn, faqNo);
	}
	
	*/


	public int insertFaq(adCenterFaq f) { // faq글 등록하기
		Connection conn = getConnection();
		
		int result = new adCenterDao().insertFaq(conn, f);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}


	/*

	public int deleteFaq(int faqNo) { // faq테이블에서 삭제할거임
		Connection conn = getConnection();
		int result = new adCenterDao().deleteFaq(conn, faqNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		} return result;
	}

	 */
	
	public int deleteFaq (String[] faqNo) { // faq테이블에서 삭제할거임
		Connection conn = getConnection();
		int result = new adCenterDao().deleteFaq(conn, faqNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		} return result;
	}



	public int updateFaq(adCenterFaq f) {
		Connection conn = getConnection();
		int result = new adCenterDao().updateFaq(conn, f);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		} return result;
	}




	public int searchFaqListCount(String searchFaq) { // FAQ검색결과 카운트
		Connection conn = getConnection();
		
		int listCount = new adCenterDao().searchFaqListCount(conn, searchFaq);
		
		close(conn);
		return listCount;
		}

	
	
	public ArrayList<adCenterFaq> searchFaqList(PageInfo pi, String searchFaq) { // FAQ검색결과 리스트
		Connection conn = getConnection();
		ArrayList<adCenterFaq> list = new adCenterDao().searchFaqList(conn, pi, searchFaq);
		close(conn);
		return list;
	}



	//----------------------------1:1문의---------------------------
	public int queryListCount() { // 전체 문의 글갯수 카운트
		Connection conn = getConnection();
		
		int listCount = new adCenterDao().queryListCount(conn);
		
		close(conn);
		return listCount;
	}




	public ArrayList<adCenterQuery> queryList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList <adCenterQuery> list = new adCenterDao().queryList(conn, pi);
		close(conn);
		return list;
	}
	
	
	
	
	public int querySelectListCount(String reStatus) { // 답변상태값으로 글갯수 카운트
		Connection conn = getConnection();
		
		int listCount = new adCenterDao().querySelectListCount(conn, reStatus);
		
		close(conn);
		return listCount;
	}




	public ArrayList<adCenterQuery> querySelectList(PageInfo pi, String reStatus) {
		Connection conn = getConnection();
		ArrayList <adCenterQuery> list = new adCenterDao().querySelectList(conn, pi, reStatus);
		close(conn);
		return list;
	}




	public adCenterQuery selectQuery(int queryNo) {
		Connection conn = getConnection();
		
		adCenterQuery q = new adCenterDao().selectQuery(conn, queryNo);
		close(conn);
		return q;
	}




	public int queryReplyUpdate(int queryNo, String replyContent) {
		Connection conn = getConnection();
		
		int result = new adCenterDao().queryReplyUpdate(conn, queryNo, replyContent);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}return result;
		
	}




	public int deleteQuery(String[] queryNo) {
		Connection conn = getConnection();
		
		int result = new adCenterDao().deleteQuery(conn, queryNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}return result;
	}



	//-------공지사항--------------------------------------------------------------
	
	public int noticeListCount() {
		Connection conn = getConnection();
		
		int listCount = new adCenterDao().noticeListCount(conn);
		
		close(conn);
		return listCount;
	}




	public ArrayList<adCenterNotice> noticeList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<adCenterNotice> list = new adCenterDao().noticeList(conn, pi);
		close(conn);
		return list;
	}




	public int noticeSelectListCount(String status) {
		Connection conn = getConnection();
		
		int listCount = new adCenterDao().noticeSelectListCount(conn, status);
		
		close(conn);
		return listCount;
	}




	public ArrayList<adCenterNotice> noticeSelectList(PageInfo pi, String status) {
		Connection conn = getConnection();
		ArrayList <adCenterNotice> list = new adCenterDao().noticeSelectList(conn, pi, status);
		close(conn);
		return list;
	}




	public int searchNoticeCount(String searchNoticeCtg, String searchNoticeText) {
		Connection conn = getConnection();
		
		int listCount = new adCenterDao().searchNoticeCount(conn, searchNoticeCtg, searchNoticeText);
		
		close(conn);
		return listCount;
	}




	public ArrayList<adCenterNotice> searchNoticeList(PageInfo pi, String searchNoticeCtg, String searchNoticeText) {
		Connection conn = getConnection();
		ArrayList<adCenterNotice> list = new adCenterDao().searchNoticeList(conn, pi, searchNoticeCtg, searchNoticeText);
		close(conn);
		return list;
	}


	public int deleteNotice(String[] noticeNo) {
		Connection conn = getConnection();
		int result = new adCenterDao().deleteNotice(conn, noticeNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		} return result;
	}


//-------------------test----------------

	public int insertNotice(adCenterNotice n, centerNoticeFile fi) {
		Connection conn = getConnection();
		
		int result1 = new adCenterDao().insertNotice(conn, n);
		
		int result2 = 1;
		if(fi != null) { // 첨부파일이 있었을 경우 
			result2 = new adCenterDao().insertAttachment(conn, fi);
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
	}




	public centerNoticeFile selectAttachment(int noticeNo) {
		Connection conn = getConnection();
		centerNoticeFile fi = new adCenterDao().selectAttachment(conn, noticeNo);
		close(conn);
		return fi;
	}

	




	
	



	



	




	



	
	

	
	

}
