package com.dr.member.ht.model.vo;

import java.sql.Date;

/**
 * @author wjdgn
 *
 */
public class Ht {
	private int htPostNo;			// 게시글 번호
	private int userNo;				// 회원번호
	private String htPostContent;	// 게시글 내용
	private String htPostTitle;		// 게시글 제목
	private String htCategory;		// 카테고리명
	private Date htEnrollDate;		// 게시글 등록일
	private Date htUpdateDate;		// 게시글 수정일
	private int htViewCount;		// 게시글 조회수
	private int htLikeCount;		// 게시글 좋아요 수
	private String status;			// 게시글 삭제 유무
	private String videoLink;		// 유튜브 영상 링크
	
	private String titleImg;
	
	public Ht() {}
	

	public Ht(int htPostNo, int userNo, String htPostContent, String htPostTitle, String htCategory, Date htEnrollDate,
			Date htUpdateDate, int htViewCount, int htLikeCount, String status, String videoLink, String titleImg) {
		super();
		this.htPostNo = htPostNo;
		this.userNo = userNo;
		this.htPostContent = htPostContent;
		this.htPostTitle = htPostTitle;
		this.htCategory = htCategory;
		this.htEnrollDate = htEnrollDate;
		this.htUpdateDate = htUpdateDate;
		this.htViewCount = htViewCount;
		this.htLikeCount = htLikeCount;
		this.status = status;
		this.videoLink = videoLink;
		this.titleImg = titleImg;
	}


	public Ht(int htPostNo, String htPostTitle, Date htEnrollDate, Date htUpdateDate,
			int htViewCount, int htLikeCount, String status) {
		super();
		this.htPostNo = htPostNo;
		this.htPostTitle = htPostTitle;
		this.htEnrollDate = htEnrollDate;
		this.htUpdateDate = htUpdateDate;
		this.htViewCount = htViewCount;
		this.htLikeCount = htLikeCount;
		this.status = status;

	}

	public Ht(int htPostNo, int userNo, String htPostContent, String htPostTitle, String htCategory, Date htEnrollDate,
			Date htUpdateDate, String videoLink) {
		super();
		this.htPostNo = htPostNo;
		this.userNo = userNo;
		this.htPostContent = htPostContent;
		this.htPostTitle = htPostTitle;
		this.htCategory = htCategory;
		this.htEnrollDate = htEnrollDate;
		this.htUpdateDate = htUpdateDate;
		this.videoLink = videoLink;
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


	public String getHtCategory() {
		return htCategory;
	}

	public void setHtCategory(String htCategory) {
		this.htCategory = htCategory;
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

	public int getHtViewCount() {
		return htViewCount;
	}

	public void setHtViewCount(int htViewCount) {
		this.htViewCount = htViewCount;
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

	public String getTitleImg() {
		return titleImg;
	}

	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}

	@Override
	public String toString() {
		return "Ht [htPostNo=" + htPostNo + ", userNo=" + userNo + ", htPostContent=" + htPostContent + ", htPostTitle="
				+ htPostTitle +  ", htCategory=" + htCategory + ", htEnrollDate="
				+ htEnrollDate + ", htUpdateDate=" + htUpdateDate + ", htViewCount=" + htViewCount + ", htLikeCount="
				+ htLikeCount + ", status=" + status + ", videoLink=" + videoLink + ", titleImg=" + titleImg + "]";
	}


}
