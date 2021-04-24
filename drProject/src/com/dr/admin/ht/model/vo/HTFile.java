package com.dr.admin.ht.model.vo;

import java.sql.Date;

public class HTFile {
	
	private int fileNo;			//첨부파일번호
	private int htPostNo;		// 홈트레이닝 글번호
	private String originName;	//파일원본명
	private String changeName;	//파일수정명
	private String filePath;	//파일경로
	private Date uploadDate;	//파일업로드일
	private int fileLevel;
	
	public HTFile() {}

	public HTFile(int fileNo, int htPostNo, String originName, String changeName, String filePath, Date uploadDate,
			int fileLevel) {
		super();
		this.fileNo = fileNo;
		this.htPostNo = htPostNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.fileLevel = fileLevel;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getHtPostNo() {
		return htPostNo;
	}

	public void setHtPostNo(int htPostNo) {
		this.htPostNo = htPostNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
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

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	@Override
	public String toString() {
		return "HTFile [fileNo=" + fileNo + ", htPostNo=" + htPostNo + ", originName=" + originName + ", changeName="
				+ changeName + ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", fileLevel=" + fileLevel
				+ "]";
	}

	
	

	
	
}
