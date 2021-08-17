package com.digitalsales.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.digitalsales.model.Brands;
import com.digitalsales.model.PhoneModels;
import com.digitalsales.model.Variants;
import com.digitalsales.service.BrandService;
import com.digitalsales.service.PhoneModelService;

@Controller
public class PhoneModelController {

	@RequestMapping("/addphonemodel")
	public String addphonemodel(Model model)
	{
		BrandService b= new BrandService();
		List<Brands> list = b.getBrands();
		model.addAttribute("brand",list);
		return "addphonemodel";
	}
	@RequestMapping("/managephonemodel")
	public String managephonemodel(Model model)
	{
		PhoneModelService pms = new  PhoneModelService();
		List<Object[]> list = pms.getModels();
		
		List<Variants> variants = new ArrayList();
		List<PhoneModels> models = new ArrayList();
		List<Brands> brands = new ArrayList();
		
		
		
		for(Object[] b : list)
		{
			variants.add((Variants)b[0]);
			models.add((PhoneModels)b[1]);
			brands.add((Brands)b[2]);
		}
		
		JSONObject obj = new JSONObject();
		
		obj.put("variantsJ", variants);
		model.addAttribute("JsonObj", obj);
		model.addAttribute("Variants",variants );
		
		return "managephonemodel";

	}
	
	@ResponseBody
	@RequestMapping("/addingmodels")
	public String addingmodel(HttpServletRequest request,PhoneModels model)
	{
		
		int brandid= Integer.parseInt(request.getParameter("brandid"));
		PhoneModelService pms = new  PhoneModelService();
		String brandname=pms.getBrandName(brandid);
		Brands brand = new Brands(brandid,brandname);
        model.setBrand(brand);
		String ram = request.getParameter("ram");
		String storage = request.getParameter("storage");
	
		Variants variant = new Variants();
		variant.setRam(ram);
		variant.setStorage(storage);
	   
		boolean notexist1 = pms.modelExist(model);
		
		if(notexist1)
		{
			pms.savemodel(model);
			int id = pms.getModelId(model);
			model.setModelid(id);
			variant.setPhonemodels(model);;
		}
		else
		{
			int id = pms.getModelId(model);
			model.setModelid(id);
			variant.setPhonemodels(model);;
		}
		
		boolean notexist2 = pms.variantExist(variant);
		if(notexist2)
		{
			pms.savemodel(variant);
			return "model added successfully";
		}
		else
			return "model already exist";
		
		
		
	}
	
	@ResponseBody
	@RequestMapping("/updatemodels")
	public String updatemodels(HttpServletRequest request)
	{
		String modelid = request.getParameter("modelid");
		String varid = request.getParameter("varid");
		String brandid = request.getParameter("brandid");
		String modelname = request.getParameter("modelname");
		String brandname = request.getParameter("brandname");
		String ram = request.getParameter("ram");
		String storage = request.getParameter("storage");
		
		
		Brands brand = new Brands();
		brand.setBrandid(Integer.parseInt(brandid));
		brand.setBrandname(brandname);
		
		PhoneModels models = new PhoneModels();
		models.setModelid(Integer.parseInt(modelid));
		models.setModelname(modelname);
		models.setBrand(brand);
		
		
		Variants variant = new Variants();
		variant.setVarid(Integer.parseInt(varid));
		variant.setRam(ram);
		variant.setStorage(storage);
		variant.setPhonemodels(models);
		
		
		PhoneModelService pms = new PhoneModelService();
		pms.updateModels(models,variant);
		
		return "updated model";
	}
	
	@ResponseBody
	@RequestMapping("/deletemodel")
	public String deletemodel(@RequestParam(value="VarId") int varid)
	{
		
		PhoneModelService pms = new PhoneModelService();
		pms.deleteModel(varid);
		return "model deleted";
	}
	
}
