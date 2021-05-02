package com.dr.admin.ht.model.dao;

import static com.dr.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.dr.admin.ht.model.vo.adHT;
import com.dr.admin.info.model.vo.adInfo;
import com.dr.common.model.vo.PageInfo;

public class AdHTDao {
	
private Properties prop = new Properties();
	
	public AdHTDao() {
		
		String fileName = AdHTDao.class.getResource("/sql/admin/ht/adHT-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	// 전체게시글 카운트
	public int selectListCountAll(Connection conn) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCountAll");
		
		
		
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
	
	//전체게시글 리스트
	public ArrayList<adHT> selectListAll(Connection conn, PageInfo pi) {
		ArrayList<adHT> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListAll");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
			pstmt.setInt(2, pi.getCurrentPage() * pi.getBoardLimit());
							
			rset = pstmt.executeQuery();
							
			while(rset.next()) {
				list.add(new adHT(rset.getInt("HT_POST_NO"),
						   rset.getString("HT_POST_TITLE"),
						   rset.getString("CATEGORY_NAME"),
						   rset.getDate("HT_ENROLL_DATE"),
						   rset.getString("STATUS"),
						   rset.getString("USER_ID"),
						   rset.getString("TITLEIMG")
						));
			}		
		} catch (SQLException e) {
					e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		} return list;
		
	}


	public int insertHT(Connection conn, adHT t) {
		int result = 0;
		PreparedStatement pstmt = null;
	
		String sql = prop.getProperty("insertHT");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, t.getUserNo());
			pstmt.setString(2, t.getCategoryName());
			pstmt.setString(3, t.getHtPostTitle());
			pstmt.setString(4, t.getHtPostContent());
			pstmt.setString(5, t.getStatus());
			pstmt.setString(6, t.getFileName());
			pstmt.setString(7, t.getFileUpdate());
			pstmt.setString(8, t.getFilePath());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	//카테고리별로 카운트
	public int selectListCount(Connection conn, String ctg) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, ctg);
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
	
	
	
	
	//카테고리별 리스트	
	public ArrayList<adHT> selectList(Connection conn, PageInfo pi, String ctg) {
		ArrayList<adHT> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, ctg);
			pstmt.setInt(2, (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
			pstmt.setInt(3, pi.getCurrentPage() * pi.getBoardLimit());
							
			rset = pstmt.executeQuery();
							
			while(rset.next()) {
				list.add(new adHT(rset.getInt("HT_POST_NO"),
						   rset.getString("HT_POST_TITLE"),
						   rset.getString("CATEGORY_NAME"),
						   rset.getDate("HT_ENROLL_DATE"),
						   rset.getString("STATUS"),
						   rset.getString("USER_ID"),
						   rset.getString("TITLEIMG")
						));
			}		
		} catch (SQLException e) {
					e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		} return list;
		
	}


	public int HTIncreaseCount(Connection conn, int htNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("HTIncreaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, htNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return result;
		
	}


	public adHT selectHT(Connection conn, int htNo) {
		adHT t = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectHT");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, htNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				t = new adHT(rset.getInt("HT_POST_NO"),
							  rset.getString("CATEGORY_NAME"),
							  rset.getString("HT_POST_TITLE"),
							  rset.getString("HT_POST_CONTENT"),
							  rset.getDate("HT_ENROLL_DATE"),
							  rset.getDate("HT_UPDATE_DATE"),
							  rset.getString("status"),
							  rset.getString("user_id"),
							  rset.getString("TITLEIMG"));
							  
					}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} return t;


	}


	public int deleteHT(Connection conn, int htNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteHT");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, htNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return result;
	}


	public int updateHT(Connection conn, adHT t) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		// 첨부파일이 변경되었을경우
		if(t.getFileName() !=null ) {
		
			String sql = prop.getProperty("updateHTAll");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, t.getCategoryName());
				pstmt.setString(2, t.getHtPostTitle());
				pstmt.setString(3, t.getHtPostContent());
				pstmt.setString(4, t.getStatus());
				pstmt.setString(5, t.getFileName());
				pstmt.setString(6, t.getFileUpdate());
				pstmt.setString(7, t.getFilePath());
				pstmt.setInt(8, t.getHtPostNo());
				
				result = pstmt.executeUpdate();
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			} return result;
		
		} else { // 첨부파일이 변경안되었을경우
			
			String sql = prop.getProperty("updateHT");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, t.getCategoryName());
				pstmt.setString(2, t.getHtPostTitle());
				pstmt.setString(3, t.getHtPostContent());
				pstmt.setString(4, t.getStatus());
				
				pstmt.setInt(5, t.getHtPostNo());
				
				result = pstmt.executeUpdate();
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			} return result;
			
			
			
			
			
		}
		
	}

}
