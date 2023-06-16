package com.banking.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.banking.DAO.UserDAL;
import com.banking.model.BankUserCredentials;

public class MyUserDetailsService implements UserDetailsService {
	
	@Autowired
	UserDAL userDal;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		BankUserCredentials user = userDal.loadUserByUserName(username);
		
		if(user==null)
			throw new UsernameNotFoundException("User 404");
		
		return (new MyUserDetails(user));
	}

}
