package com.dr.member.info.model.vo;

import java.sql.Date;

public class InfoFile {
	private int fileNo; 		// 썸네일 번호 
	private int intPostNo; 		// 참조하고 있는 게시글 번호 
	private int commNo;			// 참조하고 있는 게시판 번호(1:운동/2:식단/3:전체)
	private String fileName;	// 썸네일 원본명 
	private String fileUpdate;  // 썸네일 수정명 
	private String filePath; 	// 썸네일이 저장된 폴더 경로 
	private int fileLevel;	    // 썸네일 레벨(1:타이틀이미지/2:세부이미지)
	private Date uploadDate; 	// 썸네일 업로드일
	private String status; 		// 삭제유무(Y/N) 

	public InfoFile() {}

	public InfoFile(int fileNo, int intPostNo, int commNo, String fileName, String fileUpdate, String filePath,
			int fileLevel, Date uploadDate, String status) {
		super();
		this.fileNo = fileNo;
		this.intPostNo = intPostNo;
		this.commNo = commNo;
		this.fileName = fileName;
		this.fileUpdate = fileUpdate;
		this.filePath = filePath;
		this.fileLevel = fileLevel;
		this.uploadDate = uploadDate;
		this.status = status;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getIntPostNo() {
		return intPostNo;
	}

	public void setIntPostNo(int intPostNo) {
		this.intPostNo = intPostNo;
	}

	public int getCommNo() {
		return commNo;
	}

	public void setCommNo(int commNo) {
		this.commNo = commNo;
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

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
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
		return "InfoFile [fileNo=" + fileNo + ", intPostNo=" + intPostNo + ", commNo=" + commNo + ", fileName="
				+ fileName + ", fileUpdate=" + fileUpdate + ", filePath=" + filePath + ", fileLevel=" + fileLevel
				+ ", uploadDate=" + uploadDate + ", status=" + status + "]";
	}

}
