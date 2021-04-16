package com.dr.member.comm.model.vo;

import java.sql.Date;

public class Comm {
	
	COMM_POST_NO private int commPostNo; // 커뮤니티 게시글번호 
	USER_NO	 private int userNo; // 회원번호 
	FILE_NO	 private int fileNo; // 파일번호 
	CATEGORY_NAME private String categoryName; // 카테고리명  
	POST_CONTENT private String postContent; // 게시글내용  
	POST_TITLE private String postTitle; // 게시글제목 
	ENROLL_DATE private Date enrollDate; // 게시글등록일 
	UPDATE_DATE private Date updateDate; // 게시글수정일
	BOARD_VIEW private int boardView; // 게시글조회수 
	STATUS // private 게시글삭제유무(Y/N) 
	ADMIN_NOTICE // 관리자공지글여부(Y/N) 
}
