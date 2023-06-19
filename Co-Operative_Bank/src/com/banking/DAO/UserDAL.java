package com.banking.DAO;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;

import com.banking.model.BankUserCredentials;

@Component
public class UserDAL 
{
	@PersistenceContext
	EntityManager em;

	public BankUserCredentials loadUserByUserName(String username)
	{
		BankUserCredentials user;
		
		user = (BankUserCredentials) em.createNativeQuery("select * from BankUserCredentials where username = :uname", BankUserCredentials.class)
			    .setParameter("uname", username)
			    .getSingleResult();

		
		return user;
		
	}
	


}
