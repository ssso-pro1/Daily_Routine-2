package com.dr.admin.user.model.vo;

import java.sql.Date;

public class User {

	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String birth;
	private String gender;
	private String email;
	private String phone;
	private Date enrollDate;
	private String leaveCheck;
	private String suspended;
	private String reportCheck;
	private String adminCheck;
	
	public User() {}

	public User(int userNo, String userId, String userPwd, String userName, String birth, String gender, String email,
			String phone, Date enrollDate, String leaveCheck, String suspended, String reportCheck, String adminCheck) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.birth = birth;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.enrollDate = enrollDate;
		this.leaveCheck = leaveCheck;
		this.suspended = suspended;
		this.reportCheck = reportCheck;
		this.adminCheck = adminCheck;
	}

	
	//회원가입
	
	
	public int getUserNo() {
		return userNo;
	}

	public User(String userId, String userPwd, String userName, String birth, String gender, String email,
			String phone) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.birth = birth;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getLeaveCheck() {
		return leaveCheck;
	}

	public void setLeaveCheck(String leaveCheck) {
		this.leaveCheck = leaveCheck;
	}

	public String getSuspended() {
		return suspended;
	}

	public void setSuspended(String suspended) {
		this.suspended = suspended;
	}

	public String getReportCheck() {
		return reportCheck;
	}

	public void setReportCheck(String reportCheck) {
		this.reportCheck = reportCheck;
	}

	public String getAdminCheck() {
		return adminCheck;
	}

	public void setAdminCheck(String adminCheck) {
		this.adminCheck = adminCheck;
	}

	@Override
	public String toString() {
		return "User [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", birth=" + birth + ", gender=" + gender + ", email=" + email + ", phone=" + phone + ", enrollDate="
				+ enrollDate + ", leaveCheck=" + leaveCheck + ", suspended=" + suspended + ", reportCheck="
				+ reportCheck + ", adminCheck=" + adminCheck + "]";
	}
	
	
	
}
