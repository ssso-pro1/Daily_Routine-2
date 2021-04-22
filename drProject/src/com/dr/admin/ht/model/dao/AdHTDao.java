package com.dr.admin.ht.model.dao;

import static com.dr.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.dr.admin.ht.model.vo.AdHT;
import com.dr.common.model.vo.PageInfo;
import com.dr.member.user.model.dao.UserDao;

public class AdHTDao {

	
	private Properties prop = new Properties();

	
	public AdHTDao() {
			
			String fileName = UserDao.class.getResource("/sql/admin/ht/adHT-mapper.xml").getPath();
	
			try {
				prop.loadFromXML(new FileInputStream(fileName)); //XMl파일 읽어들일 땐 그냥 load(X)
			} catch (IOException e) {
				e.printStackTrace();
			}  
	}
	
	/**
	 * 1. 홈트 게시글 리스트 갯수
	 */
	public int selectListCount(Connection conn) {
		//select문 => ResultSet (총게시글 갯수==정수)
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("LISTCOUNT"); //갯수조회값
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}
	
	
	/**
	 * 1. 홈트 게시글 전체 조회 
	 */
	public ArrayList<AdHT> selectList(Connection conn, PageInfo pi) {
		// select문 => resultset객체 (여러행)
		
		ArrayList<AdHT> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1);
			pstmt.setInt(2, pi.getCurrentPage() * pi.getBoardLimit());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) { 
//				순서!!!!!!
				list.add(new AdHT(rset.getInt("ht_post_no"),
						rset.getString("ht_post_title"),
								  rset.getString("category_name"),
								  rset.getDate("ht_enroll_date"),
								  rset.getDate("ht_update_date"),
								  rset.getInt("ht_board_view")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
		
		
	}
	
	
	
	
}
