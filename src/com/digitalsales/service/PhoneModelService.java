package com.digitalsales.service;




import java.util.ArrayList;
import java.util.List;



import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.transform.Transformers;

import com.digitalsales.model.PhoneModels;
import com.digitalsales.model.SessionUtil;
import com.digitalsales.model.Variants;

public class PhoneModelService {


	public void savemodel(PhoneModels model) {
		Session session = SessionUtil.getSession();
		session.beginTransaction();
		session.save(model);
		session.getTransaction().commit();
		session.close();
	}
	
	public void savemodel(Variants variant) {
		Session session = SessionUtil.getSession();
		session.beginTransaction();
		session.save(variant);
		session.getTransaction().commit();
		session.close();
	}
	public boolean variantExist(Variants variant)
	{
	
		Session session = SessionUtil.getSession();
		Query q =  session.createQuery("from Variants where modelid=:mid and ram=:ram and storage=:storage");

		q.setParameter("mid", variant.getPhonemodels());
		q.setParameter("ram", variant.getRam());
		q.setParameter("storage", variant.getStorage());
		System.out.println(variant);
		
		List<PhoneModels> list =q.list();
		session.close();
		if(list.isEmpty())
		{
			
			return true;
		}
		
		else
		{
			
			return false;
		}
	
		
	}

	public boolean modelExist(PhoneModels model) {
		Session session = SessionUtil.getSession();
		Query q =  session.createQuery("from PhoneModels where brandid=:bid and modelname=:mname");

		q.setParameter("bid", model.getBrand());
		q.setParameter("mname", model.getModelname());
		
		
		List<PhoneModels> list =q.list();
		session.close();
		if(list.isEmpty())
		{
			
			return true;
		}
		
		else
		{
			
			return false;
		}
		
	}

	public int getModelId(PhoneModels model) {
		Session session = SessionUtil.getSession();
		Query q = session.createQuery("select modelid from PhoneModels where brandid=:bid and modelname=:mname");
		q.setParameter("bid", model.getBrand());
		q.setParameter("mname", model.getModelname());
		int  id = (int)q.uniqueResult();
		session.close();
		return id;
	}

	public List<Object[]> getModels() {
		Session session = SessionUtil.getSession();
		
		Query q = session.createQuery("from Variants as v, PhoneModels as p,Brands as b where p.modelid = v.phonemodels and b.brandid=p.brand");
		
		List<Object[]> list = q.list();
		session.close();
	
		
		
		return list;
		
	
	}

	public void updateModels(PhoneModels models, Variants variant) {
		Session session = SessionUtil.getSession();
		session.beginTransaction();
		session.update(models);
		session.update(variant);
		session.getTransaction().commit();
		session.close();
		
	}

	public String getBrandName(int brandid) {
		Session session = SessionUtil.getSession();
		Query q = session.createQuery("select brandname from Brands where brandid=:id");
		q.setParameter("id", brandid);
		String res=(String) q.uniqueResult();
		session.close();
		return res;
	}

	public void deleteModel(int varid) {
		Variants variant = new Variants();
		variant.setVarid(varid);
		Session session = SessionUtil.getSession();
		session.beginTransaction();
		session.delete(variant);
		session.getTransaction().commit();
		session.close();
	}

}
