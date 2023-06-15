package com.banking.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.banking.model.BankUser;
import com.banking.service.BankUserService;

@Controller
public class UserController {
	
		@RequestMapping(value="/addUser", method=RequestMethod.POST)
		public String addUser()
		{
			return "addUser";
		}
	
		private final BankUserService bankUserService;
	    
	    @Autowired
	    public UserController(BankUserService bankUserService) {
	        this.bankUserService = bankUserService;
	    }
	    
	    @RequestMapping(value="/submit_form", method=RequestMethod.POST)
	    public ResponseEntity<String> submitForm (BankUser bankUser,Model model) {
	         bankUserService.saveBankUser(bankUser);
	         return ResponseEntity.ok("Data saved successfully!");
	    }
	    
	    @RequestMapping(value = "/mainUser", method=RequestMethod.GET)
	    public String getBankUsers(Model model) {
	        List<BankUser> bankUsers = bankUserService.getAllBankUsers();
	        model.addAttribute("bankUsers", bankUsers);
	        return "mainUser";
	    }
	    
	    @RequestMapping("/saveUserData")
	    @ResponseBody
	    public String saveUserData(@ModelAttribute("BankUser") BankUser bankUser) {
	    	System.out.println(bankUser);
	        bankUserService.saveUser(bankUser);
	        return "User data saved successfully";
	    }
	    
	    @RequestMapping(value = "/fetchData", method = RequestMethod.POST)
	    public String fetchData(@ModelAttribute("BankUser") BankUser bankUser, Model model) {
	    	List<BankUser> bankUsers;
	    	if(bankUser.getBusr_desg().equals("All"))
	    	{
	    		bankUsers = bankUserService.getAllBankUsers();
	    	}
	    	else
	    	{
	    		  bankUsers = bankUserService.getBankUsersByDesignation(bankUser);
	    	}
	        model.addAttribute("bankUsers", bankUsers);
	        return "bankUsers"; // Return the name of the HTML page as the view
	    }

}
