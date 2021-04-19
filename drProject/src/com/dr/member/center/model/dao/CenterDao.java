package com.dr.member.center.model.dao;

import static com.dr.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.dr.common.model.vo.PageInfo;
import com.dr.member.center.model.vo.CenterFaq;
import com.dr.member.center.model.vo.CenterNotice;
import com.dr.member.center.model.vo.CenterQuery;

public class CenterDao {
	
	private Properties prop = new Properties();
	
	public CenterDao() {
		
		String fileName = CenterDao.class.getResource("/sql/center/center-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	public ArrayList<CenterNotice> noticeList(Connection conn) {
		
		ArrayList<CenterNotice> list = new ArrayList<>();
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("noticeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new CenterNotice(rset.getInt("notice_no"),
										  rset.getString("notice_title"),
										  rset.getString("notice_content"),
										  rset.getDate("create_date"),
										  rset.getInt("notice_count")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);
		} return list;
		
	}
	
	



	public int noticeIncreaseCount(Connection conn, int noticeNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("noticeIncreaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return result;
		
	}

	public CenterNotice selectNotice(Connection conn, int noticeNo) {
		
		CenterNotice n = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				n = new CenterNotice(rset.getInt("notice_no"),
									 rset.getString("notice_title"),
									 rset.getString("notice_content"),
									 rset.getDate("create_date"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} return n;
	}

	public CenterNotice selectNoticePre(Connection conn, int noticeNo) {
		CenterNotice nPre = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNotice2");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (noticeNo-1));
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				nPre = new CenterNotice(rset.getInt("notice_no"),
						 				rset.getString("notice_title"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} return nPre;
	}

	public CenterNotice selectNoticeNext(Connection conn, int noticeNo) {
		CenterNotice nNext = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNotice2");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (noticeNo+1));
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				nNext = new CenterNotice(rset.getInt("notice_no"),
		 							     rset.getString("notice_title"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} return nNext;
	}

	
/*
	public ArrayList<CenterFaq> faqList(Connection conn, String category) {
		
		ArrayList<CenterFaq> faqList = new ArrayList<>();
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("faqList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) { 
			
				faqList.add(new CenterFaq(rset.getInt("faq_no"),
											   rset.getInt("user_no"),
											   rset.getString("FAQ_CATEGORY"),
											   rset.getString("faq_title"),
											   rset.getString("faq_content")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} return faqList;
		
	}
*/
	
	
	
	public ArrayList<CenterNotice> shortNoticeList(Connection conn) {
		ArrayList<CenterNotice> shortNoticeList = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("shorNoticeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				shortNoticeList.add(new CenterNotice(rset.getString("notice_title"),
													rset.getString("notice_content"),
													rset.getDate("create_date")));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} return shortNoticeList;
	}

	/* 단순히 문의내역 가져오는거 => 필요없음 나중에 지우자 spl문도 지우자
	public ArrayList<CenterQuery> queryList(Connection conn, int userNo) {
		
		ArrayList<CenterQuery> queryList = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("queryList");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				queryList.add(new CenterQuery (rset.getInt("query_no"),
											   rset.getInt("user_no"),
											   rset.getString("query_category"),
											   rset.getString("QUERY_TITLE"),
											   rset.getString("QUERY_CONTENT"),
											   rset.getDate("QUERY_CREATE_DATE"),
											   rset.getString("REPLY_STATUS"),
											   rset.getString("REPLY_CONTENT"),
											   rset.getDate("REPLY_DATE")));
			}
			
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} return queryList;
		
	}
	
	*/

	public int noticeSelectListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("noticeSelectListCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
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

	public ArrayList<CenterNotice> noticeSelectList(Connection conn, PageInfo pi) {
		// select문 => ResultSet객체 (여러행)
		ArrayList<CenterNotice> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("noticeSelectList");
				
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
			pstmt.setInt(2, pi.getCurrentPage() * pi.getBoardLimit());
					
			rset = pstmt.executeQuery();
					
			while(rset.next()) {
				list.add(new CenterNotice(rset.getInt("notice_no"),
						  rset.getString("notice_title"),
						  rset.getString("notice_content"),
						  rset.getDate("create_date"),
						  rset.getInt("notice_count")));
			}		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		} return list;
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


	public ArrayList<CenterFaq> faqSelectList(Connection conn, PageInfo pi, String category) {
		
		ArrayList<CenterFaq> list = new ArrayList<>();
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
				list.add(new CenterFaq(rset.getInt("faq_no"),
						   rset.getString("FAQ_CATEGORY"),
						   rset.getString("faq_title"),
						   rset.getString("faq_content")));
			}		
		} catch (SQLException e) {
					e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		} return list;
	}


	public int insertQuery(Connection conn, CenterQuery q) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertQuery");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, q.getUserNo());
			pstmt.setString(2, q.getQueryCategory());
			pstmt.setString(3, q.getQueryTitle());
			pstmt.setString(4, q.getQueryContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn);
		} return result;
		
	}

	
	public int querySelectListCount(Connection conn, int userNo) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("querySelectListCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
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


	public ArrayList<CenterQuery> querySelectList(Connection conn, PageInfo pi, int userNo) {
		// select문 => ResultSet객체 (여러행)
		ArrayList<CenterQuery> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("querySelectList");
						
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
			pstmt.setInt(3, pi.getCurrentPage() * pi.getBoardLimit());
							
			rset = pstmt.executeQuery();
							
			while(rset.next()) {
				list.add(new CenterQuery (rset.getInt("query_no"),
											   rset.getInt("user_no"),
											   rset.getString("query_category"),
											   rset.getString("QUERY_TITLE"),
											   rset.getString("QUERY_CONTENT"),
											   rset.getDate("QUERY_CREATE_DATE"),
											   rset.getString("REPLY_STATUS"),
											   rset.getString("REPLY_CONTENT"),
											   rset.getDate("REPLY_DATE")));
				}
			}catch (SQLException e) {
					e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			} return list;
		
	}


	public int searchFaqListCount(Connection conn, String searchFaq) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchFaqListCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, searchFaq);
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


	public ArrayList<CenterFaq> searchFaqList(Connection conn, PageInfo pi, String searchFaq) {
		// select문 => ResultSet객체 (여러행)
		ArrayList<CenterFaq> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchFaqList");
								
		try {
			pstmt = conn.prepareStatement(sql);
					
			pstmt.setString(1, searchFaq);
			pstmt.setInt(2, (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
			pstmt.setInt(3, pi.getCurrentPage() * pi.getBoardLimit());
									
			rset = pstmt.executeQuery();
									
			while(rset.next()) {
				list.add(new CenterFaq(rset.getInt("faq_no"),
						   rset.getString("FAQ_CATEGORY"),
						   rset.getString("faq_title"),
						   rset.getString("faq_content")));
				}	
			}catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			} return list;
	}


	


	public int searchNoticeCount(Connection conn, String searchNoticeCtg, String searchNoticeText) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		if(searchNoticeCtg.equals("제목")) {
			
			String sql = prop.getProperty("searchNoticeTitleCount");
		
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, searchNoticeText);
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
		
		
		} else {
			String sql = prop.getProperty("searchNoticeContentCount");
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, searchNoticeText);
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
		
		
	}

	
	
	
	

	public ArrayList<CenterNotice> searchNoticeList(Connection conn, PageInfo pi, String searchNoticeCtg,
		String searchNoticeText) {
		
		ArrayList<CenterNotice> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		if(searchNoticeCtg.equals("제목")) {
			
			String sql = prop.getProperty("searchNoticeTitle");
			try {
				pstmt = conn.prepareStatement(sql);
						
				pstmt.setString(1, searchNoticeText);
				pstmt.setInt(2, (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
				pstmt.setInt(3, pi.getCurrentPage() * pi.getBoardLimit());
										
				rset = pstmt.executeQuery();
								
				while(rset.next()) {
					list.add(new CenterNotice(rset.getInt("notice_no"),
							                   rset.getString("notice_title"),
								               rset.getString("notice_content"),
											   rset.getDate("create_date"),
											   rset.getInt("notice_count")));
						}		
					} catch (SQLException e) {
						e.printStackTrace();
					}finally {
						close(rset);
						close(pstmt);
					} return list;
				
			
		} else {
			
			String sql = prop.getProperty("searchNoticeContent");
			try {
				pstmt = conn.prepareStatement(sql);
						
				pstmt.setString(1, searchNoticeText);
				pstmt.setInt(2, (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
				pstmt.setInt(3, pi.getCurrentPage() * pi.getBoardLimit());
										
				rset = pstmt.executeQuery();
								
				while(rset.next()) {
					list.add(new CenterNotice(rset.getInt("notice_no"),
							                   rset.getString("notice_title"),
								               rset.getString("notice_content"),
											   rset.getDate("create_date"),
											   rset.getInt("notice_count")));
						}		
					} catch (SQLException e) {
						e.printStackTrace();
					}finally {
						close(rset);
						close(pstmt);
					} return list;
				}
			
		}


	public int deleteQuery(Connection conn, int queryNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteQuery");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, queryNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return result;
		
		
		
		
		
	}


	
		
		
		
		
		
	}



	
	
	







	