package com.dr.member.ht.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.dr.common.model.vo.PageInfo;
import com.dr.member.ht.model.vo.Ht;
import static com.dr.common.JDBCTemplate.*;

public class HtDao {
	
	private Properties prop = new Properties();
	
	/**
	 * xml파일 부르기
	 */
	public HtDao() {
		String fileName = HtDao.class.getResource("/sql/ht/ht-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

	
	/**
	 * 홈트레이닝 전체 게시물에서 찾는 제목 내용 포함한 게시물 개수 조회하는 메소드
	 * @param conn
	 * @param searchTitle
	 * @return
	 */
	public int selectSearchListCount(Connection conn, String searchTitle) {
		// select문 -> ResultSet (총 게시글 개수 == 정수)
				int listCount = 0;
				
				PreparedStatement pstmt = null;
				ResultSet rset = null;
				
				String sql = prop.getProperty("selectSearchListCount");
				System.out.println(searchTitle);
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, searchTitle);
					rset = pstmt.executeQuery();
					
					if(rset.next()) {
						listCount = rset.getInt("listcount");
					}
					
				} catch (SQLException e) {
					e.printStackTrace();
				}finally {
					close(rset);
					close(pstmt);
				}
				return listCount;
	}
	
	/**
	 * 홈트레이닝 전체 게시물 개수 조회하는 메소드
	 * @param conn
	 * @return
	 */
	public int selectAllListCount(Connection conn) {
		// select문 -> ResultSet (총 게시글 개수 == 정수)
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAllListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("listcount");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
		
	}
	
	public ArrayList<Ht> selectSearchHtList(Connection conn, String value, String searchTitle, PageInfo pi) {// select -> 여러행
		ArrayList<Ht> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "SELECT * FROM (SELECT ROWNUM RNUM, A.*FROM(" + prop.getProperty("selectSearchHtList") + "ORDER BY ";

		if(value == null) {
			value = "upload";
		}
		
		if(value.equals("upload")) {
			sql += "HT_UPDATE_DATE DESC";
		}else if(value.equals("like")){
			sql += "HT_LIKE_COUNT DESC";
		}else if(value.equals("view")){
			sql +="HT_BOARD_VIEW DESC";
		}else {
			sql += "HT_UPDATE_DATE DESC";
		}
		
		sql += ") A) WHERE RNUM BETWEEN ? AND ?";

		try {

			pstmt = conn.prepareStatement(sql);		
			pstmt.setString(1, searchTitle);
			pstmt.setInt(2,(pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
			pstmt.setInt(3, pi.getCurrentPage() * pi.getBoardLimit());
			
			rset = pstmt.executeQuery();
		
			
			while(rset.next()) {
				Ht h = new Ht();
				h.setHtPostNo(rset.getInt("ht_post_no"));
				h.setHtPostTitle(rset.getString("ht_post_title"));
				h.setHtEnrollDate(rset.getDate("ht_enroll_date"));
				h.setHtUpdateDate(rset.getDate("ht_update_date"));
				h.setHtViewCount(rset.getInt("ht_board_view"));
				h.setHtLikeCount(rset.getInt("ht_like_count"));
				h.setTitleImg(rset.getString("titleImg"));
				list.add(h);
			
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	/**
	 * 홈트레이닝 전체 게시물 조회하는 메소드
	 * @param conn
	 * @return
	 */
	public ArrayList<Ht> selectAllHtList(Connection conn, String value, PageInfo pi) {
		// select -> 여러행
		ArrayList<Ht> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "SELECT * FROM (SELECT ROWNUM RNUM, A.*FROM(" + prop.getProperty("selectAllHtList") + "ORDER BY ";

		if(value == null) {
			value = "upload";
		}
		
		if(value.equals("upload")) {
			sql += "HT_UPDATE_DATE DESC";
		}else if(value.equals("like")){
			sql += "HT_LIKE_COUNT DESC";
		}else if(value.equals("view")){
			sql +="HT_BOARD_VIEW DESC";
		}else {
			sql += "HT_UPDATE_DATE DESC";
		}
		
		sql += ") A) WHERE RNUM BETWEEN ? AND ?";

		try {

			pstmt = conn.prepareStatement(sql);		
			pstmt.setInt(1,(pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
			pstmt.setInt(2, pi.getCurrentPage() * pi.getBoardLimit());
			
			rset = pstmt.executeQuery();
		
			
			while(rset.next()) {
				Ht h = new Ht();
				h.setHtPostNo(rset.getInt("ht_post_no"));
				h.setHtPostTitle(rset.getString("ht_post_title"));
				h.setHtEnrollDate(rset.getDate("ht_enroll_date"));
				h.setHtUpdateDate(rset.getDate("ht_update_date"));
				h.setHtViewCount(rset.getInt("ht_board_view"));
				h.setHtLikeCount(rset.getInt("ht_like_count"));
				h.setTitleImg(rset.getString("titleImg"));
				list.add(h);
			
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	/**
	 * 홈트레이닝 카테고리별 게시물 개수 조회하는 메소드
	 * @return
	 */
	public int selectListCount(Connection conn, String category) {
		// select문 -> ResultSet (총 게시글 개수 == 정수)
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("listcount");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
		
	}
	
	/**
	 * 홈트레이닝 카테고리별 게시물 조회하는 메소드
	 * @param conn
	 * @return
	 */
	public ArrayList<Ht> selectHtList(Connection conn, String category, String value, PageInfo pi) {
		// select -> 여러행
		ArrayList<Ht> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "SELECT * FROM (SELECT ROWNUM RNUM, A.*FROM(" + prop.getProperty("selectHtList") + "ORDER BY ";
		
		if(value == null) {
			value = "upload";
		}
		
		if(value.equals("upload")) {
			sql += "HT_UPDATE_DATE DESC";
		}else if(value.equals("like")){
			sql += "HT_LIKE_COUNT DESC";
		}else if(value.equals("view")){
			sql +="HT_BOARD_VIEW DESC";
		}else {
			sql += "HT_UPDATE_DATE DESC";
		}
		
		sql += ") A) WHERE RNUM BETWEEN ? AND ?";

		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			pstmt.setInt(2,(pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
			pstmt.setInt(3, pi.getCurrentPage() * pi.getBoardLimit());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Ht h = new Ht();
				h.setHtPostNo(rset.getInt("ht_post_no"));
				h.setHtPostTitle(rset.getString("ht_post_title"));
				h.setHtEnrollDate(rset.getDate("ht_enroll_date"));
				h.setHtUpdateDate(rset.getDate("ht_update_date"));
				h.setHtViewCount(rset.getInt("ht_board_view"));
				h.setHtLikeCount(rset.getInt("ht_like_count"));
				h.setTitleImg(rset.getString("titleImg"));
				list.add(h);
			
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}



	public int increaseCount(Connection conn, int hno) {
		// update문 => 처리된 행수
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
		
	}



	public Ht selectPost(Connection conn, int hno) {
		// select문
		Ht h = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectPost");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				h = new Ht(rset.getInt("ht_post_no"),
						   rset.getInt("user_no"),
						   rset.getString("ht_post_content"),
						   rset.getString("ht_post_title"),
						   rset.getString("ht_comment"),
						   rset.getString("ht_recommend"),
						   rset.getString("ht_howtowork"),
						   rset.getString("ht_suggestion"),
						   rset.getString("category_name"),
						   rset.getDate("ht_enroll_date"),
						   rset.getDate("ht_update_date"),
						   rset.getString("video_link")
						  );
						
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return h;
	
	}







	




}
