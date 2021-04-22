package com.dr.admin.ht.model.vo;

import java.sql.Date;

public class AdHT {
	
	private int htPostNo;
	private int userNo;
	private String htPostContent;
	private String htPostTitle;
	private String htComment;
	private String htRecommend;
	private String htHowToWork;
	private String htSuggestion;
	private String categoryName;
	private Date htEnrollDate;
	private Date htUpdateDate;
	private int htBoardView;
	private int htLikeCount;
	private String status;
	private String videoLink;
	
	public AdHT() {}

	public AdHT(int htPostNo, int userNo, String htPostContent, String htPostTitle, String htComment,
			String htRecommend, String htHowToWork, String htSuggestion, String categoryName, Date htEnrollDate,
			Date htUpdateDate, int htBoardView, int htLikeCount, String status, String videoLink) {
		super();
		this.htPostNo = htPostNo;
		this.userNo = userNo;
		this.htPostContent = htPostContent;
		this.htPostTitle = htPostTitle;
		this.htComment = htComment;
		this.htRecommend = htRecommend;
		this.htHowToWork = htHowToWork;
		this.htSuggestion = htSuggestion;
		this.categoryName = categoryName;
		this.htEnrollDate = htEnrollDate;
		this.htUpdateDate = htUpdateDate;
		this.htBoardView = htBoardView;
		this.htLikeCount = htLikeCount;
		this.status = status;
		this.videoLink = videoLink;
	}

	

//	순서!!!!
// 게시글 전체 조회
	public AdHT(int htPostNo, int userNo, String htPostTitle, String categoryName, Date htEnrollDate, Date htUpdateDate,
			int htBoardView) {
		super();
		this.htPostNo = htPostNo;
		this.userNo = userNo;
		this.htPostTitle = htPostTitle;
		this.categoryName = categoryName;
		this.htEnrollDate = htEnrollDate;
		this.htUpdateDate = htUpdateDate;
		this.htBoardView = htBoardView;
	}

	public AdHT(int htPostNo, String categoryName, String htPostTitle, int userNo,  Date htEnrollDate, Date htUpdateDate,
			int htBoardView) {
		super();
		this.htPostNo = htPostNo;
		this.categoryName = categoryName;
		this.htPostTitle = htPostTitle;
		this.userNo = userNo;
		this.htEnrollDate = htEnrollDate;
		this.htUpdateDate = htUpdateDate;
		this.htBoardView = htBoardView;
	}
	
	
	public AdHT(int htPostNo, String htPostTitle, String categoryName, Date htEnrollDate, Date htUpdateDate,
			int htBoardView) {
		super();
		this.htPostNo = htPostNo;
		this.htPostTitle = htPostTitle;
		this.categoryName = categoryName;
		this.htEnrollDate = htEnrollDate;
		this.htUpdateDate = htUpdateDate;
		this.htBoardView = htBoardView;
	}

	public int getHtPostNo() {
		return htPostNo;
	}

	public void setHtPostNo(int htPostNo) {
		this.htPostNo = htPostNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getHtPostContent() {
		return htPostContent;
	}

	public void setHtPostContent(String htPostContent) {
		this.htPostContent = htPostContent;
	}

	public String getHtPostTitle() {
		return htPostTitle;
	}

	public void setHtPostTitle(String htPostTitle) {
		this.htPostTitle = htPostTitle;
	}

	public String getHtComment() {
		return htComment;
	}

	public void setHtComment(String htComment) {
		this.htComment = htComment;
	}

	public String getHtRecommend() {
		return htRecommend;
	}

	public void setHtRecommend(String htRecommend) {
		this.htRecommend = htRecommend;
	}

	public String getHtHowToWork() {
		return htHowToWork;
	}

	public void setHtHowToWork(String htHowToWork) {
		this.htHowToWork = htHowToWork;
	}

	public String getHtSuggestion() {
		return htSuggestion;
	}

	public void setHtSuggestion(String htSuggestion) {
		this.htSuggestion = htSuggestion;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public Date getHtEnrollDate() {
		return htEnrollDate;
	}

	public void setHtEnrollDate(Date htEnrollDate) {
		this.htEnrollDate = htEnrollDate;
	}

	public Date getHtUpdateDate() {
		return htUpdateDate;
	}

	public void setHtUpdateDate(Date htUpdateDate) {
		this.htUpdateDate = htUpdateDate;
	}

	public int getHtBoardView() {
		return htBoardView;
	}

	public void setHtBoardView(int htBoardView) {
		this.htBoardView = htBoardView;
	}

	public int getHtLikeCount() {
		return htLikeCount;
	}

	public void setHtLikeCount(int htLikeCount) {
		this.htLikeCount = htLikeCount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getVideoLink() {
		return videoLink;
	}

	public void setVideoLink(String videoLink) {
		this.videoLink = videoLink;
	}

	@Override
	public String toString() {
		return "adHT [htPostNo=" + htPostNo + ", userNo=" + userNo + ", htPostContent=" + htPostContent
				+ ", htPostTitle=" + htPostTitle + ", htComment=" + htComment + ", htRecommend=" + htRecommend
				+ ", htHowToWork=" + htHowToWork + ", htSuggestion=" + htSuggestion + ", categoryName=" + categoryName
				+ ", htEnrollDate=" + htEnrollDate + ", htUpdateDate=" + htUpdateDate + ", htBoardView=" + htBoardView
				+ ", htLikeCount=" + htLikeCount + ", status=" + status + ", videoLink=" + videoLink + "]";
	}
	
	
	
	
}
