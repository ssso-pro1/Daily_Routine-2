package com.dr.member.myDR.model.vo;

public class Bookmark {
	private int bkNo;
	private int userNo;
	private int bkPostType;
	private int bkPostNo;
	
	private String titleImg;
	
	Bookmark(){}

	public Bookmark(int bkNo, int userNo, int bkPostType, int bkPostNo) {
		super();
		this.bkNo = bkNo;
		this.userNo = userNo;
		this.bkPostType = bkPostType;
		this.bkPostNo = bkPostNo;
	}

	public Bookmark(int bkNo, int userNo, int bkPostType, int bkPostNo, String titleImg) {
		super();
		this.bkNo = bkNo;
		this.userNo = userNo;
		this.bkPostType = bkPostType;
		this.bkPostNo = bkPostNo;
		this.titleImg = titleImg;
	}

	public int getBkNo() {
		return bkNo;
	}

	public void setBkNo(int bkNo) {
		this.bkNo = bkNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getBkPostType() {
		return bkPostType;
	}

	public void setBkPostType(int bkPostType) {
		this.bkPostType = bkPostType;
	}

	public int getBkPostNo() {
		return bkPostNo;
	}

	public void setBkPostNo(int bkPostNo) {
		this.bkPostNo = bkPostNo;
	}

	public String getTitleImg() {
		return titleImg;
	}

	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}

	@Override
	public String toString() {
		return "Bookmark [bkNo=" + bkNo + ", userNo=" + userNo + ", bkPostType=" + bkPostType + ", bkPostNo=" + bkPostNo
				+ "]";
	}
	
}
