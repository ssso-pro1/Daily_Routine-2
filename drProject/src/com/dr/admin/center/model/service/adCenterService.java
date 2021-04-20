package com.dr.admin.center.model.service;

import static com.dr.common.JDBCTemplate.close;
import static com.dr.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.dr.admin.center.model.dao.adCenterDao;
import com.dr.admin.center.model.vo.adCenterFaq;
import com.dr.common.model.vo.PageInfo;

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




	

	
	

}
