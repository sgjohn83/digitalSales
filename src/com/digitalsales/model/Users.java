package com.digitalsales.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="users")
public class Users {

@Id
@Column(name="username")
private String username;

@Column(name="enabled")
private int enabled;

@Column(name="password")
private String password;

public String getUsername() {
	return username;
}

public void setUsername(String username) {
	this.username = username;
}

public int getEnabled() {
	return enabled;
}

public void setEnabled(int enabled) {
	this.enabled = enabled;
}

public String getPassword() {
	return password;
}

public void setPassword(String password) {
	this.password = password;
}

public Users(String username, int enabled, String password) {
	super();
	this.username = username;
	this.enabled = enabled;
	this.password = password;
}


public Users() {
	
}

@Override
public String toString() {
	return "Users [username=" + username + ", enabled=" + enabled + ", password=" + password + "]";
}







}
