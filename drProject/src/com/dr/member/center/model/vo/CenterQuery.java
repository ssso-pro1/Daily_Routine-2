package com.dr.member.center.model.vo;

import java.sql.Date;

public class CenterQuery {

	private int queryNo;
	private int userNo;
	private String queryCategory;
	private String queryTitle;
	private String queryContent;
	private Date queryCreateDate;
	private String replyStatus;
	private String replyContent;
	private Date replyDate;
	
	public CenterQuery() {}

	public CenterQuery(int queryNo, int userNo, String queryCategory, String queryTitle, String queryContent,
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

	@Override
	public String toString() {
		return "CenterQuery [queryNo=" + queryNo + ", userNo=" + userNo + ", queryCategory=" + queryCategory
				+ ", queryTitle=" + queryTitle + ", queryContent=" + queryContent + ", queryCreateDate="
				+ queryCreateDate + ", replyStatus=" + replyStatus + ", replyContent=" + replyContent + ", replyDate="
				+ replyDate + "]";
	}
	
	
	
	
	
	
}
