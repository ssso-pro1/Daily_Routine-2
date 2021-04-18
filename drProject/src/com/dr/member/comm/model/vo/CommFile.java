package com.dr.member.comm.model.vo;

import java.sql.Date;

public class CommFile {

	private int fileNo;			// 첨부파일 번호 
	private int commPostNo; 	// 참조하고 있는 게시글 번호 
	private int commNo; 		// 참조하고 있는 게시판 번호(1:나만의운동Tip/2:자유/3:질문)
	private String fileName; 	// 첨부파일 원본명 
	private String fileUpdate;	// 첨부파일 수정명 
	private String filePath;	// 첨부파일이 저장된 폴더 경로 
	private Date uploadDate;  	// 첨부파일 업로드일 
	
	public CommFile() {}

	public CommFile(int fileNo, int commPostNo, int commNo, String fileName, String fileUpdate, String filePath,
			Date uploadDate) {
		super();
		this.fileNo = fileNo;
		this.commPostNo = commPostNo;
		this.commNo = commNo;
		this.fileName = fileName;
		this.fileUpdate = fileUpdate;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getCommPostNo() {
		return commPostNo;
	}

	public void setCommPostNo(int commPostNo) {
		this.commPostNo = commPostNo;
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

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	@Override
	public String toString() {
		return "CommFile [fileNo=" + fileNo + ", commPostNo=" + commPostNo + ", commNo=" + commNo + ", fileName="
				+ fileName + ", fileUpdate=" + fileUpdate + ", filePath=" + filePath + ", uploadDate=" + uploadDate
				+ "]";
	}
	
}