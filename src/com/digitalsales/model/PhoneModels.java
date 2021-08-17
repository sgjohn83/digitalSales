package com.digitalsales.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="phonemodels")
public class PhoneModels {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="modelid")
	private int modelid;
	
	@ManyToOne
	@JoinColumn(name="brandid")
	private Brands brand;
	
	@Column(name="modelname")
	private String modelname;

	public int getModelid() {
		return modelid;
	}

	public void setModelid(int modelid) {
		this.modelid = modelid;
	}

	
	
	
	public Brands getBrand() {
		return brand;
	}

	public void setBrand(Brands brand) {
		this.brand = brand;
	}

	public String getModelname() {
		return modelname;
	}

	public void setModelname(String modelname) {
		this.modelname = modelname;
	}


	public PhoneModels(int modelid, Brands brand, String modelname) {
		super();
		this.modelid = modelid;
		this.brand = brand;
		this.modelname = modelname;
	}

	public PhoneModels() {
	
	}

	@Override
	public String toString() {
		return "PhoneModels [modelid=" + modelid + ", brand=" + brand + ", modelname=" + modelname + "]";
	}

	
	
}
