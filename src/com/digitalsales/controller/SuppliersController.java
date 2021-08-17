package com.digitalsales.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.digitalsales.model.Customers;
import com.digitalsales.model.Suppliers;
import com.digitalsales.service.BrandService;
import com.digitalsales.service.CustomerService;
import com.digitalsales.service.SupplierService;

@Controller
public class SuppliersController {

	
	@RequestMapping("/addsupplier")
	public String addsuppliers()
	{
		
		return "addsupplier";
	}
	
	    @ResponseBody
		@RequestMapping("/addingsuppliers")
		public String addingcustomers(Suppliers suppliers)
		{
			SupplierService s = new SupplierService();
			s.addSupplier(suppliers);
			
	    	return "added supplier record successfully";
		}
	    
	    @RequestMapping("/managesupplier")
		public ModelAndView managesuppliers(Model model)
		{
	    	SupplierService s = new SupplierService();
	    	ModelAndView mv= new ModelAndView("managesuppliers");
	    	List<Suppliers> list = s.getSuppliers();
	    	mv.addObject("Suppliers", list);
			return mv;
		}
	  
	    @ResponseBody()
	    @RequestMapping("/deletesupplier")
	  	public String deletesuppliers(@RequestParam(value="SupId") int id,Model model)
	  	{
	      	System.out.println(id);
	      	SupplierService s = new SupplierService();
	      	Suppliers sup = new Suppliers();
	      	sup.setId(id);
	    	s.deleteBrand(sup);
	  		return "Supplier Record Removed Successfully";
	  	}
	    
	    @ResponseBody()
	    @RequestMapping("/updatesuppliers")
	  	public String updatecustomers(Suppliers suppliers,Model model)
	  	{
	    	SupplierService s = new SupplierService();
	    	s.updateSupplier(suppliers);       
	  		return "Supplier Record updated Successfully";
	  	}
	     
}
