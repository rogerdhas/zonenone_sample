package com.zoneone.bo.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.zonenone.bo.BaseBO;
import com.zonenone.dao.UserDAOImpl;
import com.zonenone.dao.databeans.User;
import com.zonenone.form.BaseFormBean;
import com.zonenone.form.LoginFormBean;

public class LoginBOImpl implements BaseBO {

	@Autowired
	private UserDAOImpl userDAOImpl;

	@Override
	public void load(BaseFormBean baseFormBean) {
		// TODO Auto-generated method stub

	}

	@Override
	public void save(BaseFormBean baseFormBean) throws Exception {

		LoginFormBean loginFormBean = (LoginFormBean) baseFormBean;

		try {
			User user = userDAOImpl.getUser(loginFormBean.getUserName(),
					loginFormBean.getPassword());
			if (user != null) {
				loginFormBean.setUserId(String.valueOf(user.getUserId()));
				loginFormBean.setMailId(user.getMailId());
			} else {
				throw new Exception("Invalid Credentials!");
			}
		} catch (Exception ex) {
			throw new Exception("Invalid Credentials!");
		}
	}

	@Override
	public void delete(BaseFormBean baseFormBean) {
		// TODO Auto-generated method stub

	}

	@Override
	public void validate(BaseFormBean baseFormBean) throws Exception {
		LoginFormBean loginFormBean = (LoginFormBean) baseFormBean;
		if (loginFormBean.getUserName() == null
				|| loginFormBean.getUserName().isEmpty()) {
			throw new Exception("Username is required!");
		}
		if (loginFormBean.getPassword() == null
				|| loginFormBean.getPassword().isEmpty()) {
			throw new Exception("Password is required!");
		}
	}

	public UserDAOImpl getUserDAOImpl() {
		return userDAOImpl;
	}

	public void setUserDAOImpl(UserDAOImpl userDAOImpl) {
		this.userDAOImpl = userDAOImpl;
	}

}
