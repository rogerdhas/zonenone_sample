package com.zonenone.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.zonenone.dao.databeans.Plan;

@Repository
public class PlanDAOImpl {

	@Autowired
	public SessionFactory sessionFactory;

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

	@Transactional
	public List<Plan> getPlanLists(){
		String qry = "from Plan plan";
		Query query = sessionFactory.getCurrentSession().createQuery(qry);
		@SuppressWarnings("unchecked")
		List<Plan> plans = query.list();
		return plans;
	}

	@Transactional
	public List<Plan> getPlanListsForUser(int userId){
		String qry = "from Plan plan where plan.user.userId="+userId;
		Query query = sessionFactory.getCurrentSession().createQuery(qry);
		@SuppressWarnings("unchecked")
		List<Plan> plans = query.list();
		return plans;
	}
	
	@Transactional
	public void save(Plan plan){
		sessionFactory.getCurrentSession().save(plan);
	}
	
}
