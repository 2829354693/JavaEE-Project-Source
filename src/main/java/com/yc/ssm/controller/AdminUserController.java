package com.yc.ssm.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import com.yc.ssm.po.*;
import com.yc.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.yc.ssm.service.AdminUserService;
import com.yc.ssm.service.ItemsService;

@Controller
@RequestMapping("/admin")
public class AdminUserController {

	@Autowired
	AdminUserService adminUserService;
	
	@Autowired
	ItemsService itemsService;

	@Autowired
	UserService userService;

	@RequestMapping("/index")
	public ModelAndView adminIndex(HttpSession session) {

		ModelAndView modelAndView = new ModelAndView();

		session.setAttribute("adminbase", session.getServletContext().getContextPath());
		modelAndView.setViewName("admin/adminLogin");
		return modelAndView;
	}

	@RequestMapping("/adminIndex")
	public ModelAndView adminLoginSuccess(HttpSession httpSession) throws Exception {

		ModelAndView modelAndView = new ModelAndView();

		Integer adminId = (Integer) httpSession.getAttribute("adminId");
		AdminUser adminUser = adminUserService.getAdminUserById(adminId);

		String adminName = adminUser.getAdminName();
		String level = adminUser.getAdminLevel();

		modelAndView.addObject("adminName", adminName);
		modelAndView.addObject("level", level);
		modelAndView.setViewName("admin/adminIndex");
		return modelAndView;
	}

	@RequestMapping("/adminLogin")
	private @ResponseBody String adminLogin(HttpSession session, String account, String password)
			throws Exception {

		if (!adminUserService.isAdminUserExist(account)) {
			return "noAccount";
		}

		if (adminUserService.verifyAdminUser(account, password)) {
			List<AdminUser> adminUsers = adminUserService.getAdminUserByAccount(account);
			AdminUser adminUser = adminUsers.get(0);

			Integer adminId = adminUser.getAdminUserid();

			session.setAttribute("adminId", adminId);

			return "success";
		} else {
			return "passwordError";
		}
	}

	@RequestMapping("/register")
	public ModelAndView adminRegisterPage() {
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("admin/adminRegister");
		return modelAndView;
	}

	@RequestMapping("/adminRegister")
	public @ResponseBody String adminRegister(@RequestBody AdminUser adminUser) throws Exception {

		if (adminUserService.isAdminUserExist(adminUser.getAdminAccount())) {

			return "userExist";
		}

		if ("".equals(adminUser.getAdminName())) {
			adminUser.setAdminName("管理员");
		}

		adminUserService.addAdminUser(adminUser);

		return "registerSuccess";

	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("adminId");
		return "admin/adminLogin";
	}
	
	@RequestMapping("/adminInfo")
	public String adminInfo(Model model, HttpSession session) throws Exception {
		Integer adminId = (Integer) session.getAttribute("adminId");
		AdminUser currentAdmin = adminUserService.getAdminUserById(adminId);
		
		model.addAttribute("currentAdmin", currentAdmin);
		
		return "admin/adminInfo";
		
	}
	
	@RequestMapping("/adminUpdate")
	public @ResponseBody String adminUpdate(HttpSession session, @RequestBody AdminUser adminUserNew) throws Exception {
		Integer adminId = (Integer) session.getAttribute("adminId");
		AdminUser currentAdmin = adminUserService.getAdminUserById(adminId);
		
		currentAdmin.setAdminName(adminUserNew.getAdminName());
		currentAdmin.setAdminPassword(adminUserNew.getAdminPassword());
		
		adminUserService.updateAdminUserById(currentAdmin);
		
		return "success";
	}
	
	@RequestMapping("/adminList")
	public String adminList(Model model, HttpSession session, Integer pageIndex) throws Exception {
		Integer pageIndexEx = pageIndex == null?1:pageIndex;
		List<AdminUser> adminUsers = adminUserService.getPageAdmins(pageIndexEx, 5);
		
		PageInfo<AdminUser> pageInfo = new PageInfo<>(adminUsers);
		
		model.addAttribute("pageInfo", pageInfo);
		
		Integer adminId = (Integer) session.getAttribute("adminId");
		AdminUser currentAdmin = adminUserService.getAdminUserById(adminId);
		
		model.addAttribute("currentAdmin", currentAdmin);
		
		
		return "admin/adminList";
		
	}
	
	@RequestMapping("/adminCancel")
	public @ResponseBody String adminCancel(Integer adminId) throws Exception {
		
		adminUserService.deleteAdminUserById(adminId);
		
		return "success";
		
	}
	
	@RequestMapping("/userList")
	public String userList(Model model, HttpSession session, Integer pageIndex) throws Exception {
		Integer adminId = (Integer) session.getAttribute("adminId");
		AdminUser currentAdmin = adminUserService.getAdminUserById(adminId);
		
		model.addAttribute("currentAdmin", currentAdmin);
		
		Integer pageIndexEx = pageIndex == null?1:pageIndex;
		List<User> pageUsers = adminUserService.getPageUsers(pageIndexEx, 5);
		
		PageInfo<User> pageInfo = new PageInfo<>(pageUsers);
		
		model.addAttribute("pageInfo", pageInfo);
		
		return "admin/userList";
		
	}
	
	@RequestMapping("/itemList")
	public String itemList(Model model, HttpSession session, Integer pageIndex) throws Exception {
		Integer adminId = (Integer) session.getAttribute("adminId");
		AdminUser currentAdmin = adminUserService.getAdminUserById(adminId);
		
		model.addAttribute("currentAdmin", currentAdmin);
		
		Integer pageIndexEx = pageIndex == null?1:pageIndex;
		List<Items> pageItems = adminUserService.getPageItems(pageIndexEx, 4);
		
		PageInfo<Items> pageInfo = new PageInfo<>(pageItems);
		
		model.addAttribute("pageInfo", pageInfo);
		
		return "admin/itemList";
		
	}

	@RequestMapping("/queryItems")
	public String queryItems(Model model, HttpSession session, Items queryItem) throws Exception {
		Integer adminId = (Integer) session.getAttribute("adminId");
		AdminUser currentAdmin = adminUserService.getAdminUserById(adminId);
		
		model.addAttribute("currentAdmin", currentAdmin);
		
		List<Items> selectedItems = itemsService.getSelectedItems(queryItem);
		
		model.addAttribute("selectedItems", selectedItems);
		
		return "admin/queryItems";
		
	}
	
	@RequestMapping("/addItem")
	public String addItem(Model model, HttpSession session) throws Exception {
		Integer adminId = (Integer) session.getAttribute("adminId");
		AdminUser currentAdmin = adminUserService.getAdminUserById(adminId);
		
		model.addAttribute("currentAdmin", currentAdmin);
		
		return "admin/addItem";
		
	}
	
	@RequestMapping("/itemSubmit")
	public String itemSubmit(Model model, HttpSession session, Items item, MultipartFile itemsPic) throws Exception {
		Integer adminId = (Integer) session.getAttribute("adminId");
		AdminUser currentAdmin = adminUserService.getAdminUserById(adminId);
		model.addAttribute("currentAdmin", currentAdmin);
		
		String originalFilename = itemsPic.getOriginalFilename();
		if (originalFilename != null && originalFilename.length() > 0) {
			String itemPicPath = "/home/yucong/easyshop/pictures/items_pic/";
			String newItemPicName = UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));
			
			File itemPicFile = new File(itemPicPath + newItemPicName);
			
			itemsPic.transferTo(itemPicFile);
			
			item.setItemsPic(newItemPicName);
		}
		
		adminUserService.addItem(item);
		return "admin/addItem";
		
	}

	@RequestMapping("/updateItem")
	public String updateItem(Model model, HttpSession session, Integer updateItemId) throws Exception {
		Integer adminId = (Integer) session.getAttribute("adminId");
		AdminUser currentAdmin = adminUserService.getAdminUserById(adminId);
		model.addAttribute("currentAdmin", currentAdmin);
		
		Items updateItem = itemsService.getItemByItemId(updateItemId);
		
		if (updateItem == null) {
			return "redirect:admin/itemList";
		}
		
		model.addAttribute("updateItem", updateItem);
		
		return "admin/updateItem";
		
	}

	@RequestMapping("/itemUpdateSubmit")
	public String itemUpdateSubmit(Model model, HttpSession session, Integer itemsId, Items newItem, MultipartFile itemsPic)
			throws Exception {
		Integer adminId = (Integer) session.getAttribute("adminId");
		AdminUser currentAdmin = adminUserService.getAdminUserById(adminId);
		model.addAttribute("currentAdmin", currentAdmin);
		
		String originalFilename = itemsPic.getOriginalFilename();
		if (originalFilename != null && originalFilename.length() > 0) {
			String itemPicPath = "/home/yucong/easyshop/pictures/items_pic/";
			String newItemPicName = UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));
			
			File newItemPic = new File(itemPicPath + newItemPicName);
			
			itemsPic.transferTo(newItemPic);
			
			newItem.setItemsPic(newItemPicName);
		} else {
			String itemPic = itemsService.getItemPicByItemId(itemsId);
			if (itemPic != null) {
				newItem.setItemsPic(itemPic);
			}
		}
		
		itemsService.updateItem(newItem);
		
		return "redirect:/admin/itemList";
		
	}
	
	@RequestMapping("/orderList")
	public String orderList(Model model, HttpSession session, Integer pageIndex) throws Exception {
		Integer adminId = (Integer) session.getAttribute("adminId");
		AdminUser currentAdmin = adminUserService.getAdminUserById(adminId);
		
		model.addAttribute("currentAdmin", currentAdmin);
		
		Integer pageIndexEx = pageIndex == null?1:pageIndex;
		List<Orders> pageOrders = adminUserService.getPageOrders(pageIndexEx, 6);
		
		PageInfo<Orders> pageInfo = new PageInfo<>(pageOrders);
		
		model.addAttribute("pageInfo", pageInfo);
		
		
		return "admin/orderList";
		
	}

	@RequestMapping("/seeOrderItem")
	public String seeOrderItem(Model model, String orderId, Integer pageIndex) throws Exception{
		model.addAttribute("pageIndex", pageIndex);

		List<Orderitem> orderItems = userService.getOrderItemsByOrderId(orderId);

		List<CartCustom> cartCustoms = new ArrayList<>();
		List<Integer> itemIds = new ArrayList<>();
		for (Orderitem orderItem : orderItems) {
			itemIds.add(orderItem.getItemsId());
		}

		List<Items> items = itemsService.getItemsByItemIds(itemIds);
		float totalPrice = 0f;
		for (int i=0; i<orderItems.size(); i++){
			CartCustom cartCustom = new CartCustom();
			cartCustom.setItemId(items.get(i).getItemsId());
			cartCustom.setItemPic(items.get(i).getItemsPic());
			cartCustom.setItemName(items.get(i).getItemsName());
			cartCustom.setItemPrice(items.get(i).getItemsPrice());
			cartCustom.setItemNum(orderItems.get(i).getItemNum());
			cartCustoms.add(cartCustom);
			totalPrice += items.get(i).getItemsPrice()*orderItems.get(i).getItemNum();
		}

		model.addAttribute("orderItems", cartCustoms);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("orderId", orderId);


		return "admin/orderList";
	}






}
