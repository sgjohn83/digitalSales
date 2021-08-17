package com.digitalsales.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.digitalsales.model.Brands;
import com.digitalsales.model.SessionUtil;

public class BrandService {
	
	public void addBrand(Brands brand)
	{
		Session session = SessionUtil.getSession();
		session.beginTransaction();
		session.save(brand);
		session.getTransaction().commit();
		session.close();
	}

	public List<Brands> getBrands() {
		Session session = SessionUtil.getSession();
		Query q= session.createQuery("from Brands");
		List<Brands> list= q.list();
		session.close();
		return list;
	}

	public void updateBrand(Brands brand) {
		
		Session session = SessionUtil.getSession();
		session.beginTransaction();
		session.update(brand);
		session.getTransaction().commit();
		session.close();
	}

	public void deleteBrand(Brands brand) {
		Session session = SessionUtil.getSession();
		session.beginTransaction();
		session.delete(brand);
		session.getTransaction().commit();
		session.close();
		
	}

}
