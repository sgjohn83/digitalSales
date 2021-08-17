package com.digitalsales.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="suppliers")
public class Suppliers {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	@Column(name="sname")
	private String sname;
	@Column(name="contactno")
	private String contactno;
	@Column(name="address")
	private String address;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getContactno() {
		return contactno;
	}
	public void setContactno(String contactno) {
		this.contactno = contactno;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Suppliers(int id, String sname, String contactno, String address) {
		super();
		this.id = id;
		this.sname = sname;
		this.contactno = contactno;
		this.address = address;
	}
	
	public Suppliers() {
		
	}
	@Override
	public String toString() {
		return "Suppliers [id=" + id + ", sname=" + sname + ", contactno=" + contactno + ", address=" + address + "]";
	}
	
	
	
}
