package com.zonenone.dao;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.zonenone.dao.databeans.User;

public class UserDAOImpl {

	@Autowired
	public SessionFactory sessionFactory;

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    @Transactional
    public User getUser(String userNme, String password){
    	User user = null;
    	String loginQry = "from User user where user.userNme='"+userNme+"' and user.password='" + password + "'";
    	Query query = sessionFactory.getCurrentSession().createQuery(loginQry);
    	user = (User) query.uniqueResult();
    	return user;
    }

}
