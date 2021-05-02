package com.dr.admin.ht.model.vo;

import java.sql.Date;

public class adHT {
	
	private int htPostNo;
	private int userNo;
	private String htPostTitle;
	private String htPostContent;
	private String categoryName;
	private Date htEnrollDate;
	private Date htUpdateDate;
	private int htBoardView;
	private int htLikeCount;
	private String status;
	private String fileName;
	private String fileUpdate;
	private String filePath;
	
	private String userId;
	private String titleImg;
	
	
	public adHT() {}


	public adHT(int htPostNo, int userNo, String htPostTitle, String htPostContent, String categoryName,
			Date htEnrollDate, Date htUpdateDate, int htBoardView, int htLikeCount, String status, String fileName,
			String fileUpdate, String filePath, String userId, String titleImg) {
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
		this.fileName = fileName;
		this.fileUpdate = fileUpdate;
		this.filePath = filePath;
		this.userId = userId;
		this.titleImg = titleImg;
	}
	
	
	


	public adHT(int htPostNo, String htPostTitle, String categoryName, Date htEnrollDate, String status, String userId,
			String titleImg) {
		super();
		this.htPostNo = htPostNo;
		this.htPostTitle = htPostTitle;
		this.categoryName = categoryName;
		this.htEnrollDate = htEnrollDate;
		this.status = status;
		this.userId = userId;
		this.titleImg = titleImg;
	}
	
	


	public adHT(int htPostNo, String htPostTitle, String categoryName, Date htEnrollDate, String status,
			String fileUpdate, String filePath, String userId) {
		super();
		this.htPostNo = htPostNo;
		this.htPostTitle = htPostTitle;
		this.categoryName = categoryName;
		this.htEnrollDate = htEnrollDate;
		this.status = status;
		this.fileUpdate = fileUpdate;
		this.filePath = filePath;
		this.userId = userId;
	}
	
	


	public adHT(int htPostNo, String categoryName, String htPostTitle, String htPostContent,  Date htEnrollDate,
			Date htUpdateDate, String status, String userId, String titleImg) {
		super();
		this.htPostNo = htPostNo;
		this.categoryName = categoryName;
		this.htPostTitle = htPostTitle;
		this.htPostContent = htPostContent;
		
		this.htEnrollDate = htEnrollDate;
		this.htUpdateDate = htUpdateDate;
		this.status = status;
		this.userId = userId;
		this.titleImg = titleImg;
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


	public String getFileName() {
		return fileName;
	}


	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


	public String getFileUpdate() {
		return fileUpdate;
	}


	public void setFileUpdate(String fileUpdate) {
		this.fileUpdate = fileUpdate;
	}


	public String getFilePath() {
		return filePath;
	}


	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getTitleImg() {
		return titleImg;
	}


	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}


	@Override
	public String toString() {
		return "adHT [htPostNo=" + htPostNo + ", userNo=" + userNo + ", htPostTitle=" + htPostTitle + ", htPostContent="
				+ htPostContent + ", categoryName=" + categoryName + ", htEnrollDate=" + htEnrollDate
				+ ", htUpdateDate=" + htUpdateDate + ", htBoardView=" + htBoardView + ", htLikeCount=" + htLikeCount
				+ ", status=" + status + ", fileName=" + fileName + ", fileUpdate=" + fileUpdate + ", filePath="
				+ filePath + ", userId=" + userId + ", titleImg=" + titleImg + "]";
	}


}	