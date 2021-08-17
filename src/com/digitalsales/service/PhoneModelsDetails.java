package com.digitalsales.service;

import javax.persistence.Entity;


public class PhoneModelsDetails {
	
	private int varid;
	private int modelid;
	private int brandid;
	private String modelname;
	private String brandname;
	private String ram;
	private String storage;
	public int getVarid() {
		return varid;
	}
	public void setVarid(int varid) {
		this.varid = varid;
	}
	public int getModelid() {
		return modelid;
	}
	public void setModelid(int modelid) {
		this.modelid = modelid;
	}
	public int getBrandid() {
		return brandid;
	}
	public void setBrandid(int brandid) {
		this.brandid = brandid;
	}
	public String getModelname() {
		return modelname;
	}
	public void setModelname(String modelname) {
		this.modelname = modelname;
	}
	public String getBrandname() {
		return brandname;
	}
	public void setBrandname(String brandname) {
		this.brandname = brandname;
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
	@Override
	public String toString() {
		return "PhoneModelsDetails [varid=" + varid + ", modelid=" + modelid + ", brandid=" + brandid + ", modelname="
				+ modelname + ", brandname=" + brandname + ", ram=" + ram + ", storage=" + storage + "]";
	}
	public PhoneModelsDetails(int varid, int modelid, int brandid, String modelname, String brandname, String ram,
			String storage) {
		super();
		this.varid = varid;
		this.modelid = modelid;
		this.brandid = brandid;
		this.modelname = modelname;
		this.brandname = brandname;
		this.ram = ram;
		this.storage = storage;
	}
	
	public PhoneModelsDetails() {
	
	}

}
