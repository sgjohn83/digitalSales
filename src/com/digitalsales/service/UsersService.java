package com.digitalsales.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.transform.Transformers;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.digitalsales.model.Authorities;
import com.digitalsales.model.AuthoritiesId;
import com.digitalsales.model.SessionUtil;
import com.digitalsales.model.Users;

public class UsersService {

	public int saveUser(Users users) {

		AuthoritiesId aId = new AuthoritiesId();
		aId.setAuthority("ROLE_USER");
		aId.setUsername(users.getUsername());
		Authorities a = new Authorities();
		a.setAuthoritiesId(aId);
		Session session = SessionUtil.getSession();
		System.out.println(users);
		session.beginTransaction();
		session.save(users);
		session.save(a);
		session.getTransaction().commit();
		session.close();

		return 1;

	}

	public List<Users> getUsers() {
		Session session = SessionUtil.getSession();

		Query q = session.createSQLQuery("select * from users where username!='admin'").addEntity(Users.class);
		List<Users> l = q.list();
		session.close();
		return l;

	}

	public int deleteUsers(List<String> s) {
		Session session = SessionUtil.getSession();

		for (String name : s) {
			Query q = session.createQuery("delete from Authorities where username= :uid");
			q.setParameter("uid", name);
			q.executeUpdate();
			q = session.createQuery("delete from Users where username= :uid");
			q.setParameter("uid", name);
			q.executeUpdate();

		}

		session.close();
		return 0;

	}

	public void enableUsers(List<String> s) {
		Session session = SessionUtil.getSession();

		for (String name : s) {
			Query q = session.createQuery("update Users set enabled=1 where username= :uid");
			q.setParameter("uid", name);
			q.executeUpdate();

		}

		session.close();
		

	}

	public void disableUsers(List<String> s) {

		Session session = SessionUtil.getSession();

		for (String name : s) {
			Query q = session.createQuery("update Users set enabled=0 where username= :uid");
			q.setParameter("uid", name);
			q.executeUpdate();

		}

		session.close();
		
	}

	public boolean comparePassword(String oldpwd,String username) {
		
		Session session = SessionUtil.getSession();

		Query q = session.createQuery("from Users where username=:uid");
		q.setParameter("uid",username );
		List<Users> l = q.list();
		session.close();
		PasswordEncoder p = new BCryptPasswordEncoder();
		
		if(p.matches(oldpwd, l.get(0).getPassword()))
			return true;
		else
			return false;

		
	}

	public void changePassword(String newpwd, String currentPrincipalName) {
		
		PasswordEncoder p=new BCryptPasswordEncoder();
		Session session = SessionUtil.getSession();
		Transaction tx = session.beginTransaction();
		Users u = (Users)session.get(Users.class, currentPrincipalName);
		u.setPassword(p.encode(newpwd));
		session.update(u);
		tx.commit();
		

	
		
		session.close();
	}

	public void resetPassword(String user) {
		
		PasswordEncoder p=new BCryptPasswordEncoder();
		Session session = SessionUtil.getSession();
		Transaction tx = session.beginTransaction();
		Users u = (Users)session.get(Users.class, user);
		u.setPassword(p.encode("demopass"));
		session.update(u);
		tx.commit();
	}

}
