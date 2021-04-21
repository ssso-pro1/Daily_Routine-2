package com.dr.admin.center.model.vo;

import java.sql.Date;

public class adCenterQuery {

	private int queryNo;
	private int userNo;
	private String queryCategory;
	private String queryTitle;
	private String queryContent;
	private Date queryCreateDate;
	private String queryStatus;
	private String replyStatus;
	private String replyContent;
	private Date replyDate;
	
	private String userId;
	
	public adCenterQuery() {}

	public adCenterQuery(int queryNo, int userNo, String queryCategory, String queryTitle, String queryContent,
			Date queryCreateDate, String replyStatus, String replyContent, Date replyDate) {
		super();
		this.queryNo = queryNo;
		this.userNo = userNo;
		this.queryCategory = queryCategory;
		this.queryTitle = queryTitle;
		this.queryContent = queryContent;
		this.queryCreateDate = queryCreateDate;
		this.replyStatus = replyStatus;
		this.replyContent = replyContent;
		this.replyDate = replyDate;
	}
	
	

	public adCenterQuery(int queryNo, String queryCategory, String queryTitle, Date queryCreateDate, String replyStatus,
			Date replyDate, String userId) {
		super();
		this.queryNo = queryNo;
		this.queryCategory = queryCategory;
		this.queryTitle = queryTitle;
		this.queryCreateDate = queryCreateDate;
		this.replyStatus = replyStatus;
		this.replyDate = replyDate;
		this.userId = userId;
	}
	
	

	

	public adCenterQuery(int queryNo, String queryCategory, String queryTitle, String queryContent,
			Date queryCreateDate, String queryStatus, String replyStatus, String replyContent, Date replyDate,
			String userId) {
		super();
		this.queryNo = queryNo;
		this.queryCategory = queryCategory;
		this.queryTitle = queryTitle;
		this.queryContent = queryContent;
		this.queryCreateDate = queryCreateDate;
		this.queryStatus = queryStatus;
		this.replyStatus = replyStatus;
		this.replyContent = replyContent;
		this.replyDate = replyDate;
		this.userId = userId;
	}

	public int getQueryNo() {
		return queryNo;
	}

	public void setQueryNo(int queryNo) {
		this.queryNo = queryNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getQueryCategory() {
		return queryCategory;
	}

	public void setQueryCategory(String queryCategory) {
		this.queryCategory = queryCategory;
	}

	public String getQueryTitle() {
		return queryTitle;
	}

	public void setQueryTitle(String queryTitle) {
		this.queryTitle = queryTitle;
	}

	public String getQueryContent() {
		return queryContent;
	}

	public void setQueryContent(String queryContent) {
		this.queryContent = queryContent;
	}

	public Date getQueryCreateDate() {
		return queryCreateDate;
	}

	public void setQueryCreateDate(Date queryCreateDate) {
		this.queryCreateDate = queryCreateDate;
	}

	public String getQueryStatus() {
		return queryStatus;
	}

	public void setQueryStatus(String queryStatus) {
		this.queryStatus = queryStatus;
	}

	public String getReplyStatus() {
		return replyStatus;
	}

	public void setReplyStatus(String replyStatus) {
		this.replyStatus = replyStatus;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public Date getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "adCenterQuery [queryNo=" + queryNo + ", userNo=" + userNo + ", queryCategory=" + queryCategory
				+ ", queryTitle=" + queryTitle + ", queryContent=" + queryContent + ", queryCreateDate="
				+ queryCreateDate + ", queryStatus=" + queryStatus + ", replyStatus=" + replyStatus + ", replyContent="
				+ replyContent + ", replyDate=" + replyDate + ", userId=" + userId + "]";
	}
}
	