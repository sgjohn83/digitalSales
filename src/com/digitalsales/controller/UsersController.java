package com.digitalsales.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.digitalsales.model.Users;
import com.digitalsales.service.UsersService;

@Controller
public class UsersController {
	
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@RequestMapping("/adduser")
	public String addUsers()
	{
		return "adduser";
	}
	
	@RequestMapping("/resetpwd")
	public String resetpwd(Model model)
	{
		UsersService u = new UsersService();
		List<Users> list = u.getUsers();
		model.addAttribute("usersData",list);		
		return "resetpwd";
	}
	
	@RequestMapping("/resetpwd2")
	public String resetpwd2(HttpServletRequest request,Model model)
	{
		UsersService u = new UsersService();
		u.resetPassword(request.getParameter("userid"));
		model.addAttribute("message","Password Reset Completed");
		return "dashboard";
	}
	
	@RequestMapping("/removeuser")
	public ModelAndView  editUsers(Model model)
	{
		UsersService userService = new UsersService();
		List<Users> list =userService.getUsers();
		ModelAndView mv = new ModelAndView("removeuser");
	   
		mv.addObject("Users",list);
		return mv;
	}
	
	@RequestMapping("/userstatus")
	public ModelAndView  statusUsers(Model model)
	{
		UsersService userService = new UsersService();
		List<Users> list =userService.getUsers();
		ModelAndView mv = new ModelAndView("userstatus");
	   
		mv.addObject("Users",list);
		return mv;
	}
	
	@RequestMapping("/changepwd")
	public String  changepwd()
	{
		
		return "changepwd";
	}
	
	
	@RequestMapping("/changePassword")
	public String  changePassword(HttpServletRequest request,Model model)
	{
		String oldpwd = request.getParameter("oldpwd");
		String newpwd = request.getParameter("newpwd");
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String currentPrincipalName = authentication.getName();
		UsersService us = new UsersService();
		boolean res=us.comparePassword(oldpwd,currentPrincipalName);
		if(res)
		{
			us.changePassword(newpwd,currentPrincipalName);
			model.addAttribute("message","Changed Successfully");
			return "dashboard";
		}
		else
		{
			model.addAttribute("message","Wrong old Password");
			return "dashboard";
		}
		
	}
	
	
	@RequestMapping("/deleteuser")
	public String  deleteUsers(HttpServletRequest request, Model model)
	{
		List<String> userList = new ArrayList();
		for(String name: request.getParameterValues("username"))
		{
			userList.add(name);
		}
		UsersService userService = new UsersService();
		userService.deleteUsers(userList);
		model.addAttribute("message","User delted");
		return "dashboard";
	}
	
	
	
	@RequestMapping("/saveuser")
	public String saveUsers(HttpServletRequest request, Model m)
	{
		Users users = new Users();
		users.setUsername(request.getParameter("username"));
		users.setPassword(passwordEncoder.encode(request.getParameter("password")));
		users.setEnabled(1);
		UsersService userservice = new UsersService();
		userservice.saveUser(users);
		m.addAttribute("message","User Saved");
		return "dashboard";
	}
	
	

	@RequestMapping("/userenabled")
	public String enableUsers(HttpServletRequest request, Model model)
	{
		List<String> userList1 = new ArrayList();
		List<String> userList2 = new ArrayList();
		Enumeration pnames = request.getParameterNames();
		while(pnames.hasMoreElements())
		{
			String name = (String) pnames.nextElement();
			
			String val = request.getParameter(name);
			if(val.equals("enabled"))
				userList1.add(name);
			else
				userList2.add(name);
		}
		
	
		UsersService userService = new UsersService();
		userService.enableUsers(userList1);
		userService.disableUsers(userList2);
		model.addAttribute("message","User updated");
		return "dashboard";
	}
}
