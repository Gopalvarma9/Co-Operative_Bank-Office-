package com.banking.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.banking.validation.MailSender;

@Controller
public class LoginController 
{
	@RequestMapping(value = "/")
	public String login() {
		return "home";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login2() {
		return "Login";
	}

	String otp;
	@Autowired
	MailSender obj;

	@RequestMapping(value = "/EnterOtp", method = RequestMethod.POST)
	public String enterOtp(@RequestParam("email") String to) {

		otp = obj.send(to);

		return "EnterOtp";
	}

	@RequestMapping(value = "/SendOtp")
	public String sendOtp() {
		System.out.println("OTP SEND");
		return "SendOtp";
	}

	@RequestMapping(value = "/ConfirmPass", method = RequestMethod.POST)
	public String home(@RequestParam("otpHidden") String otp1) {
		System.out.println("Entered OTP" + otp1 + "Sent otp " + otp);
		if (otp1.equals(otp))
			return "confirmPass";
		else
			return "EnterOtp";
	}

	@RequestMapping(value = "/home", method = RequestMethod.POST)
	public String home() {
		System.out.println("home page requested");
		return "home";
	}
}
