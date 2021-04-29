package com.dr.member.comm.model.dao;

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
import com.dr.member.comm.model.vo.CommFile;
import com.dr.member.comm.model.vo.Reply; 

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
	
	public int insertCommTipFile(Connection conn, CommFile cf) { 
		// insert문 
		int result = 0; 
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCommTipFile"); 
		
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
	
	
	// 나만의운동팁 검색 
	
	public int searchTipCount(Connection conn, String searchTipCtg, String searchTipText) {
		
		int listCount = 0; 
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		if(searchTipCtg.equals("제목")) { 
			
			String sql = prop.getProperty("searchTipTitleCount");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchTipText);
				
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
			
		}else { 
			String sql = prop.getProperty("searchTipContentCount"); 
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchTipText);
				
				rset = pstmt.executeQuery();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt); 
			}
			
			return listCount; 
			
		}
		
	}
	
	public ArrayList<Comm> searchTipList(Connection conn, PageInfo pi, String searchTipCtg, String searchTipText) {
		
		ArrayList<Comm> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		if(searchTipCtg.contentEquals("제목")) { 
			
			String sql = prop.getProperty("searchTipTitle");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, searchTipText);
				pstmt.setInt(2, (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1); 
				pstmt.setInt(3, pi.getCurrentPage() * pi.getBoardLimit());
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) { 
					list.add(new Comm(rset.getInt("comm_post_no"),
									  rset.getString("user_id"),
									  rset.getInt("file_no"),
									  rset.getString("category_name"),
									  rset.getString("post_content"), 
							          rset.getString("post_title"),
							          rset.getDate("enroll_date"),
							          rset.getDate("update_date"),
							          rset.getInt("board_view"),
							          rset.getString("status"),
							          rset.getInt("comm_no"),
							          rset.getInt("like_count")));
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					close(rset);
					close(pstmt); 
				} return list; 
			
		} else {
			
			String sql = prop.getProperty("searchTipContent");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, searchTipText);
				pstmt.setInt(2, (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
				pstmt.setInt(3, pi.getCurrentPage() * pi.getBoardLimit());
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) { 
					list.add(new Comm(rset.getInt("comm_post_no"),
							  rset.getString("user_id"),
							  rset.getInt("file_no"),
							  rset.getString("category_name"),
							  rset.getString("post_content"), 
					          rset.getString("post_title"),
					          rset.getDate("enroll_date"),
					          rset.getDate("update_Date"),
					          rset.getInt("board_view"),
					          rset.getString("status"),
					          rset.getInt("comm_no"),
					          rset.getInt("like_count")));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			} return list; 
			
		}
	
	}
		
			
	// 나만의운동팁 좋아요 
	public boolean likeCheck(Connection conn, int commPostNo, int userNo) {
		
		int likeCount = 0; 
		
		PreparedStatement pstmt = null; 
		ResultSet rset = null;
		
		String sql = prop.getProperty("likeCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, commPostNo);
			
			rset = pstmt.executeQuery(); 
			
			if(rset.next()) { 
				likeCount = rset.getInt("likecount"); 
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return likeCount > 0 ? true : false; 
		//	0보다 크다면 check => true   (좋아요 o)
		//  0보다 작다면 check => false  (좋아요 x)
		
	}
	
	public int deleteLike(Connection conn, int commPostNo, int userNo) {
		
		int result = 0; 
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteLike"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, commPostNo);
			
			result = pstmt.executeUpdate(); 
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt); 
		}
		
		return result; 
		
	}
	
	public int insertLike(Connection conn, int commPostNo, int userNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, commPostNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;

	}
	
	public int subLikeCount(Connection conn, int commPostNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("subLikeCount");
		
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
	
	public int sumLikeCount(Connection conn, int commPostNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("sumLikeCount");
		
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
	
	// 나만의운동팁 댓글 
	public ArrayList<Reply> selectReplyList(Connection conn, int commPostNo) { 
		// select문 => ResultSet (여러 행) 
		ArrayList<Reply> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null; 
		String sql = prop.getProperty("selectReplyList"); 
			
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
	
	public int insertReply(Connection conn, Reply r) { 
		// insert문 
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("insertReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getReplyContent());
			pstmt.setInt(2, r.getCommPostNo());
			pstmt.setInt(3, Integer.parseInt(r.getUserNo()));
			
			result = pstmt.executeUpdate(); 
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
		
		
	}
	
	public int insertReplyFree(Connection conn, Reply r) { 
		// insert문 
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("insertReplyFree");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getReplyContent());
			pstmt.setInt(2, r.getCommPostNo());
			pstmt.setInt(3, Integer.parseInt(r.getUserNo()));
			
			result = pstmt.executeUpdate(); 
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
			
	}
	
	public int insertReplyQ(Connection conn, Reply r) { 
		// insert문 
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("insertReplyQ");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getReplyContent());
			pstmt.setInt(2, r.getCommPostNo());
			pstmt.setInt(3, Integer.parseInt(r.getUserNo()));
			
			result = pstmt.executeUpdate(); 
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
		
		
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
	
	public int insertCommFreeFile(Connection conn, CommFile cf) { 
		// insert문 
		int result = 0; 
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCommFreeFile"); 
		
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
						     rset.getInt("file_no"),
						     rset.getString("category_name"),
						     rset.getString("post_content"),
						     rset.getString("post_title"),
						     rset.getDate("enroll_date"),
						     rset.getDate("update_date"),
						     rset.getInt("board_view"),
						     rset.getString("status"),
						     rset.getInt("comm_no"),
						     rset.getInt("like_count"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt); 
		}
		
		return c;
	
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
	
	public int updateCommFree(Connection conn, Comm c) {
		// update문 
		int result = 0; 
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateCommFree"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getPostTitle());
			pstmt.setString(2, c.getPostContent());
			pstmt.setInt(3, c.getCommPostNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt); 
		}
		
		return result; 
	
	}
	
	public int updateCommFreeFile(Connection conn, CommFile cf) {
		// update문 
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateCommFreeFile");
		
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
	
	public int insertNewCommFreeFile(Connection conn, CommFile cf) {
		// insert문 
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewCommFreeFile"); 
		
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
	
	public int deleteCommFree(Connection conn, int commPostNo) {
		// update문 
		int result = 0; 
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteCommFree");
		
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
	
	
	// 자유게시판 검색 
	
	public int searchFreeCount(Connection conn, String searchFreeCtg, String searchFreeText) {
			
		int listCount = 0; 
		PreparedStatement pstmt = null;
		ResultSet rset = null;
			
		if(searchFreeCtg.equals("제목")) { 
				
			String sql = prop.getProperty("searchFreeTitleCount");
				
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchFreeText);
					
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
				
		}else { 
			String sql = prop.getProperty("searchFreeContentCount"); 
				
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchFreeText);
					
				rset = pstmt.executeQuery();
					
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt); 
			}
				
			return listCount; 
				
		}
			
	}
		
	public ArrayList<Comm> searchFreeList(Connection conn, PageInfo pi, String searchFreeCtg, String searchFreeText) {
			
		ArrayList<Comm> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
			
		if(searchFreeCtg.contentEquals("제목")) { 
				
			String sql = prop.getProperty("searchFreeTitle");
				
			try {
				pstmt = conn.prepareStatement(sql);
					
				pstmt.setString(1, searchFreeText);
				pstmt.setInt(2, (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1); 
				pstmt.setInt(3, pi.getCurrentPage() * pi.getBoardLimit());
					
				rset = pstmt.executeQuery();
					
				while(rset.next()) { 
					list.add(new Comm(rset.getInt("comm_post_no"),
									  rset.getString("user_id"),
									  rset.getInt("file_no"),
									  rset.getString("category_name"),
									  rset.getString("post_content"), 
							          rset.getString("post_title"),
							          rset.getDate("enroll_date"),
							          rset.getDate("update_date"),
							          rset.getInt("board_view"),
							          rset.getString("status"),
							          rset.getInt("comm_no"),
							          rset.getInt("like_count")));
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					close(rset);
					close(pstmt); 
				} return list; 
				
		} else {
				
			String sql = prop.getProperty("searchFreeContent");
				
			try {
				pstmt = conn.prepareStatement(sql);
					
				pstmt.setString(1, searchFreeText);
				pstmt.setInt(2, (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
				pstmt.setInt(3, pi.getCurrentPage() * pi.getBoardLimit());
					
				rset = pstmt.executeQuery();
					
				while(rset.next()) { 
					list.add(new Comm(rset.getInt("comm_post_no"),
									  rset.getString("user_id"),
								      rset.getInt("file_no"),
								      rset.getString("category_name"),
								      rset.getString("post_content"), 
								      rset.getString("post_title"),
								      rset.getDate("enroll_date"),
								      rset.getDate("update_Date"),
								      rset.getInt("board_view"),
								      rset.getString("status"),
								      rset.getInt("comm_no"),
								      rset.getInt("like_count")));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			} return list; 
				
		}
		
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
	
	public int insertCommQ(Connection conn, Comm c) {
		// insert문
		int result = 0; 
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCommQ"); 
		
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
	
	public int insertCommQFile(Connection conn, CommFile cf) { 
		// insert문 
		int result = 0; 
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCommQFile"); 
		
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
	
	public Comm selectCommQ(Connection conn, int commPostNo) {
		// select문 => ResultSet객체 한 행 
		Comm c = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null; // 조회문이기 때문에 rset 필요 
		String sql = prop.getProperty("selectCommQ");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, commPostNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) { 
				c = new Comm(rset.getInt("comm_post_no"),
						     rset.getString("user_id"),
						     rset.getInt("file_no"),
						     rset.getString("category_name"),
						     rset.getString("post_content"),
						     rset.getString("post_title"),
						     rset.getDate("enroll_date"),
						     rset.getDate("update_date"),
						     rset.getInt("board_view"),
						     rset.getString("status"),
						     rset.getInt("comm_no"),
						     rset.getInt("like_count"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt); 
		}
		
		return c;
	
	}
	
	public CommFile selectCommQFile(Connection conn, int commPostNo) {
		// select문 => ResultSet객체 
		CommFile cf = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null; 
		String sql = prop.getProperty("selectCommQFile"); 
		
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
	
	public int updateCommQ(Connection conn, Comm c) {
		// update문 
		int result = 0; 
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateCommQ"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getPostTitle());
			pstmt.setString(2, c.getPostContent());
			pstmt.setInt(3, c.getCommPostNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt); 
		}
		
		return result; 
	
	}
	
	public int updateCommQFile(Connection conn, CommFile cf) {
		// update문 
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateCommQFile");
		
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
	
	public int insertNewCommQFile(Connection conn, CommFile cf) {
		// insert문 
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewCommQFile"); 
		
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
	
	public int deleteCommQ(Connection conn, int commPostNo) {
		// update문 
		int result = 0; 
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteCommQ");
		
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
	
	
	
	// 질문게시판 검색 
	
	public int searchQCount(Connection conn, String searchQCtg, String searchQText) {
				
		int listCount = 0; 
		PreparedStatement pstmt = null;
		ResultSet rset = null;
				
		if(searchQCtg.equals("제목")) { 
					
			String sql = prop.getProperty("searchQTitleCount");
					
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchQText);
						
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
					
		}else { 
			String sql = prop.getProperty("searchQContentCount"); 
					
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchQText);
						
				rset = pstmt.executeQuery();
						
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt); 
			}
					
			return listCount; 
					
		}
				
	}
			
	public ArrayList<Comm> searchQList(Connection conn, PageInfo pi, String searchQCtg, String searchQText) {
				
		ArrayList<Comm> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
				
		if(searchQCtg.contentEquals("제목")) { 
					
			String sql = prop.getProperty("searchQTitle");
					
			try {
				pstmt = conn.prepareStatement(sql);
						
				pstmt.setString(1, searchQText);
				pstmt.setInt(2, (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1); 
				pstmt.setInt(3, pi.getCurrentPage() * pi.getBoardLimit());
						
				rset = pstmt.executeQuery();
						
				while(rset.next()) { 
					list.add(new Comm(rset.getInt("comm_post_no"),
									  rset.getString("user_id"),
									  rset.getInt("file_no"),
									  rset.getString("category_name"),
									  rset.getString("post_content"), 
							          rset.getString("post_title"),
							          rset.getDate("enroll_date"),
							          rset.getDate("update_date"),
							          rset.getInt("board_view"),
							          rset.getString("status"),
							          rset.getInt("comm_no"),
							          rset.getInt("like_count")));
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					close(rset);
					close(pstmt); 
				} return list; 
					
		} else {
					
			String sql = prop.getProperty("searchQContent");
					
			try {
				pstmt = conn.prepareStatement(sql);
						
				pstmt.setString(1, searchQText);
				pstmt.setInt(2, (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
				pstmt.setInt(3, pi.getCurrentPage() * pi.getBoardLimit());
						
				rset = pstmt.executeQuery();
						
				while(rset.next()) { 
					list.add(new Comm(rset.getInt("comm_post_no"),
									  rset.getString("user_id"),
								      rset.getInt("file_no"),
								 	  rset.getString("category_name"),
									  rset.getString("post_content"), 
									  rset.getString("post_title"),
									  rset.getDate("enroll_date"),
									  rset.getDate("update_Date"),
								      rset.getInt("board_view"),
									  rset.getString("status"),
								      rset.getInt("comm_no"),
								      rset.getInt("like_count")));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			} return list; 
					
		}
			
	}
	
	
	
	
	//mainPage comm list
	public ArrayList<Comm> selectCommList(Connection conn){
		//select문 
		ArrayList<Comm> list1 = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCommList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) { 
	            list1.add(new Comm(rset.getInt("comm_post_no"),
	            				 rset.getString("post_title"),
	            				 rset.getString("user_id"),
	                             rset.getDate("enroll_date"),
	                             rset.getInt("board_view"))); 
	         }
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally { 
	         close(rset); 
	         close(pstmt);   
	      }
	      
	      return list1;
			
		
		
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
}


