package com.dr.admin.ht.model.service;

import static com.dr.common.JDBCTemplate.close;
import static com.dr.common.JDBCTemplate.commit;
import static com.dr.common.JDBCTemplate.getConnection;
import static com.dr.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.dr.admin.ht.model.dao.adHTDao;
import com.dr.admin.ht.model.vo.adHT;
import com.dr.admin.info.model.dao.adInfoDao;
import com.dr.admin.info.model.vo.adInfo;
import com.dr.common.model.vo.PageInfo;

public class adHTService {
	
	
		//전체게시글 카운트
		public int selectListCountAll() {
			Connection conn = getConnection();
			
			int listCount = new adHTDao().selectListCountAll(conn);
			
			close(conn);
			return listCount;
		}	

		// 전체게시글 리스트
		public ArrayList<adHT> selectListAll(PageInfo pi) {
			Connection conn = getConnection();
			ArrayList <adHT> list = new adHTDao().selectListAll(conn, pi);
			close(conn);
			return list;
			
		}

		
		//글쓰기
		public int insertHT(adHT t) {
			Connection conn = getConnection();
			
			int result = new adHTDao().insertHT(conn, t);
			
			
			if(result > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			
			close(conn);
			
			return result;
		}

		//카테고리별 카운트
		public int selectListCount(String ctg) {
			Connection conn = getConnection();
			
			int listCount = new adHTDao().selectListCount(conn, ctg);
			
			close(conn);
			return listCount;
		}

		// 카테고리 리스트
		public ArrayList<adHT> selectList(PageInfo pi, String ctg) {
			Connection conn = getConnection();
			ArrayList <adHT> list = new adHTDao().selectList(conn, pi, ctg);
			close(conn);
			return list;
			
		}

		
		// 게시글조회 조회수
		public int HTIncreaseCount(int htNo) {
			Connection conn = getConnection();
			
			int result = new adHTDao().HTIncreaseCount(conn, htNo);
			
			if(result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
			
			close(conn);
			return result;
		}

		// 게시글조회
		public adHT selectHT(int htNo) {
			Connection conn = getConnection();
			
			adHT t = new adHTDao().selectHT(conn, htNo);
			close(conn);
			return t;
		}

		// 게시글 삭제
		public int deleteHT(int htNo) {
			Connection conn = getConnection();
			
			int result = new adHTDao().deleteHT(conn, htNo);
			
			if(result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
			
			close(conn);
			return result;
		}

		// 게시글 업데이트
		public int updateHT(adHT t) {
			Connection conn = getConnection();
			
			int result = new adHTDao().updateHT(conn, t);
			
			
			if(result > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			
			close(conn);
			
			return result;
		}


}
