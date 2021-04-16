package com.dr.member.center.model.vo;

import java.sql.Date;

public class CenterFaq {
	
	private int faqNo;
	private int userNo;
	private String faqCategory;
	private String faqTitle;
	private String faqContent;
	private Date createDate;
	private Date updateDate;
	private String status;
	
	public CenterFaq() {}

	public CenterFaq(int faqNo, int userNo, String faqCategory, String faqTitle, String faqContent, Date createDate,
			Date updateDate, String status) {
		super();
		this.faqNo = faqNo;
		this.userNo = userNo;
		this.faqCategory = faqCategory;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.status = status;
	}

	
	
	
	public CenterFaq(int faqNo, int userNo, String faqCategory, String faqTitle, String faqContent) {
		super();
		this.faqNo = faqNo;
		this.userNo = userNo;
		this.faqCategory = faqCategory;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
	}
	

	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getFaqCategory() {
		return faqCategory;
	}

	public void setFaqCategory(String faqCategory) {
		this.faqCategory = faqCategory;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
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

	@Override
	public String toString() {
		return "CenterFaq [faqNo=" + faqNo + ", userNo=" + userNo + ", faqCategory=" + faqCategory + ", faqTitle="
				+ faqTitle + ", faqContent=" + faqContent + ", createDate=" + createDate + ", updateDate=" + updateDate
				+ ", status=" + status + "]";
	}
	
	

}
