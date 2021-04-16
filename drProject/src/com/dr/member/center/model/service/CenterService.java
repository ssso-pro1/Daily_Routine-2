package com.dr.member.center.model.service;

import static com.dr.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.dr.member.center.model.dao.CenterDao;
import com.dr.member.center.model.vo.CenterFaq;
import com.dr.member.center.model.vo.CenterNotice;

public class CenterService {

	public ArrayList<CenterNotice> noticeList() {
		
		Connection conn = getConnection();
		
		ArrayList<CenterNotice> list = new CenterDao().noticeList(conn);
		
		close(conn);
		return list;
	}

	public int increaseCount(int noticeNo) {
		
		Connection conn = getConnection();
		
		int result = new CenterDao().increaseCount(conn, noticeNo);
		
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

	

	
	public ArrayList<CenterFaq> faqList(String category) {
		
		Connection conn = getConnection();
		ArrayList<CenterFaq> faqList = new CenterDao().faqList(conn, category);
		
		close(conn);
		return faqList;
		
	}

}
