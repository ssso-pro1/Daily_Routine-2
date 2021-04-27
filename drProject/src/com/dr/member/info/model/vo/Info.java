package com.dr.member.info.model.vo;

import java.sql.Date;

public class Info {

	private int intPostNo;			// 인포앤팁 게시글번호 
	private String userNo; 			// 회원번호(작성자 회원번호) 
	private String categoryName;	// 카테고리명(1:운동/2:식단)
	private String postContent; 	// 게시글내용 
	private String postTitle; 		// 게시글제목 
	private Date enrollDate; 		// 게시글작성일 
	private int boardView;			// 게시글조회수 
	private int likeCount; 			// 게시글좋아요수 
	private String status; 			// 게시여부(Y/N) 기본값 Y 
	
	private String titleImg;		// 해당 게시글 대표이미지경로
	
	public Info(){}

	public Info(int intPostNo, String userNo, String categoryName, String postContent, String postTitle,
			Date enrollDate, int boardView, int likeCount, String status, String titleImg) {
		super();
		this.intPostNo = intPostNo;
		this.userNo = userNo;
		this.categoryName = categoryName;
		this.postContent = postContent;
		this.postTitle = postTitle;
		this.enrollDate = enrollDate;
		this.boardView = boardView;
		this.likeCount = likeCount;
		this.status = status;
		this.titleImg = titleImg;
	}	

	public Info(int intPostNo, String postContent, String postTitle, Date enrollDate, int boardView, int likeCount) {
		super();
		this.intPostNo = intPostNo;
		this.postContent = postContent;
		this.postTitle = postTitle;
		this.enrollDate = enrollDate;
		this.boardView = boardView;
		this.likeCount = likeCount;
	}	

	public Info(int intPostNo, String categoryName, String postTitle, Date enrollDate, int boardView) {
		super();
		this.intPostNo = intPostNo;
		this.categoryName = categoryName;
		this.postTitle = postTitle;
		this.enrollDate = enrollDate;
		this.boardView = boardView;
	}

	public int getIntPostNo() {
		return intPostNo;
	}

	public void setIntPostNo(int intPostNo) {
		this.intPostNo = intPostNo;
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public int getBoardView() {
		return boardView;
	}

	public void setBoardView(int boardView) {
		this.boardView = boardView;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getTitleImg() {
		return titleImg;
	}

	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}

	@Override
	public String toString() {
		return "Info [intPostNo=" + intPostNo + ", userNo=" + userNo + ", categoryName="
				+ categoryName + ", postContent=" + postContent + ", postTitle=" + postTitle + ", enrollDate="
				+ enrollDate + ", boardView=" + boardView + ", likeCount=" + likeCount
				+ ", status=" + status + ", titleImg=" + titleImg + "]";
	}

}
