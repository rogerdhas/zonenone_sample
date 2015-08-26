package com.zonenone.form;

import java.util.ArrayList;
import java.util.List;

public class PlanFormBean implements BaseFormBean {
	
	private String id;
	
	private String planNme;
	
	private String voice;
	
	private String text;
	
	private String data;
	
	private String amt;
	
	private String userId;
	
	private List<PlanFormBean> planFormBeans = new ArrayList<PlanFormBean>();

	public List<PlanFormBean> getPlanFormBeans() {
		return planFormBeans;
	}

	public void setPlanFormBeans(List<PlanFormBean> planFormBeans) {
		this.planFormBeans = planFormBeans;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPlanNme() {
		return planNme;
	}

	public void setPlanNme(String planNme) {
		this.planNme = planNme;
	}

	public String getVoice() {
		return voice;
	}

	public void setVoice(String voice) {
		this.voice = voice;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public String getAmt() {
		return amt;
	}

	public void setAmt(String amt) {
		this.amt = amt;
	}

	public PlanFormBean() {
		super();
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public PlanFormBean(String id, String planNme, String voice, String text,
			String data, String amt) {
		super();
		this.id = id;
		this.planNme = planNme;
		this.voice = voice;
		this.text = text;
		this.data = data;
		this.amt = amt;
	}

	@Override
	public String toString() {
		return "PlanFormBean [id=" + id + ", planNme=" + planNme + ", voice="
				+ voice + ", text=" + text + ", data=" + data + ", amt=" + amt
				+ "]";
	}

}
