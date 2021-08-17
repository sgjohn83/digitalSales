package com.digitalsales.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Embeddable
public class AuthoritiesId implements Serializable{
	
	
	@Column(name="username")
	private String username;
	
	
	@Column(name="authority")
	private String authority;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public AuthoritiesId(String username, String authority) {
		super();
		this.username = username;
		this.authority = authority;
	}
	
	public AuthoritiesId() {
	
	}
	
}
