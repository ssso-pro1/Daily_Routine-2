package com.dr.member.comm.model.vo;

import java.sql.Date;

public class Reply {
	
	private int replyNo;     		// 댓글 번호 
	private String userNo; 	 		// 작성자 회원번호 
	private int replyCount;  		// 댓글 수 
	private String replyContent;	// 댓글 내용 
	private Date enrollDate;   		// 댓글 등록일 
	private Date updateDate; 		// 댓글 수정일 
	private String status;			// 댓글삭제유무(Y/N)
	
	public Reply() {}

	public Reply(int replyNo, String userNo, int replyCount, String replyContent, Date enrollDate, Date updateDate,
			String status) {
		super();
		this.replyNo = replyNo;
		this.userNo = userNo;
		this.replyCount = replyCount;
		this.replyContent = replyContent;
		this.enrollDate = enrollDate;
		this.updateDate = updateDate;
		this.status = status;
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

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
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
		return "Reply [replyNo=" + replyNo + ", userNo=" + userNo + ", replyCount=" + replyCount + ", replyContent="
				+ replyContent + ", enrollDate=" + enrollDate + ", updateDate=" + updateDate + ", status=" + status
				+ "]";
	}
	
}
