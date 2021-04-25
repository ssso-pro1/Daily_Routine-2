package com.dr.admin.ht.model.vo;

import java.sql.Date;

public class AdHT {
	
	private int htPostNo;
	private String userNo;
	private String htPostTitle;
	private String htPostContent;
	private String categoryName;
	private Date htEnrollDate;
	private Date htUpdateDate;
	private int htBoardView;
	private int htLikeCount;
	private String status;
	private int fileNo;
	private String videoLink;
	
	public AdHT() {}

	public AdHT(int htPostNo, String userNo, String htPostTitle, String htPostContent, String categoryName,
			Date htEnrollDate, Date htUpdateDate, int htBoardView, int htLikeCount, String status, int fileNo,
			String videoLink) {
		super();
		this.htPostNo = htPostNo;
		this.userNo = userNo;
		this.htPostTitle = htPostTitle;
		this.htPostContent = htPostContent;
		this.categoryName = categoryName;
		this.htEnrollDate = htEnrollDate;
		this.htUpdateDate = htUpdateDate;
		this.htBoardView = htBoardView;
		this.htLikeCount = htLikeCount;
		this.status = status;
		this.fileNo = fileNo;
		this.videoLink = videoLink;
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

	
	
	
	public AdHT(int htPostNo, String userNo, String htPostTitle, String htPostContent, String categoryName,
			Date htEnrollDate, String videoLink) {
		super();
		this.htPostNo = htPostNo;
		this.userNo = userNo;
		this.htPostTitle = htPostTitle;
		this.htPostContent = htPostContent;
		this.categoryName = categoryName;
		this.htEnrollDate = htEnrollDate;
		this.videoLink = videoLink;
	}

	public int getHtPostNo() {
		return htPostNo;
	}

	public void setHtPostNo(int htPostNo) {
		this.htPostNo = htPostNo;
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	public String getHtPostTitle() {
		return htPostTitle;
	}

	public void setHtPostTitle(String htPostTitle) {
		this.htPostTitle = htPostTitle;
	}

	public String getHtPostContent() {
		return htPostContent;
	}

	public void setHtPostContent(String htPostContent) {
		this.htPostContent = htPostContent;
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

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getVideoLink() {
		return videoLink;
	}

	public void setVideoLink(String videoLink) {
		this.videoLink = videoLink;
	}

	@Override
	public String toString() {
		return "AdHT [htPostNo=" + htPostNo + ", userNo=" + userNo + ", htPostTitle=" + htPostTitle + ", htPostContent="
				+ htPostContent + ", categoryName=" + categoryName + ", htEnrollDate=" + htEnrollDate
				+ ", htUpdateDate=" + htUpdateDate + ", htBoardView=" + htBoardView + ", htLikeCount=" + htLikeCount
				+ ", status=" + status + ", fileNo=" + fileNo + ", videoLink=" + videoLink + "]";
	}

	

	
	

	
	
	
	
}
