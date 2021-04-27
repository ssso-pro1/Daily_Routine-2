package com.dr.member.myDR.model.service;

import static com.dr.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.dr.common.model.vo.PageInfo;
import com.dr.member.comm.model.vo.Comm;
import com.dr.member.comm.model.vo.Reply;
import com.dr.member.ht.model.dao.HtDao;
import com.dr.member.ht.model.vo.Ht;
import com.dr.member.info.model.vo.Info;
import com.dr.member.myDR.model.dao.MyDrDao;
import com.dr.member.myDR.model.vo.Bookmark;


public class MyDrService {

	public int selectbkListCount(int userNo) {
		Connection conn = getConnection();
		int listCount = new MyDrDao().selectbkListCount(conn, userNo);
		close(conn);
		return listCount;
	}

	public ArrayList<Comm> selectMyPostList(PageInfo pi, int userNo) {
		Connection conn = getConnection();
		ArrayList<Comm> list = new MyDrDao().selectMyPostList(conn, pi, userNo);
		close(conn);
		return list;
	}

	public int selectMyPostListCount(int userNo) {
		Connection conn = getConnection();
		int postListCount = new MyDrDao().selectMyPostListCount(conn, userNo);
		close(conn);
		return postListCount;
	}

	public int selectMyReplyListCount(int userNo) {
		Connection conn = getConnection();
		int replyListCount = new MyDrDao().selectMyReplyListCount(conn, userNo);
		close(conn);
		return replyListCount;
	}

	public ArrayList<Reply> selectMyReplyList(PageInfo pi, int userNo) {
		Connection conn = getConnection();
		ArrayList<Reply> list = new MyDrDao().selectMyReplyList(conn, pi, userNo);
		close(conn);
		return list;
	}

	public int selectHtBookmarkListCount(int userNo) {
		Connection conn = getConnection();
		int listCount = new MyDrDao().selectHtBookmarkListCount(conn, userNo);
		close(conn);
		return listCount;
	}

	public ArrayList<Ht> selectHtBookmarkList(PageInfo pi, int userNo) {
		Connection conn = getConnection();
		ArrayList<Ht> list = new MyDrDao().selectHtBookmarkList(conn, pi, userNo);
		close(conn);
		return list;
	}

	public int selectItBookmarkListCount(int userNo) {
		Connection conn = getConnection();
		int listCount = new MyDrDao().selectItBookmarkListCount(conn, userNo);
		close(conn);
		return listCount;
	}

	public ArrayList<Info> selectItBookmarkList(PageInfo pi, int userNo) {
		Connection conn = getConnection();
		ArrayList<Info> list = new MyDrDao().selectItBookmarkList(conn, pi, userNo);
		close(conn);
		return list;
	}
	
	
}
