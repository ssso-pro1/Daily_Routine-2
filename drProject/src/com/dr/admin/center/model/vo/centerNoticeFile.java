package com.dr.admin.center.model.vo;

import java.sql.Date;

public class centerNoticeFile {
	
	private int fileNo;			// 첨부파일고유번호
	private int refNoticeNo;		// 참조하고 있는 게시글 번호
	private String fileName;	// 첨부파일의 원본명
	private String fileUpdate;	// 첨부파일의 수정명
	private String filePath;	// 첨부파일이 저장된 폴더 경로
	private Date uploadDate;	// 첨부파일 업로드일
	private String status;		// 상태값 (Y/N)
	
	public centerNoticeFile() {}

	public centerNoticeFile(int fileNo, int refNoticeNo, String fileName, String fileUpdate, String filePath,
			Date uploadDate, String status) {
		super();
		this.fileNo = fileNo;
		this.refNoticeNo = refNoticeNo;
		this.fileName = fileName;
		this.fileUpdate = fileUpdate;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.status = status;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getRefNoticeNo() {
		return refNoticeNo;
	}

	public void setRefNoticeNo(int refNoticeNo) {
		this.refNoticeNo = refNoticeNo;
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

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "centerNoticeFile [fileNo=" + fileNo + ", refNoticeNo=" + refNoticeNo + ", fileName=" + fileName
				+ ", fileUpdate=" + fileUpdate + ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", status="
				+ status + "]";
	}


	



}	