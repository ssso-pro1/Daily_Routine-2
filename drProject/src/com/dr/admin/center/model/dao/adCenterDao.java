package com.dr.admin.center.model.dao;

import static com.dr.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.dr.admin.center.model.vo.adCenterFaq;
import com.dr.common.model.vo.PageInfo;

public class adCenterDao {
	
	private Properties prop = new Properties();
	
	public adCenterDao() {
		
		String fileName = adCenterDao.class.getResource("/sql/admin/center/adCenter-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	


	public int faqSelectListCount(Connection conn, String category) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("faqSelectListCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, category);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("LISTCOUNT");
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		} return listCount;
	}


	public ArrayList<adCenterFaq> faqSelectList(Connection conn, PageInfo pi, String category) {
		
		ArrayList<adCenterFaq> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("faqSelectList");
						
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, category);
			pstmt.setInt(2, (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
			pstmt.setInt(3, pi.getCurrentPage() * pi.getBoardLimit());
							
			rset = pstmt.executeQuery();
							
			while(rset.next()) {
				list.add(new adCenterFaq(rset.getInt("faq_no"),
						   rset.getString("FAQ_CATEGORY"),
						   rset.getString("faq_title"),
						   rset.getString("faq_content"),
						   rset.getDate("CREATE_DATE"),
						   rset.getDate("UPDATE_DATE"),
						   rset.getString("STATUS"),
						   rset.getString("USER_ID")
						));
			}		
		} catch (SQLException e) {
					e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		} return list;
	}





	public adCenterFaq selectFaq(Connection conn, int faqNo) {
		
		adCenterFaq f = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectFaq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, faqNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				f = new adCenterFaq(rset.getInt("faq_no"),
									rset.getString("FAQ_CATEGORY"),
									rset.getString("faq_title"),
									rset.getString("faq_content"),
								    rset.getDate("CREATE_DATE"),
									rset.getDate("UPDATE_DATE"),
								    rset.getString("STATUS"),
									rset.getString("USER_ID"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} return f;
	}


	/*
	
	public int faqIncreaseCount(Connection conn, int faqNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("faqIncreaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, faqNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return result;
	}
	
	*/


	public int insertFaq(Connection conn, adCenterFaq f) { // faq글 등록
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertFaq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, f.getUserNo());
			pstmt.setString(2, f.getFaqCategory());
			pstmt.setString(3, f.getFaqTitle());
			pstmt.setString(4, f.getFaqContent());
			pstmt.setString(5, f.getStatus());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn);
		} return result;
	}

		
		
}



	
	
	







	