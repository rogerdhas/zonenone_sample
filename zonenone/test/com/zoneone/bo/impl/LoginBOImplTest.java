package com.zoneone.bo.impl;

import org.junit.Assert;
import org.junit.Test;

import com.zonenone.form.BaseFormBean;
import com.zonenone.form.LoginFormBean;

public class LoginBOImplTest {

	@Test
	public void testValidate() throws Exception {
		LoginFormBean loginFormBean = new LoginFormBean();
		loginFormBean.setUserName(null);
		loginFormBean.setPassword("admin");
		BaseFormBean baseFormBean = loginFormBean;
		LoginBOImpl boImpl = new LoginBOImpl();
		boolean result = true;
		try{
			boImpl.validate(baseFormBean);
			result = false;
		} catch(Exception ex){
			result = true;
		}
		Assert.assertTrue(result);
	}

}
