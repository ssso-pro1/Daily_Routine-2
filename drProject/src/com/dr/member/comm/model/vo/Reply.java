package com.dr.member.comm.model.vo;

import java.sql.Date;

public class Reply {
	
	private int replyNo;     		// 댓글 번호 
	private String userNo; 	 		// 작성자 회원번호 
	private int commPostNo; 		// 게시글번호 
	private String replyContent;	// 댓글 내용 
	private int replyCategory; 		// 게시판 종류(1:tip/2:free/3:Q)
	private Date enrollDate;   		// 댓글 등록일 
	private Date updateDate; 		// 댓글 수정일 
	private String status;			// 댓글삭제유무(Y/N)
	
	public Reply() {}

	public Reply(int replyNo, String userNo, int commPostNo, String replyContent, int replyCategory, Date enrollDate, Date updateDate,
			String status) {
		super();
		this.replyNo = replyNo;
		this.userNo = userNo;
		this.commPostNo = commPostNo;
		this.replyContent = replyContent;
		this.replyCategory = replyCategory;
		this.enrollDate = enrollDate;
		this.updateDate = updateDate;
		this.status = status;
	}

	

	public Reply(int replyNo, String userNo, String replyContent, Date enrollDate) {
		super();
		this.replyNo = replyNo;
		this.userNo = userNo;
		this.replyContent = replyContent;
		this.enrollDate = enrollDate;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	public int getCommPostNo() {
		return commPostNo;
	}

	public void setCommPostNo(int commPostNo) {
		this.commPostNo = commPostNo;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public int getReplyCategory() {
		return replyCategory;
	}

	public void setReplyCategory(int replyCategory) {
		this.replyCategory = replyCategory;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", userNo=" + userNo + ", commPostNo=" + commPostNo + ", replyContent="
				+ replyContent + ", replyCategory=" + replyCategory + ", enrollDate=" + enrollDate + ", updateDate="
				+ updateDate + ", status=" + status + "]";
	}

}
