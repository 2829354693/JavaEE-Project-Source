package com.yc.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.github.pagehelper.PageHelper;
import com.yc.ssm.exception.CustomException;
import com.yc.ssm.mapper.AdminUserMapper;
import com.yc.ssm.mapper.ItemsMapper;
import com.yc.ssm.mapper.OrdersMapper;
import com.yc.ssm.mapper.UserMapper;
import com.yc.ssm.po.AdminUser;
import com.yc.ssm.po.AdminUserExample;
import com.yc.ssm.po.AdminUserExample.Criteria;
import com.yc.ssm.po.Items;
import com.yc.ssm.po.ItemsExample;
import com.yc.ssm.po.Orders;
import com.yc.ssm.po.OrdersExample;
import com.yc.ssm.po.User;
import com.yc.ssm.po.UserExample;
import com.yc.ssm.service.AdminUserService;
import org.springframework.stereotype.Service;

@Service
public class AdminUserServiceImpl implements AdminUserService {

	@Autowired
	AdminUserMapper adminUserMapper;

	@Autowired
	UserMapper userMapper;
	
	@Autowired
	ItemsMapper itemsMapper;
	
	@Autowired
	OrdersMapper ordersMapper;
	
	@Override
	public void addAdminUser(AdminUser adminUser) throws Exception {
		if (adminUser == null) {
			return;
		}
		if (!isAdminUserExist(adminUser.getAdminAccount())) {
			adminUserMapper.insert(adminUser);
		} else {
			throw new CustomException("该用户名已存在！");
		}

	}

	@Override
	public boolean isAdminUserExist(String adminUserAccount) throws Exception {

		List<AdminUser> adminUsers = getAdminUserByAccount(adminUserAccount);

		if (adminUsers != null && !adminUsers.isEmpty()) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean verifyAdminUser(String adminUserAccount, String adminUserPassword) throws Exception {

		if (adminUserAccount == null || adminUserPassword == null) {
			return false;
		}

		List<AdminUser> adminUsers = getAdminUserByAccount(adminUserAccount);

		if (adminUsers.get(0).getAdminPassword().equals(adminUserPassword)) {
			return true;
		} else {
			return false;
		}

	}

	@Override
	public List<AdminUser> getAdminUserByAccount(String adminUserAccount) throws Exception {
		AdminUserExample adminUserExample = new AdminUserExample();

		Criteria criteria = adminUserExample.createCriteria();
		criteria.andAdminAccountEqualTo(adminUserAccount);
		List<AdminUser> adminUsers = adminUserMapper.selectByExample(adminUserExample);
		return adminUsers;
	}

	@Override
	public List<AdminUser> getAllAdminUser() throws Exception {
		AdminUserExample adminUserExample = new AdminUserExample();

		List<AdminUser> adminUsers = adminUserMapper.selectByExample(adminUserExample);

		return adminUsers;
	}

	@Override
	public void deleteAdminUserById(Integer adminUserId) throws Exception {
		if (adminUserId == null) {
			return;
		}

		adminUserMapper.deleteByPrimaryKey(adminUserId);
	}

	@Override
	public void updateAdminUserById(AdminUser adminUser) throws Exception {
		if (adminUser == null) {
			return;
		}

		if (isAdminUserExist(adminUser.getAdminAccount())) {
			adminUserMapper.updateByPrimaryKey(adminUser);
		} else {
			throw new CustomException("该账号已被注销！");
		}
		
	}

	@Override
	public List<AdminUser> getAdminUserByName(String adminUserName) throws Exception {
		if (adminUserName == null) {
			return null;
		}
		AdminUserExample adminUserExample = new AdminUserExample();

		Criteria criteria = adminUserExample.createCriteria();
		criteria.andAdminNameEqualTo(adminUserName);
		List<AdminUser> adminUsers = adminUserMapper.selectByExample(adminUserExample);
		return adminUsers;
	}

	@Override
	public AdminUser getAdminUserById(Integer adminUserId) throws Exception {
		if (adminUserId == null) {
			return null;
		}
		
		return adminUserMapper.selectByPrimaryKey(adminUserId);
	}

	@Override
	public List<AdminUser> getPageAdmins(Integer pageIndex, Integer pageSize) throws Exception {
		PageHelper.startPage(pageIndex, pageSize);
		List<AdminUser> adminUsers = getAllAdminUser();
		return adminUsers;
	}

	public List<User> getAllUser() {
		UserExample userExample = new UserExample();
		List<User> users = userMapper.selectByExampleWithBLOBs(userExample);
		
		return users;
	}
	
	public List<Items> getAllItems() {
		ItemsExample itemsExample = new ItemsExample();
		
		List<Items> allItems = itemsMapper.selectByExampleWithBLOBs(itemsExample);
		
		return allItems;
	}

	public List<Orders> getAllOrders() {
		OrdersExample orderExample = new OrdersExample();
		
		List<Orders> allOrders = ordersMapper.selectByExampleWithBLOBs(orderExample);
		
		return allOrders;
	}
	
	@Override
	public List<User> getPageUsers(Integer pageIndex, Integer pageSize) throws Exception {
		PageHelper.startPage(pageIndex, pageSize);
		List<User> allUser = getAllUser();
		
		return allUser;
	}

	@Override
	public List<Items> getPageItems(Integer pageIndex, Integer pageSize) throws Exception {
		PageHelper.startPage(pageIndex, pageSize);
		List<Items> allItems = getAllItems();
		return allItems;
	}

	@Override
	public void addItem(Items items) throws Exception {
		if (items == null) {
			return;
		}
		
		itemsMapper.insert(items);
		
	}

	@Override
	public List<Orders> getPageOrders(Integer pageIndex, Integer pageSize) throws Exception {
		PageHelper.startPage(pageIndex, pageSize);
		List<Orders> allOrders = getAllOrders();

		return allOrders;
	}


	

}
