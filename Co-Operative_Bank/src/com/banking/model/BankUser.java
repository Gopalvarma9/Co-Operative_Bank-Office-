package com.banking.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="BankUser")
public class BankUser {
	
    @Id
    private long busr_id;
    private String busr_title;
    private String busr_desg;
    
	public long getBusr_id() {
		return busr_id;
	}
	public void setBusr_id(long busr_id) {
		this.busr_id = busr_id;
	}
	public String getBusr_title() {
		return busr_title;
	}
	public void setBusr_title(String busr_title) {
		this.busr_title = busr_title;
	}
	public String getBusr_desg() {
		return busr_desg;
	}
	public void setBusr_desg(String busr_desg) {
		this.busr_desg = busr_desg;
	}
	@Override
	public String toString() {
		return "BankUser [busr_id=" + busr_id + ", busr_title=" + busr_title + ", busr_desg=" + busr_desg + "]";
	}

	
    
}
