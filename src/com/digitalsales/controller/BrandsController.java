package com.digitalsales.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.digitalsales.model.Brands;
import com.digitalsales.model.Customers;
import com.digitalsales.service.BrandService;
import com.digitalsales.service.CustomerService;

@Controller
public class BrandsController {
	@RequestMapping("/addbrand")
	public String addbrands() {

		return "addbrand";
	}

	@ResponseBody
	@RequestMapping("/addingbrands")
	public String addingbrands(Brands brand) {
		BrandService b = new BrandService();
		b.addBrand(brand);

		return "added brand successfully";
	}
	
    @RequestMapping("/managebrand")
	public ModelAndView managecustomers(Model model)
	{
    	BrandService b = new BrandService();
    	ModelAndView mv= new ModelAndView("managebrands");
    	List<Brands> list =b.getBrands();
    	mv.addObject("Brands",list);
		return mv;
	}
    @ResponseBody()
    @RequestMapping("/updatebrands")
  	public String updatecustomers(Brands brand,Model model)
  	{
    	BrandService b = new BrandService();
        b.updateBrand(brand);
        return "Brand updated Successfully";
  	}
    
    @ResponseBody()
    @RequestMapping("/deletebrand")
  	public String deletebrands(@RequestParam(value="BrandId") int id,Model model)
  	{
    	BrandService b = new BrandService();
    	Brands brand = new Brands();
        brand.setBrandid(id);
    	b.deleteBrand(brand);
    	
  		return "Brand Removed Successfully";
  	}
}
