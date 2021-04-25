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
import com.dr.admin.center.model.vo.adCenterNotice;
import com.dr.admin.center.model.vo.adCenterQuery;
import com.dr.admin.center.model.vo.centerNoticeFile;
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



/*

	public int deleteFaq(Connection conn, int faqNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteFaq");
		
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
	
	public int deleteFaq(Connection conn, String[] faqNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteFaq");
		
		
		try {
			
			for(int i=0; i<faqNo.length; i++) {
			
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setString(1,faqNo[i]); 
			
			result = pstmt.executeUpdate();   
			
			}
			
		
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return result;
	}



	public int updateFaq(Connection conn, adCenterFaq f) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateFaq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, f.getFaqCategory());
			pstmt.setString(2, f.getFaqTitle());
			pstmt.setString(3, f.getFaqContent());
			pstmt.setString(4, f.getStatus());
			pstmt.setInt(5, f.getFaqNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return result;
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


	public ArrayList<adCenterFaq> searchFaqList(Connection conn, PageInfo pi, String searchFaq) {
		// select문 => ResultSet객체 (여러행)
		ArrayList<adCenterFaq> list = new ArrayList<>();
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
				list.add(new adCenterFaq(rset.getInt("faq_no"),
									     rset.getString("FAQ_CATEGORY"),
									     rset.getString("faq_title"),
									     rset.getString("faq_content"),
									     rset.getDate("CREATE_DATE"),
									     rset.getDate("UPDATE_DATE"),
									     rset.getString("STATUS"),
									     rset.getString("USER_ID")));
				}	
			}catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			} return list;
	}




	//-----------------------------------1:1문의-----------------------------
	
	public int queryListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("queryListCount");
		
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





	public ArrayList<adCenterQuery> queryList(Connection conn, PageInfo pi) {
		ArrayList<adCenterQuery> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("queryList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
			pstmt.setInt(2, pi.getCurrentPage() * pi.getBoardLimit());
							
			rset = pstmt.executeQuery();
							
			while(rset.next()) {
				list.add(new adCenterQuery(rset.getInt("query_no"),
										   rset.getString("QUERY_CATEGORY"),
										   rset.getString("QUERY_title"),
										   rset.getDate("QUERY_CREATE_DATE"),
										   rset.getString("REPLY_STATUS"),
										   rset.getDate("REPLY_DATE"),
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

	
	
	
	
	
	
	
	
	public int querySelectListCount(Connection conn, String reStatus) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("querySelectListCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, reStatus);
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





	public ArrayList<adCenterQuery> querySelectList(Connection conn, PageInfo pi, String reStatus) {
		ArrayList<adCenterQuery> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("querySelectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, reStatus);
			pstmt.setInt(2, (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
			pstmt.setInt(3, pi.getCurrentPage() * pi.getBoardLimit());
							
			rset = pstmt.executeQuery();
							
			while(rset.next()) {
				list.add(new adCenterQuery(rset.getInt("query_no"),
										   rset.getString("QUERY_CATEGORY"),
										   rset.getString("QUERY_title"),
										   rset.getDate("QUERY_CREATE_DATE"),
										   rset.getString("REPLY_STATUS"),
										   rset.getDate("REPLY_DATE"),
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





	public adCenterQuery selectQuery(Connection conn, int queryNo) { // 글번호로 문의내역 디테일조회
		adCenterQuery q = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectQuery");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, queryNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				q = new adCenterQuery(rset.getInt("QUERY_NO"),
									  rset.getString("QUERY_CATEGORY"),
									  rset.getString("QUERY_TITLE"),
									  rset.getString("QUERY_CONTENT"),
								      rset.getDate("QUERY_CREATE_DATE"),
								      rset.getString("QUERY_STATUS"),
									  rset.getString("REPLY_STATUS"),
									  rset.getString("REPLY_CONTENT"),
									  rset.getDate("REPLY_DATE"),
									  rset.getString("USER_ID"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} return q;
	}





	public int queryReplyUpdate(Connection conn, int queryNo, String replyContent) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("queryReplyUpdate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, replyContent);
			pstmt.setInt(2, queryNo);
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return result;
	}





	public int deleteQuery(Connection conn, String[] queryNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteQuery");
		
		
		try {
			
			for(int i=0; i<queryNo.length; i++) {
			
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setString(1,queryNo[i]); 
			
			result = pstmt.executeUpdate();   
			
			}
			
		
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return result;
	}




	//------------공지사항---------------------------------------
	
	public int noticeListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("noticeListCount");
		
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





	public ArrayList<adCenterNotice> noticeList(Connection conn, PageInfo pi) {
		ArrayList<adCenterNotice> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("noticeList");
				
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
			pstmt.setInt(2, pi.getCurrentPage() * pi.getBoardLimit());
					
			rset = pstmt.executeQuery();
					
			while(rset.next()) {
				list.add(new adCenterNotice(rset.getInt("notice_no"),
						  					rset.getString("notice_title"),
						  					rset.getDate("create_date"),
						  					rset.getString("status"),
						  					rset.getString("user_id")));
			}		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		} return list;
	}





	public int noticeSelectListCount(Connection conn, String status) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("noticeSelectListCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, status);
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






	public ArrayList<adCenterNotice> noticeSelectList(Connection conn, PageInfo pi, String status) {
		ArrayList<adCenterNotice> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("noticeSelectList");
				
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, status);
			pstmt.setInt(2, (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
			pstmt.setInt(3, pi.getCurrentPage() * pi.getBoardLimit());
					
			rset = pstmt.executeQuery();
					
			while(rset.next()) {
				list.add(new adCenterNotice(rset.getInt("notice_no"),
						  					rset.getString("notice_title"),
						  					rset.getDate("create_date"),
						  					rset.getString("status"),
						  					rset.getString("user_id")));
			}		
		} catch (SQLException e) {
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






	public ArrayList<adCenterNotice> searchNoticeList(Connection conn, PageInfo pi, String searchNoticeCtg,
			String searchNoticeText) {
		
		ArrayList<adCenterNotice> list = new ArrayList<>();
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
					list.add(new adCenterNotice(rset.getInt("notice_no"),
							                    rset.getString("notice_title"),
								                rset.getDate("create_date"),
											    rset.getString("STATUS"),
											    rset.getString("user_id")));
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
					list.add(new adCenterNotice(rset.getInt("notice_no"),
							                    rset.getString("notice_title"),
								                rset.getDate("create_date"),
											    rset.getString("STATUS"),
											    rset.getString("user_id")));
						}		
					} catch (SQLException e) {
						e.printStackTrace();
					}finally {
						close(rset);
						close(pstmt);
					} return list;
				}
			
		}
	
	public int deleteNotice(Connection conn, String[] noticeNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteNotice");
		
		
		try {
			
			for(int i=0; i<noticeNo.length; i++) {
			
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setString(1,noticeNo[i]); 
			
			result = pstmt.executeUpdate();   
			
			}
			
		
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return result;
	}





	public int insertNotice(Connection conn, adCenterNotice n) {
		int result = 0;
		PreparedStatement pstmt = null;
	
		String sql = prop.getProperty("insertNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setInt(3, n.getUserNo());
			pstmt.setString(4, n.getStatus());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}





	public int insertAttachment(Connection conn, centerNoticeFile fi) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fi.getFileName());
			pstmt.setString(2, fi.getFileUpdate());
			pstmt.setString(3, fi.getFilePath());
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}





	public centerNoticeFile selectAttachment(Connection conn, int noticeNo) {
		centerNoticeFile fi = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				fi = new centerNoticeFile();
				fi.setFileNo(rset.getInt("file_no"));
				fi.setFileName(rset.getString("file_name"));
				fi.setFileUpdate(rset.getString("file_update"));
				fi.setFilePath(rset.getString("file_path"));
				
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return fi;
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



	public adCenterNotice selectNotice(Connection conn, int noticeNo) {
		adCenterNotice n = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				n = new adCenterNotice(rset.getInt("notice_no"),
									   rset.getString("notice_title"),
									   rset.getString("notice_content"),
									   rset.getInt("notice_count"),
									   rset.getDate("create_date"),
									   rset.getDate("update_date"),
									   rset.getString("status"),
									   rset.getString("user_id"));
}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} return n;


	}





	public int updateNotice(Connection conn, adCenterNotice n) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setString(3, n.getStatus());
			pstmt.setInt(4, n.getNoticeNo());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return result;
		
	}





	public int updateAttachment(Connection conn, centerNoticeFile fi) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fi.getFileName());
			pstmt.setString(2, fi.getFileUpdate());
			pstmt.setString(3, fi.getFilePath());
			pstmt.setInt(4, fi.getFileNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return result;
	}





	public int insertNewAttachment(Connection conn, centerNoticeFile fi) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fi.getNoticeNo());
			pstmt.setString(2, fi.getFileName());
			pstmt.setString(3, fi.getFileUpdate());
			pstmt.setString(4, fi.getFilePath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return result;
		
	}
}

	

	

	







	