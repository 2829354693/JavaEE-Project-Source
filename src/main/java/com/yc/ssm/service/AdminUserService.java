package com.yc.ssm.service;

import com.yc.ssm.po.AdminUser;
import com.yc.ssm.po.Items;
import com.yc.ssm.po.Orders;
import com.yc.ssm.po.User;

import java.util.List;

public interface AdminUserService {

	void addAdminUser(AdminUser adminUser) throws Exception;

	void addItem(Items items) throws Exception;
	
	boolean isAdminUserExist(String adminUserAccount) throws Exception;
	
	boolean verifyAdminUser(String adminUserAccount, String adminUserPassword) throws Exception;
	
	List<AdminUser> getAdminUserByAccount(String adminUserAccount) throws Exception;
	
	List<AdminUser> getAdminUserByName(String adminUserName) throws Exception;
	
	AdminUser getAdminUserById(Integer adminUserId) throws Exception;
	
	List<AdminUser> getAllAdminUser() throws Exception;
	
	List<AdminUser> getPageAdmins(Integer pageIndex, Integer pageSize) throws Exception;

	List<User> getPageUsers(Integer pageIndex, Integer pageSize) throws Exception;

	List<Items> getPageItems(Integer pageIndex, Integer pageSize) throws Exception;

	List<Orders> getPageOrders(Integer pageIndex, Integer pageSize) throws Exception;
	
	void deleteAdminUserById(Integer adminUserId) throws Exception;
	
	void updateAdminUserById(AdminUser adminUser) throws Exception;
}
