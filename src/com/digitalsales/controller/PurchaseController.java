package com.digitalsales.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PurchaseController {

	@RequestMapping("/addinvoice")
	public String addinvoice()
	{
		
		return "addinvoice";
	}
}
