package com.zonenone.dao.databeans;

public class PredictedPlan implements java.io.Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;
	
	private Integer count;
	
	private String gender;
	
	private User user;
	
	private Plan plan;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Plan getPlan() {
		return plan;
	}

	public void setPlan(Plan plan) {
		this.plan = plan;
	}

}
