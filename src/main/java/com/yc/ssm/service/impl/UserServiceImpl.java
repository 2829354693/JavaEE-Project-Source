package com.yc.ssm.service.impl;

import com.github.pagehelper.PageHelper;
import com.yc.ssm.mapper.*;
import com.yc.ssm.po.*;
import com.yc.ssm.po.UserExample.Criteria;
import com.yc.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;

    @Autowired
    ItemsCustomMapper itemsCustomMapper;

    @Autowired
    CartMapper cartMapper;

    @Autowired
    AddressMapper addressMapper;

    @Autowired
    OrdersMapper ordersMapper;

    @Autowired
    OrderitemMapper orderitemMapper;

    @Autowired
    OrderitemCustomMapper orderitemCustomMapper;

    @Override
    public boolean isUserAccountExist(String userAccount) throws Exception {

        List<User> user = getUserByAccount(userAccount);

        return user != null && user.size() > 0;
    }

    @Override
    public List<User> getUserByAccount(String userAccount) throws Exception {
        UserExample example = new UserExample();
        Criteria criteria = example.createCriteria();
        criteria.andUserAccountEqualTo(userAccount);

        return userMapper.selectByExample(example);
    }

    @Override
    public void addUser(User user) throws Exception {
        if (user == null) {
            return;
        }

        userMapper.insert(user);
    }

    @Override
    public void updateUser(User user) {
        if (user == null) {
            return;
        }

        userMapper.updateByPrimaryKeyWithBLOBs(user);
    }

    @Override
    public void addCart(Cart cart) throws Exception {
        if (cart == null) {
            return;
        }

        Cart selectCart = cartMapper.selectByUserIdItemId(cart);
        if (selectCart != null) {
            selectCart.setItemNum(selectCart.getItemNum() + cart.getItemNum());
            cartMapper.updateByCartId(selectCart);
        } else {
            cartMapper.addCart(cart);
        }
    }

    @Override
    public Integer getAddressCountByUserId(Integer userId) throws Exception {
        if (userId == null) {
            return null;
        }
        AddressExample example = new AddressExample();
        AddressExample.Criteria criteria = example.createCriteria();
        criteria.andUserIdEqualTo(userId);

        return addressMapper.countByExample(example);
    }

    @Override
    public void addAddress(Address address) throws Exception {
        if (address == null) {
            return;
        }

        addressMapper.insert(address);
    }

    @Override
    public List<Address> getAddressByUserId(Integer userId) throws Exception {
        if (userId == null) {
            return null;
        }

        AddressExample example = new AddressExample();
        AddressExample.Criteria criteria = example.createCriteria();
        criteria.andUserIdEqualTo(userId);

        return addressMapper.selectByExample(example);
    }

    @Override
    public void deleteAddressByAddressId(Integer addressId) throws Exception {
        if (addressId == null) {
            return;
        }

        AddressExample example = new AddressExample();
        AddressExample.Criteria criteria = example.createCriteria();
        criteria.andAddressIdEqualTo(addressId);

        addressMapper.deleteByExample(example);
    }

    @Override
    public List<CartCustom> getCartCustomsByUserId(Integer userId) throws Exception {
        if (userId == null) {
            return null;
        }

        List<Cart> carts = cartMapper.selectCartsByUserId(userId);
        List<CartCustom> cartCustoms = new ArrayList<>();

        if (carts != null && !carts.isEmpty()) {

            for (Cart cart : carts) {
                CartCustom cartCustom = new CartCustom();
                Items item = itemsCustomMapper.getItemByItemId(cart.getItemId());
                cartCustom.setCartId(cart.getCartId());
                cartCustom.setItemId(cart.getItemId());
                cartCustom.setItemNum(cart.getItemNum());
                cartCustom.setItemName(item.getItemsName());
                cartCustom.setItemPrice(item.getItemsPrice());
                cartCustom.setItemPic(item.getItemsPic());

                cartCustoms.add(cartCustom);
            }

            return cartCustoms;
        } else {
            return cartCustoms;
        }
    }

    @Override
    public void deleteCartsByCartsIds(Integer[] carts) throws Exception {
        if (carts == null) {
            return;
        }

        cartMapper.deleteCartsByCartIds(carts);
    }

    @Override
    public String getRandomOrderId() throws Exception {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String timeString = sdf.format(new Date());

        StringBuilder result = new StringBuilder();
        Random r = new Random();
        for (int i = 0; i < 3; i++) {
            result.append(r.nextInt(10));
        }

        return timeString + result.toString();
    }

    @Override
    public void addOrder(Orders order) throws Exception {
        if (order == null) {
            return;
        }

        ordersMapper.insert(order);
    }

    @Override
    public void addOrderItem(Orderitem orderitem) throws Exception {
        if (orderitem == null) {
            return;
        }

        orderitemMapper.insert(orderitem);
    }

    @Override
    public void updateOrderByOrderId(Orders order) throws Exception {
        if (order == null) {
            return;
        }

        ordersMapper.updateByPrimaryKeyWithBLOBs(order);
    }

    @Override
    public void updateCartByCartId(Cart cart) throws Exception {
        if (cart == null){
            return;
        }

        cartMapper.updateByCartIdSelective(cart);
    }

    @Override
    public Orders getOrderByOrderId(String orderId) throws Exception {
        if (orderId == null) {
            return null;
        }

        return ordersMapper.selectByPrimaryKey(orderId);
    }

    @Override
    public void calculateUserLevelByOrder(Orders order) throws Exception {
        if (order == null) {
            return;
        }

        User user = userMapper.selectByPrimaryKey(order.getUserId());

        OrderitemExample example = new OrderitemExample();
        example.createCriteria().andOrderIdEqualTo(order.getOrderId());
        List<Orderitem> orderitems = orderitemMapper.selectByExample(example);

        if (orderitems.size() == 1) {
            Float singlePrice = itemsCustomMapper.getItemPriceByItemId(orderitems.get(0).getItemsId());
            int expGet = (int) ((singlePrice * orderitems.get(0).getItemNum()) / 1000);
            Integer totalExp = expGet + user.getUserExp();
            user.setUserExp(totalExp);
            user.setUserLevel(calculateLevelByTotalExp(totalExp));
            userMapper.updateByPrimaryKey(user);
        } else {
            for (Orderitem orderitem : orderitems) {
                Float itemPrice = itemsCustomMapper.getItemPriceByItemId(orderitem.getItemsId());
                int expGet = (int) ((itemPrice * orderitem.getItemNum())/1000);
                Integer totalExp = expGet + user.getUserExp();
                user.setUserExp(totalExp);
                user.setUserLevel(calculateLevelByTotalExp(totalExp));
                userMapper.updateByPrimaryKey(user);
            }
        }

    }

    @Override
    public List<Cart> getCartsByCartId(Integer[] cartIds) throws Exception {
        if (cartIds == null){
            return null;
        }

        return cartMapper.selectCartsByCartId(cartIds);
    }

    @Override
    public void addOrderitems(List<Orderitem> orderitems) throws Exception {
        if (orderitems == null){
            return;
        }

        orderitemCustomMapper.insertManyOrderitem(orderitems);
    }

    @Override
    public List<Orders> pageOrders(Integer userId, Integer pageIndex, Integer pageSize) throws Exception {
        OrdersExample example = new OrdersExample();
        example.createCriteria().andUserIdEqualTo(userId);
        PageHelper.startPage(pageIndex,pageSize);

        return ordersMapper.selectByExampleWithBLOBs(example);
    }

    @Override
    public List<Orderitem> getOrderItemsByOrderId(String orderId) throws Exception {
        if (orderId== null){
            return null;
        }

        OrderitemExample example = new OrderitemExample();
        example.createCriteria().andOrderIdEqualTo(orderId);

        return orderitemMapper.selectByExample(example);
    }

    @Override
    public void deleteOrderByOrderId(String orderId) throws Exception {
        if (orderId == null){
            return;
        }

        ordersMapper.deleteByPrimaryKey(orderId);
    }

    @Override
    public List<Cart> getCartsByUserId(Integer userId) throws Exception {
        if (userId==null){
            return null;
        }

        return cartMapper.selectCartsByUserId(userId);
    }

    private int calculateLevelByTotalExp(Integer totalExp) throws Exception {
        int level = 0;
        if (totalExp == 0) {
            level = 1;
        } else if (totalExp >= 1 && totalExp < 3) {
            level = 2;
        } else if (totalExp >= 3 && totalExp < 6) {
            level = 3;
        } else if (totalExp >= 6 && totalExp < 10) {
            level = 4;
        } else if (totalExp >= 10 && totalExp < 15) {
            level = 5;
        } else if (totalExp >= 15 && totalExp < 21) {
			level = 6;
		} else if (totalExp >= 21 && totalExp < 28) {
			level = 7;
		} else if (totalExp >= 28 && totalExp < 36) {
			level = 8;
		} else if (totalExp >= 36 && totalExp < 45) {
			level = 9;
		} else if (totalExp >= 45) {
			level = 10;
		}

		return level;
    }


}
