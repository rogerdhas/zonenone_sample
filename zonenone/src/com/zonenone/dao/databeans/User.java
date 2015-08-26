package com.zonenone.dao.databeans;

public class User implements java.io.Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int userId;
	
	private String mailId;
	
	private String userNme;
	
	private String password;

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getMailId() {
		return mailId;
	}

	public void setMailId(String mailId) {
		this.mailId = mailId;
	}

	public String getUserNme() {
		return userNme;
	}

	public void setUserNme(String userNme) {
		this.userNme = userNme;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
