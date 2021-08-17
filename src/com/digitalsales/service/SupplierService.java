package com.digitalsales.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.digitalsales.model.SessionUtil;
import com.digitalsales.model.Suppliers;

public class SupplierService {
	
	public void addSupplier(Suppliers suppliers)
	{
        Session session = SessionUtil.getSession();
		
		session.beginTransaction();
		session.save(suppliers);
		session.getTransaction().commit();
		session.close();
		
	}
	
	public List<Suppliers> getSuppliers() {
		Session session = SessionUtil.getSession();
		Query q = session.createQuery("from Suppliers");
		List<Suppliers> list = q.list();
		session.close();
		return list;
	}

	public void updateSupplier(Suppliers suppliers) {
		Session session = SessionUtil.getSession();
		session.beginTransaction();
		session.update(suppliers);
		session.getTransaction().commit();
		session.close();
		
	}

	public void deleteBrand(Suppliers sup) {
		Session session = SessionUtil.getSession();
		session.beginTransaction();
		session.delete(sup);
		session.getTransaction().commit();
		session.close();
		
	}
	

}
