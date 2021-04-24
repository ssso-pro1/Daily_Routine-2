package com.dr.member.center.model.vo;

import java.sql.Date;

public class CenterNotice {

	private int noticeNo;
	private int userNo;
	private String noticeTitle;
	private String noticeContent;
	private int noticeCount;
	private Date createDate;
	private Date updateDate;
	private String status;	
	
	private String userId;
	
	public CenterNotice() {}

	public CenterNotice(int noticeNo, int userNo, String noticeTitle, String noticeContent, int noticeCount,
			Date createDate, Date updateDate, String status) {
		super();
		this.noticeNo = noticeNo;
		this.userNo = userNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeCount = noticeCount;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.status = status;
	}
	
	
	
	

	
	
	
	

	



	public CenterNotice(int noticeNo, String noticeTitle, Date createDate, int noticeCount) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.createDate = createDate;
		this.noticeCount = noticeCount;
	}

	public CenterNotice(int noticeNo, int userNo, String noticeTitle, String noticeContent, int noticeCount,
			Date createDate, Date updateDate, String status, String userId) {
		super();
		this.noticeNo = noticeNo;
		this.userNo = userNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeCount = noticeCount;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.status = status;
		this.userId = userId;
	}

	public CenterNotice(int noticeNo, String noticeTitle, String status) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.status = status;
	}

	public CenterNotice(int noticeNo, String noticeTitle, String noticeContent, int noticeCount, Date createDate,
			Date updateDate, String status, String userId) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeCount = noticeCount;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.status = status;
		this.userId = userId;
	}

	public CenterNotice(int noticeNo, String noticeTitle, String noticeContent, Date createDate, int noticeCount,
			String status) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.createDate = createDate;
		this.noticeCount = noticeCount;
		this.status = status;
	}

	public CenterNotice(int noticeNo, String noticeTitle, String noticeContent, Date createDate, int noticeCount ) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.createDate = createDate;
		this.noticeCount = noticeCount;
	}

	public CenterNotice(int noticeNo, String noticeTitle) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
	}

	public CenterNotice(int noticeNo, String noticeTitle, String noticeContent, Date createDate) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.createDate = createDate;
	}
	
	


	

	public CenterNotice(String noticeTitle, String noticeContent, Date createDate) {
		super();
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.createDate = createDate;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public int getNoticeCount() {
		return noticeCount;
	}

	public void setNoticeCount(int noticeCount) {
		this.noticeCount = noticeCount;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "CenterNotice [noticeNo=" + noticeNo + ", userNo=" + userNo + ", noticeTitle=" + noticeTitle
				+ ", noticeContent=" + noticeContent + ", noticeCount=" + noticeCount + ", createDate=" + createDate
				+ ", updateDate=" + updateDate + ", status=" + status + ", userId=" + userId + "]";
	}

	
	

	
	
	
	
	
}
