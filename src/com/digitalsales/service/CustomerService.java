package com.digitalsales.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.digitalsales.model.Customers;
import com.digitalsales.model.SessionUtil;
import com.digitalsales.model.Suppliers;
import com.digitalsales.model.Users;

public class CustomerService {
	
	
	public void saveCustomer(Customers customers)
	{
		Session session = SessionUtil.getSession();
		
		session.beginTransaction();
		session.save(customers);
		session.getTransaction().commit();
		session.close();
		
	}

	public List<Customers> getCustomers() {
		
		Session session = SessionUtil.getSession();
		Query q = session.createSQLQuery("select * from Customers").addEntity(Customers.class);;
		List<Customers> l = q.list();
		session.close();
		return l;
		
		
	}
	
	public void deleteCustomer(Customers customer)
	{
		Session session = SessionUtil.getSession();
		Query q = session.createQuery("delete from Customers where customerid= :cid");
		q.setParameter("cid", customer.getCustomerId());
		q.executeUpdate();
		session.close();

	}
	
	public void updateCustomer(Customers customers)
	{
		
		Session session = SessionUtil.getSession();
		session.beginTransaction();
		Transaction tx = session.getTransaction();
		session.update(customers);
		tx.commit();
		session.close();
	}




}
