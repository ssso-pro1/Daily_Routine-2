package com.dr.member.center.model.service;

import static com.dr.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.dr.common.model.vo.PageInfo;
import com.dr.member.center.model.dao.CenterDao;
import com.dr.member.center.model.vo.CenterFaq;
import com.dr.member.center.model.vo.CenterNotice;
import com.dr.member.center.model.vo.CenterQuery;

public class CenterService {

	
	
	public ArrayList<CenterNotice> noticeList() {
		
		Connection conn = getConnection();
		
		ArrayList<CenterNotice> list = new CenterDao().noticeList(conn);
		
		close(conn);
		return list;
	}
	
	
	

	public int noticeIncreaseCount(int noticeNo) {
		
		Connection conn = getConnection();
		
		int result = new CenterDao().noticeIncreaseCount(conn, noticeNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
		
	}

	public CenterNotice selectNotice(int noticeNo) {
		
		Connection conn = getConnection();
		
		CenterNotice n = new CenterDao().selectNotice(conn, noticeNo);
		close(conn);
		return n;
		
	}
	
	public CenterNotice selectNoticePre(int noticeNo) {
		
		Connection conn = getConnection();
		
		CenterNotice nPre = new CenterDao().selectNoticePre(conn, noticeNo);
		close(conn);
		return nPre;
		
	}

	public CenterNotice selectNoticeNext(int noticeNo) {
	
		Connection conn = getConnection();
		
		CenterNotice nNext = new CenterDao().selectNoticeNext(conn, noticeNo);
		close(conn);
		return nNext;
	
	}

	

	/*
	public ArrayList<CenterFaq> faqList(String category) {
		
		Connection conn = getConnection();
		ArrayList<CenterFaq> faqList = new CenterDao().faqList(conn, category);
		
		close(conn);
		return faqList;
		
	}
	*/

	public ArrayList<CenterNotice> shortNoticeList() {
		Connection conn = getConnection();
		
		ArrayList<CenterNotice> shortNoticeList = new CenterDao().shortNoticeList(conn);
		
		close(conn);
		return shortNoticeList;
	}

	public ArrayList<CenterQuery> queryList(int userNo) {
		
		Connection conn = getConnection();
		
		ArrayList<CenterQuery> queryList = new CenterDao().queryList(conn, userNo);
		close(conn);
		return queryList;
		
	}

	public int noticeSelectListCount() {
		Connection conn = getConnection();
		
		int listCount = new CenterDao().noticeSelectListCount(conn);
		
		close(conn);
		return listCount;
		
		
		
	}

	public ArrayList<CenterNotice> noticeSelectList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<CenterNotice> list = new CenterDao().noticeSelectList(conn, pi);
		close(conn);
		return list;
	}




	public int faqSelectListCount(String category) {
		Connection conn = getConnection();
		
		int listCount = new CenterDao().faqSelectListCount(conn, category);
		
		close(conn);
		return listCount;
	}




	public ArrayList<CenterFaq> faqselectList(PageInfo pi, String category) {
		Connection conn = getConnection();
		ArrayList<CenterFaq> list = new CenterDao().faqselectList(conn, pi, category);
		close(conn);
		return list;
	}

}
