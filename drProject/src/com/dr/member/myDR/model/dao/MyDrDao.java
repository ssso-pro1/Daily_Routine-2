package com.dr.member.myDR.model.dao;

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
import com.dr.member.comm.model.vo.Comm;
import com.dr.member.comm.model.vo.Reply;
import com.dr.member.ht.model.vo.Ht;
import com.dr.member.info.model.vo.Info;
import com.dr.member.myDR.model.vo.Bookmark;

public class MyDrDao {
	private Properties prop = new Properties();
	
	/**
	 * xml파일 부르기
	 */
	public MyDrDao() {
		String fileName = MyDrDao.class.getResource("/sql/myDR/myDR-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 북마크 전체 게시물 개수 조회하는 메소드
	 * @param conn
	 * @return
	 */
	public int selectbkListCount(Connection conn, int userNo) {
		// select문 -> ResultSet (총 게시글 개수 == 정수)
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectbkListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
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

	public ArrayList<Comm> selectMyPostList(Connection conn, PageInfo pi, int userNo) {
		// select -> 여러행
		ArrayList<Comm> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMyPostList");

		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2,(pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
			pstmt.setInt(3, pi.getCurrentPage() * pi.getBoardLimit());
					
			rset = pstmt.executeQuery();
				
			
			while(rset.next()) {
				Comm c = new Comm(rset.getInt("COMM_POST_NO"),
								  rset.getString("USER_NO"),
								  rset.getString("POST_TITLE"),
								  rset.getDate("UPDATE_DATE"),
								  rset.getInt("BOARD_VIEW"),
								  rset.getInt("COMM_NO"),
								  rset.getInt("LIKE_COUNT")		
								  );
				
				list.add(c);
					
			}
			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int selectMyPostListCount(Connection conn, int userNo) {
		// select문 -> ResultSet (총 게시글 개수 == 정수)
		int postListCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMyPostListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				postListCount = rset.getInt("listcount");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return postListCount;
	}

	public int selectMyReplyListCount(Connection conn, int userNo) {
		// select문 -> ResultSet (총 게시글 개수 == 정수)
		int replyListCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMyReplyListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				replyListCount = rset.getInt("listcount");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return replyListCount;
	}

	public ArrayList<Reply> selectMyReplyList(Connection conn, PageInfo pi, int userNo) {
		// select -> 여러행
		ArrayList<Reply> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMyReplyList");

		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2,(pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
			pstmt.setInt(3, pi.getCurrentPage() * pi.getBoardLimit());
					
			rset = pstmt.executeQuery();
				
			
			while(rset.next()) {
				Reply r = new Reply(rset.getInt("REPLY_NO"),
								  rset.getString("USER_NO"),
								  rset.getInt("COMM_POST_NO"),
								  rset.getString("REPLY_CONTENT"),
								  rset.getInt("REPLY_CATEGORY"),
								  rset.getDate("UPDATE_DATE"),
								  rset.getString("POST_TITLE")		
								  );
				
				list.add(r);
					
			}
			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int selectHtBookmarkListCount(Connection conn, int userNo) {
		// select문 -> ResultSet (총 게시글 개수 == 정수)
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectHtBookmarkListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
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

	public ArrayList<Ht> selectHtBookmarkList(Connection conn, PageInfo pi, int userNo) {
		// select -> 여러행
		ArrayList<Ht> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectHtBookmarkList");
		System.out.println(userNo);
		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2,(pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
			pstmt.setInt(3, pi.getCurrentPage() * pi.getBoardLimit());
					
			rset = pstmt.executeQuery();
				
			
			while(rset.next()) {
				Ht h = new Ht(rset.getInt("HT_POST_NO"),
							  rset.getString("HT_POST_TITLE"),
							  rset.getString("category_name"),
							  rset.getDate("HT_UPDATE_DATE"),
						   	  rset.getInt("HT_LIKE_COUNT"),
							  rset.getString("TITLEIMG")
							  );
				
				list.add(h);
					
			}
			System.out.println(list);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int selectItBookmarkListCount(Connection conn, int userNo) {
		// select문 -> ResultSet (총 게시글 개수 == 정수)
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectItBookmarkListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
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

	public ArrayList<Info> selectItBookmarkList(Connection conn, PageInfo pi, int userNo) {
		// select -> 여러행
		ArrayList<Info> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectItBookmarkList");

		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2,(pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
			pstmt.setInt(3, pi.getCurrentPage() * pi.getBoardLimit());
					
			rset = pstmt.executeQuery();
				
			
			while(rset.next()) {
				Info i = new Info(rset.getInt("INT_POST_NO"),
								  rset.getString("CATEGORY_NAME"),
							 	  rset.getString("POST_TITLE"),
							 	  rset.getInt("LIKE_COUNT"),
							 	  rset.getDate("FILE_UPDATE"),
							 	  rset.getString("TITLEIMG")
							 	  );
				
				list.add(i);
					
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
