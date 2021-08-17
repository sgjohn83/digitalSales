package com.digitalsales.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="brands")
public class Brands {
	
@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
@Column(name="brandid")
private int brandid;
@Column(name="brandname")
private String brandname;

public int getBrandid() {
	return brandid;
}
public void setBrandid(int brandid) {
	this.brandid = brandid;
}
public String getBrandname() {
	return brandname;
}
public void setBrandname(String brandname) {
	this.brandname = brandname;
}
public Brands(int brandid, String brandname) {
	super();
	this.brandid = brandid;
	this.brandname = brandname;
}
public Brands() {

}
@Override
public String toString() {
	return "Brands [brandid=" + brandid + ", brandname=" + brandname + "]";
}



}
