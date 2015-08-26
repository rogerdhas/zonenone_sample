package com.zonenone.dto;

import com.zonenone.dao.databeans.Plan;
import com.zonenone.dao.databeans.User;
import com.zonenone.form.PlanFormBean;

public class PlanDTO {

	public Plan fromPlanFormBeanToPlanDBBean(PlanFormBean planFormBean) {
		Plan plan = new Plan();
		plan.setPlanNme(planFormBean.getPlanNme());
		plan.setVoice(Integer.parseInt(planFormBean.getVoice()));
		plan.setText(Integer.parseInt(planFormBean.getText()));
		plan.setData(planFormBean.getData());
		plan.setAmount(Integer.parseInt(planFormBean.getAmt()));
		
		User user = new User();
		user.setUserId(Integer.parseInt(planFormBean.getUserId()));
		plan.setUser(user);
		
		return plan;
	}

	public void fromPlanDBBeanToPlanFormBean(Plan plan,
			PlanFormBean planFormBean) {
		planFormBean.setId(String.valueOf(plan.getPlanId()));
		planFormBean.setPlanNme(plan.getPlanNme());
		planFormBean.setVoice(String.valueOf(plan.getVoice()));
		planFormBean.setText(String.valueOf(plan.getText()));
		planFormBean.setData(plan.getData());
		planFormBean.setAmt(String.valueOf(plan.getAmount()));
		
		planFormBean.setUserId(String.valueOf(plan.getUser().getUserId()));
	}

}
