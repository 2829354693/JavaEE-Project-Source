package com.yc.ssm.controller;

import java.util.List;
import java.util.Set;

import com.yc.ssm.po.User;
import com.yc.ssm.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yc.ssm.po.Items;
import com.yc.ssm.service.ItemsService;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/items")
public class ItemsController {

	@Autowired
	ItemsService itemsService;

	@Autowired
	CommentService commentService;

	//根据商品类型跳转商品列表页面
	@RequestMapping("/itemsByType")
	public String itemsByType(Model model, String type) throws Exception {
		List<Items> items = itemsService.getItemsByType(type);
		model.addAttribute("items", items);

		Set<String> allItemType = itemsService.getAllItemType();
		model.addAttribute("types", allItemType);
		return "itemsByType";
	}

	//根据商品关键字模糊查询
	@RequestMapping("/searchItems")
	public String searchItems(Model model, String queryWords) throws Exception {
		List<Items> itemsByWords = itemsService.getItemsByWords(queryWords);
		model.addAttribute("itemsByWords", itemsByWords);

		Set<String> allItemType = itemsService.getAllItemType();
		model.addAttribute("types", allItemType);

		return "searchItems";

	}

	//商品详情页面
	@RequestMapping("/itemDetail")
	public String itemDetail(HttpSession session, Model model, Integer item_id) throws Exception {
		Set<String> allItemType = itemsService.getAllItemType();
		model.addAttribute("types", allItemType);

		Items item = itemsService.getItemByItemId(item_id);
		model.addAttribute("item", item);

		User user = (User) session.getAttribute("user");
		if (user != null){
			if (commentService.isUserBuyThisItem(user.getUserId(), item_id)){
				model.addAttribute("allowComment", "allowComment");
			}
		}

		return "item_detail";
	}















}
