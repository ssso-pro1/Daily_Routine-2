package com.dr.member.comm.model.dao;

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
import com.dr.member.comm.model.vo.CommFile;
import com.dr.member.comm.model.vo.Reply;

import static com.dr.common.JDBCTemplate.*; 

public class CommDao {
	
	private Properties prop = new Properties(); 
	
	public CommDao() {
		
		String fileName = CommDao.class.getResource("/sql/comm/comm-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	// 나만의운동팁 게시판 
	
	public int tipSelectListCount(Connection conn) {
		// select문 => ResultSet
		int listCount = 0; 
		
		PreparedStatement pstmt = null; 
		ResultSet rset = null; 
		
		String sql = prop.getProperty("tipSelectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery(); 
			
			if(rset.next()) { 
				listCount = rset.getInt("LISTCOUNT"); 
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset); 
			close(pstmt); 
		}
		
		return listCount;
		
	}
	
	public ArrayList<Comm> tipSelectList(Connection conn, PageInfo pi) {
		// select문 => ResultSet (여러 행) 
		ArrayList<Comm> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("tipSelectList"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
			pstmt.setInt(2, pi.getCurrentPage() * pi.getBoardLimit());
			
			rset = pstmt.executeQuery(); 
			
			while(rset.next()) { 
				list.add(new Comm(rset.getInt("comm_post_no"),
								  rset.getString("user_id"),
					              rset.getString("category_name"),
					              rset.getString("post_title"),
					              rset.getDate("enroll_date"),
					              rset.getInt("board_view"))); 
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { 
			close(rset); 
			close(pstmt);	
		}
		
		return list;
		
	}
	
	public int insertCommTip(Connection conn, Comm c) {
		// insert문
		int result = 0; 
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCommTip"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getCategoryName());
			pstmt.setString(2, c.getPostTitle());
			pstmt.setString(3, c.getPostContent());
			pstmt.setInt(4, Integer.parseInt(c.getUserNo()));
			
			result = pstmt.executeUpdate(); 
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt); 
		}
		
		return result;
		
	}
	
	public int insertCommFile(Connection conn, CommFile cf) { 
		// insert문 
		int result = 0; 
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCommFile"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cf.getFileName());
			pstmt.setString(2, cf.getFileUpdate());
			pstmt.setString(3, cf.getFilePath());
			
			result = pstmt.executeUpdate(); 
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result; 
		
	}
	
	public int increaseCount(Connection conn, int commPostNo) {
		
		int result = 0; 
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, commPostNo);
			
			result = pstmt.executeUpdate(); 
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result; 
				
	} 
	
	public Comm selectCommTip(Connection conn, int commPostNo) {
		// select문 => ResultSet객체 한 행 
		Comm c = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null; // 조회문이기 때문에 rset 필요 
		String sql = prop.getProperty("selectCommTip");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, commPostNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) { 
				c = new Comm(rset.getInt("comm_post_no"), 
						   	 rset.getString("user_id"),
						     rset.getString("category_name"),
						     rset.getString("post_content"),
						     rset.getString("post_title"),
						     rset.getDate("enroll_date"),
							 rset.getInt("board_view"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt); 
		}
		
		return c;
	
	}
	
	public CommFile selectCommTipFile(Connection conn, int commPostNo) {
		// select문 => ResultSet객체 
		CommFile cf = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null; 
		String sql = prop.getProperty("selectCommTipFile"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, commPostNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				cf = new CommFile();
				cf.setFileNo(rset.getInt("file_no"));
				cf.setFileName(rset.getString("file_name"));
				cf.setFileUpdate(rset.getString("file_update"));
				cf.setFilePath(rset.getString("file_path"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt); 
		}
		
		return cf;		
		
	} 
	
	public int updateCommTip(Connection conn, Comm c) {
		// update문 
		int result = 0; 
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateCommTip"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getCategoryName());
			pstmt.setString(2, c.getPostTitle());
			pstmt.setString(3, c.getPostContent());
			pstmt.setInt(4, c.getCommPostNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt); 
		}
		
		return result; 
	
	}
	
	public int updateCommTipFile(Connection conn, CommFile cf) {
		// update문 
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateCommTipFile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cf.getFileName());
			pstmt.setString(2, cf.getFileUpdate());
			pstmt.setString(3, cf.getFilePath());
			pstmt.setInt(4, cf.getFileNo()); 
			
			result = pstmt.executeUpdate(); 
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result; 
		
	}
	
	public int insertNewCommTipFile(Connection conn, CommFile cf) {
		// insert문 
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewCommTipFile"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cf.getCommPostNo());
			pstmt.setString(2, cf.getFileName());
			pstmt.setString(3, cf.getFileUpdate());
			pstmt.setString(4, cf.getFilePath());
			
			result = pstmt.executeUpdate(); 
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result; 
		
	}
	
	public int deleteCommTip(Connection conn, int commPostNo) {
		// update문 
		int result = 0; 
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteCommTip");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, commPostNo);
			
			result = pstmt.executeUpdate(); 
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt); 
		}
		
		return result; 
		
	}
	
	public ArrayList<Reply> selectTipReplyList(Connection conn, int commPostNo) { 
		
		ArrayList<Reply> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null; 
		String sql = prop.getProperty("selectTipReplyList"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, commPostNo);
			
			rset = pstmt.executeQuery(); 
			
			while(rset.next()) {
				list.add(new Reply(rset.getInt("reply_no"), 
								   rset.getString("user_id"),
								   rset.getString("reply_content"), 
								   rset.getDate("enroll_date"))); 
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	
	
	// 자유게시판 
	
	public int freeSelectListCount(Connection conn) {
		// select문 => ResultSet
		int listCount = 0; 
		
		PreparedStatement pstmt = null; 
		ResultSet rset = null; 
		
		String sql = prop.getProperty("freeSelectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery(); 
			
			if(rset.next()) { 
				listCount = rset.getInt("LISTCOUNT"); 
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset); 
			close(pstmt); 
		}
		
		return listCount;
		
	}
	
	public ArrayList<Comm> freeSelectList(Connection conn, PageInfo pi) {
		// select문 => ResultSet (여러 행) 
		ArrayList<Comm> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("freeSelectList"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
			pstmt.setInt(2, pi.getCurrentPage() * pi.getBoardLimit());
			
			rset = pstmt.executeQuery(); 
			
			while(rset.next()) { 
				list.add(new Comm(rset.getInt("comm_post_no"),
								  rset.getString("user_id"),
					              rset.getString("post_title"),
					              rset.getDate("enroll_date"),
					              rset.getInt("board_view"))); 
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { 
			close(rset); 
			close(pstmt);	
		}
		
		return list;
		
	}
	
	public int insertCommFree(Connection conn, Comm c) {
		// insert문
		int result = 0; 
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCommFree"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getPostTitle());
			pstmt.setString(2, c.getPostContent());
			pstmt.setInt(3, Integer.parseInt(c.getUserNo()));
		
			result = pstmt.executeUpdate(); 
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt); 
		}
		
		return result;
		
	}
	
	public Comm selectCommFree(Connection conn, int commPostNo) {
		// select문 => ResultSet객체 한 행 
		Comm c = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null; // 조회문이기 때문에 rset 필요 
		String sql = prop.getProperty("selectCommFree");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, commPostNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) { 
				c = new Comm(rset.getInt("comm_post_no"), 
						   	 rset.getString("user_id"),
						     rset.getString("post_content"),
						     rset.getString("post_title"),
						     rset.getDate("enroll_date"),
							 rset.getInt("board_view"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt); 
		}
		
		return c;
	
	}
	
	
	
	
	
	
	// 질문게시판 
	
	public int qSelectListCount(Connection conn) {
		// select문 => ResultSet
		int listCount = 0; 
		
		PreparedStatement pstmt = null; 
		ResultSet rset = null; 
		
		String sql = prop.getProperty("qSelectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery(); 
			
			if(rset.next()) { 
				listCount = rset.getInt("LISTCOUNT"); 
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset); 
			close(pstmt); 
		}
		
		return listCount;
		
	}
	
	public ArrayList<Comm> qSelectList(Connection conn, PageInfo pi) {
		// select문 => ResultSet (여러 행) 
		ArrayList<Comm> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("qSelectList"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
			pstmt.setInt(2, pi.getCurrentPage() * pi.getBoardLimit());
			
			rset = pstmt.executeQuery(); 
			
			while(rset.next()) { 
				list.add(new Comm(rset.getInt("comm_post_no"),
								  rset.getString("user_id"),
					              rset.getString("post_title"),
					              rset.getDate("enroll_date"),
					              rset.getInt("board_view"))); 
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { 
			close(rset); 
			close(pstmt);	
		}
		
		return list;
		
	}
	
	public CommFile selectCommFreeFile(Connection conn, int commPostNo) {
		// select문 => ResultSet객체 
		CommFile cf = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null; 
		String sql = prop.getProperty("selectCommFreeFile"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, commPostNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				cf = new CommFile();
				cf.setFileNo(rset.getInt("file_no"));
				cf.setFileName(rset.getString("file_name"));
				cf.setFileUpdate(rset.getString("file_update"));
				cf.setFilePath(rset.getString("file_path"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt); 
		}
		
		return cf;		
		
	} 
	

	
	
}


