package com.dr.admin.info.model.dao;

import static com.dr.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.dr.admin.info.model.vo.adInfo;
import com.dr.admin.info.model.vo.adInfoFile;
import com.dr.common.model.vo.PageInfo;

public class adInfoDao {
	
private Properties prop = new Properties();
	
	public adInfoDao() {
		
		String fileName = adInfo.class.getResource("/sql/admin/info/adInfo-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	// 전체게시글 카운트
	public int InfoSelectListCountAll(Connection conn) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("InfoSelectListCountAll");
		
		
		
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
	public ArrayList<adInfo> InfoSelectListAll(Connection conn, PageInfo pi) {
		ArrayList<adInfo> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("InfoSelectListAll");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
			pstmt.setInt(2, pi.getCurrentPage() * pi.getBoardLimit());
							
			rset = pstmt.executeQuery();
							
			while(rset.next()) {
				list.add(new adInfo(rset.getInt("INT_POST_NO"),
						   rset.getString("CATEGORY_NAME"),
						   rset.getString("POST_TITLE"),
						   rset.getDate("ENROLL_DATE"),
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
	
	
	
	
	
	//카테고리별로 카운트
	public int InfoSelectListCount(Connection conn, String category) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("InfoSelectListCount");
		
		
		
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
	
	
	
	
	//카테고리별 리스트	
	public ArrayList<adInfo> InfoSelectList(Connection conn, PageInfo pi, String category) {
		ArrayList<adInfo> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("InfoSelectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, category);
			pstmt.setInt(2, (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
			pstmt.setInt(3, pi.getCurrentPage() * pi.getBoardLimit());
							
			rset = pstmt.executeQuery();
							
			while(rset.next()) {
				list.add(new adInfo(rset.getInt("INT_POST_NO"),
						   rset.getString("CATEGORY_NAME"),
						   rset.getString("POST_TITLE"),
						   rset.getDate("ENROLL_DATE"),
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

	
	//글삭제
	public int deleteInfo(Connection conn, String[] infoNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteInfo");
		
		
		try {
			
			for(int i=0; i<infoNo.length; i++) {
			
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setString(1,infoNo[i]); 
			
			result = pstmt.executeUpdate();   
			
			}
			
		
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return result;
	}


	public int insertInfo(Connection conn, adInfo i) {
		int result = 0;
		PreparedStatement pstmt = null;
	
		String sql = prop.getProperty("insertInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, i.getUserNo());
			pstmt.setString(2, i.getCategoryName());
			pstmt.setString(3, i.getPostTitle());
			pstmt.setString(4, i.getPostContent());
			pstmt.setString(5, i.getStatus());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int insertAttachment(Connection conn, adInfoFile fi) {
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


	public int infoIncreaseCount(Connection conn, int infoNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("infoIncreaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, infoNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return result;
		
	}


	public adInfo selectInfo(Connection conn, int infoNo) {
		adInfo i = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, infoNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				i = new adInfo(rset.getInt("INT_POST_NO"),
							  rset.getString("CATEGORY_NAME"),
							  rset.getString("POST_TITLE"),
							  rset.getString("POST_CONTENT"),
							  rset.getDate("ENROLL_DATE"),
							  rset.getDate("UPDATE_DATE"),
							  rset.getString("status"),
							  rset.getString("user_id"));
					}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} return i;


	}


	public adInfoFile selectAttachment(Connection conn, int infoNo) {
		adInfoFile fi = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, infoNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				fi = new adInfoFile();
				fi.setIntPostNo(rset.getInt("INT_POST_NO"));
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


	public int updateInfo(Connection conn, adInfo i) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, i.getPostTitle());
			pstmt.setString(2, i.getPostContent());
			pstmt.setString(3, i.getCategoryName());
			pstmt.setString(4, i.getStatus());
			pstmt.setInt(5, i.getIntPostNo());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return result;
		
	}


	public int updateAttachment(Connection conn, adInfoFile fi) {
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


	public int insertNewAttachment(Connection conn, adInfoFile fi) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fi.getIntPostNo());
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
