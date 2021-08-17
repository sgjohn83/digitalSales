package com.digitalsales.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="variants")
public class Variants {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="varid")
	private int varid;
	@ManyToOne
	@JoinColumn(name="modelid")
	private PhoneModels phonemodels;
	@Column(name="ram")
	private String ram;
	@Column(name="storage")
	private String storage;
	
	public int getVarid() {
		return varid;
	}
	public void setVarid(int varid) {
		this.varid = varid;
	}
	
	
		
	public PhoneModels getPhonemodels() {
		return phonemodels;
	}
	public void setPhonemodels(PhoneModels phonemodels) {
		this.phonemodels = phonemodels;
	}
	public String getRam() {
		return ram;
	}
	public void setRam(String ram) {
		this.ram = ram;
	}
	public String getStorage() {
		return storage;
	}
	public void setStorage(String storage) {
		this.storage = storage;
	}
	

	
	public Variants(int varid, PhoneModels phonemodels, String ram, String storage) {
		super();
		this.varid = varid;
		this.phonemodels = phonemodels;
		this.ram = ram;
		this.storage = storage;
	}
	public Variants() {
		
	}
	@Override
	public String toString() {
		return "Variants [varid=" + varid + ", phonemodels=" + phonemodels + ", ram=" + ram + ", storage=" + storage
				+ "]";
	}
	

	
	
	
}
