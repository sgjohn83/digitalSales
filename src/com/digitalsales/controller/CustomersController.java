package com.digitalsales.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.digitalsales.model.Customers;
import com.digitalsales.service.CustomerService;

@Controller
public class CustomersController {
	@RequestMapping("/addcustomer")
	public String addcustomers()
	{
		
		return "addcustomer";
	}
	
    @ResponseBody
	@RequestMapping("/addingcustomers")
	public String addingcustomers(Customers customers)
	{
		CustomerService cs = new CustomerService();
		cs.saveCustomer(customers);
		
    	return "added customer record successfully";
	}
    
    @RequestMapping("/managecustomer")
	public ModelAndView managecustomers(Model model)
	{
    	CustomerService cs = new CustomerService();
    	ModelAndView mv= new ModelAndView("managecustomers");
    	List<Customers> list = cs.getCustomers();
    	mv.addObject("Customers", list);
		return mv;
	}
    @ResponseBody()
    @RequestMapping("/deletecustomer")
  	public String deletecustomers(@RequestParam(value="CustId") int id,Model model)
  	{
      	System.out.println(id);
    	Customers customer = new Customers();
      	customer.setCustomerId(id);
    	CustomerService cs = new CustomerService();
    	cs.deleteCustomer(customer);
  		return "Customer Record Removed Successfully";
  	}
    
    @ResponseBody()
    @RequestMapping("/updatecustomers")
  	public String updatecustomers(Customers customers,Model model)
  	{
    	System.out.println(customers);
    	CustomerService cs = new CustomerService();
      	
    	cs.updateCustomer(customers);
        
  		return "Customer Record updated Successfully";
  	}
     
    
  
    
    
}
