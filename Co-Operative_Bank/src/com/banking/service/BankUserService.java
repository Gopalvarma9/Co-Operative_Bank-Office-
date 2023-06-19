package com.banking.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.banking.model.BankUser;

@Service
public class BankUserService {
	
    @PersistenceContext
    private EntityManager entityManager;
    
	@Autowired
	private PasswordEncoder passwordEncoder;
    
    @Transactional
    public boolean saveBankUser(BankUser bankUser) {
    	
    	String encodedPassword = passwordEncoder.encode(bankUser.getBusr_pwd());

	    // Set the encoded password
	    bankUser.setBusr_pwd(encodedPassword);

	    // Save the user to the database
	    entityManager.persist(bankUser);
	    
	    return true;
    }

    public List<BankUser> getAllBankUsers() {
        return entityManager.createQuery("SELECT u FROM BankUser u ORDER BY u.busr_id ASC").getResultList();
    }
	
	@Transactional
    public BankUser saveUser(BankUser bankUser) {
        return entityManager.merge(bankUser);
    }
	
	@Transactional
	public List<BankUser> getBankUsersByDesignation(BankUser bankUser) {
        return entityManager
            .createQuery("SELECT bu FROM BankUser bu WHERE bu.busr_desg = :designation", BankUser.class)
            .setParameter("designation", bankUser.getBusr_desg())
            .getResultList();
    }
	


	
	

}

