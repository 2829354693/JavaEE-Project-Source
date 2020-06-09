package com.yc.ssm.controller;

import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yc.ssm.po.Items;
import com.yc.ssm.po.ItemsType;
import com.yc.ssm.service.ItemsService;

@Controller
public class IndexController {

	@Autowired
	ItemsService itemsService;

	
	@RequestMapping("/index")
	public String index(Model model, HttpSession session) throws Exception {

		if (session.getAttribute("base") == null) {
			session.setAttribute("base", session.getServletContext().getContextPath());
		}
		session.setAttribute("site", "易购网上商城");
		
		Set<String> allItemType = itemsService.getAllItemType();
		model.addAttribute("types", allItemType);
		
		List<Items> lastFiveItems = itemsService.getLastFiveItems();
		model.addAttribute("newItems", lastFiveItems);
		
		List<Items> firstTenItems = itemsService.getFirstTenItems();
		model.addAttribute("hotItems", firstTenItems);
		
		List<ItemsType> itemsTypeAndNum = itemsService.getItemsTypeAndNum();
		model.addAttribute("typeAndNum", itemsTypeAndNum);
		
		return "index";
	}
	
	
}
