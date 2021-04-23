package com.dr.member.info.model.vo;

import java.sql.Date;

public class Info {

	private int intPostNo;			// 인포앤팁 게시글번호 
	private String userNo; 			// 회원번호(작성자 회원번호) 
	private int fileNo;				// 파일번호 
	private String categoryName;	// 카테고리명(1:운동/2:식단)
	private String postContent; 	// 게시글내용 
	private String postTitle; 		// 게시글제목 
	private Date enrollDate; 		// 게시글등록일 
	private Date updateDate;		// 게시글수정일 
	private int boardView;			// 게시글조회수 
	private int likeCount; 			// 게시글좋아요수 
	private String status; 			// 삭제유무(Y/N)
	private int intNo; 			// 게시판번호(1:운동/2:식단/3:전체)
	
	private String titleImg;		// 해당 게시글 대표이미지경로
	
	public Info(){}

	public Info(int intPostNo, String userNo, int fileNo, String categoryName, String postContent, String postTitle,
			Date enrollDate, Date updateDate, int boardView, int likeCount, String status, int intNo) {
		super();
		this.intPostNo = intPostNo;
		this.userNo = userNo;
		this.fileNo = fileNo;
		this.categoryName = categoryName;
		this.postContent = postContent;
		this.postTitle = postTitle;
		this.enrollDate = enrollDate;
		this.updateDate = updateDate;
		this.boardView = boardView;
		this.likeCount = likeCount;
		this.status = status;
		this.intNo = intNo;
	}
	
	public Info(int intPostNo, String categoryName, String postContent, String postTitle, Date enrollDate,
			int boardView, int likeCount) {
		super();
		this.intPostNo = intPostNo;
		this.categoryName = categoryName;
		this.postContent = postContent;
		this.postTitle = postTitle;
		this.enrollDate = enrollDate;
		this.boardView = boardView;
		this.likeCount = likeCount;
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

	public String getTitleImg() {
		return titleImg;
	}

	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
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

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
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

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
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

	public int getIntNo() {
		return intNo;
	}

	public void setIntNo(int intNo) {
		this.intNo = intNo;
	}

	@Override
	public String toString() {
		return "Info [intPostNo=" + intPostNo + ", userNo=" + userNo + ", fileNo=" + fileNo + ", categoryName="
				+ categoryName + ", postContent=" + postContent + ", postTitle=" + postTitle + ", enrollDate="
				+ enrollDate + ", updateDate=" + updateDate + ", boardView=" + boardView + ", likeCount=" + likeCount
				+ ", status=" + status + ", intNo=" + intNo + "]";
	}
	
}
