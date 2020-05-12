package com.yc.ssm.service;

import java.util.List;

import com.yc.ssm.po.*;

public interface UserService {
	
	boolean isUserAccountExist(String userAccount) throws Exception;

	List<User> getUserByAccount(String userAccount) throws Exception;
	
	void addUser(User user) throws Exception;

	void updateUser(User user) throws Exception;

	void addCart(Cart cart) throws Exception;

	Integer getAddressCountByUserId(Integer userId) throws Exception;

	void addAddress(Address address) throws Exception;

	List<Address> getAddressByUserId(Integer userId) throws Exception;

	void deleteAddressByAddressId(Integer addressId) throws Exception;

	List<CartCustom> getCartCustomsByUserId(Integer userId) throws Exception;

	void deleteCartsByCartsIds(Integer[] carts) throws Exception;

	String getRandomOrderId() throws Exception;

	void addOrder(Orders order) throws Exception;

	void addOrderItem(Orderitem orderitem) throws Exception;

	void updateOrderByOrderId(Orders order) throws Exception;

	void updateCartByCartId(Cart cart) throws Exception;

	Orders getOrderByOrderId(String orderId) throws Exception;

	void calculateUserLevelByOrder(Orders order) throws Exception;

	List<Cart> getCartsByCartId(Integer[] cartIds) throws Exception;

	void addOrderitems(List<Orderitem> orderitems) throws Exception;

	List<Orders> pageOrders(Integer userId, Integer pageIndex, Integer pageSize) throws Exception;

	List<Orderitem> getOrderItemsByOrderId(String orderId) throws Exception;

	void deleteOrderByOrderId(String orderId) throws Exception;

	List<Cart> getCartsByUserId(Integer userId) throws Exception;
}
