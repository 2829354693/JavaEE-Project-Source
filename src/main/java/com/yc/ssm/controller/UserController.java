package com.yc.ssm.controller;

import com.github.pagehelper.PageInfo;
import com.yc.ssm.po.*;
import com.yc.ssm.service.ItemsService;
import com.yc.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.*;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    ItemsService itemsService;

    //跳转用户注册页面
    @RequestMapping("/regPage")
    public String regPage() {
        return "userRegister";
    }

    //处理用户注册请求
    @RequestMapping("/userRegister")
    public @ResponseBody
    String userRegister(@RequestBody User user) throws Exception {
        String userAccount = user.getUserAccount();
        if (userService.isUserAccountExist(userAccount)) {
            return "userExist";
        } else {
            user.setUserExp(0);
            user.setUserLevel(1);
            user.setUserSex("保密");
            userService.addUser(user);
            return "registerSuccess";
        }

    }

    //跳转用户登录页面
    @RequestMapping("/loginPage")
    public String loginPage(HttpSession session) {
        if (session.getAttribute("base") == null) {
            session.setAttribute("base", session.getServletContext().getContextPath());
        }
        return "userLogin";
    }

    //处理用户登录
    @RequestMapping("/userLogin")
    @ResponseBody
    public String userLogin(HttpSession session, String userAccount, String userPassword) throws Exception {
        if (userService.isUserAccountExist(userAccount)) {
            List<User> users = userService.getUserByAccount(userAccount);
            if (users.get(0).getUserPassword().equals(userPassword)) {
                session.setAttribute("user", users.get(0));
                return "success";
            } else {
                return "passwordError";
            }
        } else {
            return "noAccount";
        }
    }

    //退出登录
    @RequestMapping("/logout")
    public @ResponseBody
    String logout(HttpSession session) {
        session.removeAttribute("user");
        return "logout";
    }

    //导航条右边的购物车商品总数和总价
    @RequestMapping("/cartItemNumAndPrice")
    @ResponseBody
    public CartItemNumAndPrice cartItemNumAndPrice(HttpSession session) throws Exception{
        User user = (User) session.getAttribute("user");

        List<Cart> carts = userService.getCartsByUserId(user.getUserId());
        CartItemNumAndPrice cartItemNumAndPrice = new CartItemNumAndPrice();
        List<Integer> itemIds = new ArrayList<>();

        Integer totalNum = 0;
        float totalPrice = 0.0f;
        if (carts.size() != 0) {
            for (Cart cart : carts) {
                itemIds.add(cart.getItemId());
            }

            List<Items> items = itemsService.getItemsByItemIds(itemIds);

            for (int i = 0; i < carts.size(); i++) {
                totalNum += carts.get(i).getItemNum();
                totalPrice += items.get(i).getItemsPrice() * carts.get(i).getItemNum();
            }

        }
        cartItemNumAndPrice.setTotalItemNum(totalNum);
        cartItemNumAndPrice.setTotalPrice(totalPrice);
        return cartItemNumAndPrice;
    }

    //跳转个人中心
    @RequestMapping("/userIndex")
    public String userIndex(HttpSession session, Model model) throws Exception {
        if (session.getAttribute("user") == null) {
            return "user/log_out";
        }
        Set<String> allItemType = itemsService.getAllItemType();
        model.addAttribute("types", allItemType);

        return "user/user_index";
    }

    //跳转用户信息页面
    @RequestMapping("/userInfoPage")
    public String userInfoPage(HttpSession session) {
        if (session.getAttribute("user") == null) {
            return "user/log_out";
        }
        return "user/user_info";
    }

    //保存用户信息
    @RequestMapping("/userInfoSubmit")
    public String userInfoSubmit(HttpSession session, User user, MultipartFile head_pic) throws Exception {
        User currentUser = (User) session.getAttribute("user");

        if (currentUser == null) {
            return "user/log_out";
        }
        String originalPicName = head_pic.getOriginalFilename();
        if (originalPicName != null && originalPicName.length() > 0) {
            String head_pic_path = "/home/yucong/easyshop/pictures/user_head_pic/";
            String newHeadPicName = UUID.randomUUID() + originalPicName.substring(originalPicName.lastIndexOf("."));
            File headPic = new File(head_pic_path + newHeadPicName);

            head_pic.transferTo(headPic);

            currentUser.setUserHeadpic(newHeadPicName);
        }

        currentUser.setUserName(user.getUserName());
        currentUser.setUserAge(user.getUserAge());
        currentUser.setUserSex(user.getUserSex());
        currentUser.setUserSignature(user.getUserSignature());

        userService.updateUser(currentUser);

        return "redirect:userIndex";
    }

    //加入购物车
    @RequestMapping("/joinCart")
    @ResponseBody
    public String joinCart(HttpSession session, Integer buyNums, Integer itemId) throws Exception {
        User currentUser = (User) session.getAttribute("user");

        Cart cart = new Cart();
        cart.setUserId(currentUser.getUserId());
        cart.setItemId(itemId);
        cart.setItemNum(buyNums);

        userService.addCart(cart);

        return "joinSuccess";
    }

    //地址管理页面
    @RequestMapping("/userAddress")
    public String userAddress(HttpSession session, Model model) throws Exception {
        User currentUser = (User) session.getAttribute("user");
        if (currentUser == null) {
            return "user/log_out";
        }
        List<Address> addresses = userService.getAddressByUserId(currentUser.getUserId());
        model.addAttribute("addresses", addresses);

        return "user/user_address";
    }

    //判断能否继续添加地址
    @RequestMapping("/getAddressCount")
    @ResponseBody
    public String getAddressCount(HttpSession session) throws Exception {
        User currentUser = (User) session.getAttribute("user");

        if (currentUser == null) {
            return "user_log_out";
        }
        if (userService.getAddressCountByUserId(currentUser.getUserId()) >= 5) {
            return "toomanyads";
        } else {
            return "allowAdd";
        }
    }

    //添加地址
    @RequestMapping("/addAddress")
    @ResponseBody
    public String addAddress(HttpSession session, String address) throws Exception {
        User currentUser = (User) session.getAttribute("user");

        Address newAddress = new Address();
        newAddress.setUserId(currentUser.getUserId());
        newAddress.setUserAddress(address);

        userService.addAddress(newAddress);
        return "addSuccess";
    }

    //删除地址
    @RequestMapping("/deleteAddress")
    @ResponseBody
    public String deleteAddress(HttpSession session, Integer addressId) throws Exception {
        if (session.getAttribute("user") == null) {
            return "user_log_out";
        }
        userService.deleteAddressByAddressId(addressId);

        return "delSuccess";
    }

    //跳转购物车页面
    @RequestMapping("/myCart")
    public String myCart(HttpSession session, Model model) throws Exception {
        User currentUser = (User) session.getAttribute("user");
        if (currentUser == null) {
            return "user/log_out";
        }

        List<CartCustom> cartCustoms = userService.getCartCustomsByUserId(currentUser.getUserId());
        model.addAttribute("cartCustoms", cartCustoms);

        return "user/user_cart";
    }

    //在购物车页面改变商品数量
    @RequestMapping("/changeItemNum")
    @ResponseBody
    public String changeItemNum(HttpSession session,Integer cartId,Integer itemNum) throws Exception{
        if (session.getAttribute("user") == null) {
            return "user_log_out";
        }

        Cart cart = new Cart();
        cart.setCartId(cartId);
        cart.setItemNum(itemNum);

        userService.updateCartByCartId(cart);
        return "";
    }

    //移出购物车
    @RequestMapping("/removeCart")
    @ResponseBody
    public String removeCart(HttpSession session, @RequestBody Integer[] carts) throws Exception {

        if (session.getAttribute("user") == null) {
            return "user_log_out";
        }
        userService.deleteCartsByCartsIds(carts);

        return "removeSuccess";
    }

    //从详情页购买跳转订单页面
    @RequestMapping("/goToOrderPage")
    public String goToOrderPage(HttpSession session, Model model, Integer itemsId, Integer buyNum) throws Exception {
        User currentUser = (User) session.getAttribute("user");

        String orderId = userService.getRandomOrderId();
        model.addAttribute("orderId", orderId);
        Integer userId = currentUser.getUserId();

        Orders order = new Orders();
        order.setOrderId(orderId);
        order.setUserId(userId);
        order.setOrderCreatetime(new Date());
        order.setOrderState("待付款");

        userService.addOrder(order);

        Orderitem orderitem = new Orderitem();
        orderitem.setOrderId(orderId);
        orderitem.setItemsId(itemsId);
        orderitem.setItemNum(buyNum);

        userService.addOrderItem(orderitem);

        Items buyItem = itemsService.getItemByItemId(itemsId);
        model.addAttribute("buyItem", buyItem);

        model.addAttribute("buyNum", buyNum);

        List<Address> addresses = userService.getAddressByUserId(userId);
        model.addAttribute("addresses", addresses);



        return "user/create_order";
    }

    //购买成功处理订单和用户等级相关信息
    @RequestMapping("/pay")
    @ResponseBody
    public String pay(HttpSession session, String orderId, String address, String sendWay, String payWay, String message) throws Exception {
        User currentUser = (User) session.getAttribute("user");
        if (currentUser == null){
            return "user_log_out";
        }

        Orders order = userService.getOrderByOrderId(orderId);

        String orderMsg = "收货地址："+address+",配送方式："+sendWay+",支付方式："+payWay+",订单留言："+message;
        order.setOrderState("已付款");
        order.setOrderMessage(orderMsg);
        userService.updateOrderByOrderId(order);

        userService.calculateUserLevelByOrder(order);

        return "paySuccess";
    }

    //跳转购买成功页面
    @RequestMapping("/payEnd")
    public String payEnd(HttpSession session, Model model) throws Exception {
        User currentUser = (User) session.getAttribute("user");
        if (currentUser == null){
            return "user/log_out";
        }
        List<User> user = userService.getUserByAccount(currentUser.getUserAccount());

        session.setAttribute("user", user.get(0));
        model.addAttribute("exp", user.get(0).getUserExp());
        model.addAttribute("level", user.get(0).getUserLevel());

        return "user/pay_success";
    }

    //从购物车购买
    @RequestMapping("/buyFromCart")
    public String buyFromCart(HttpSession session, Model model, Integer[] cartId) throws Exception{
        User currentUser = (User) session.getAttribute("user");
        if (currentUser == null){
            return "user/log_out";
        }

        String orderId = userService.getRandomOrderId();
        Orders order = new Orders();
        order.setOrderId(orderId);
        order.setUserId(currentUser.getUserId());
        order.setOrderCreatetime(new Date());
        order.setOrderState("待付款");

        userService.addOrder(order);

        List<Cart> carts = userService.getCartsByCartId(cartId);
        List<Orderitem> orderitems = new ArrayList<>();
        List<Integer> itemIds = new ArrayList<>();
        for (Cart cart : carts) {
            Orderitem orderitem = new Orderitem();
            orderitem.setOrderId(orderId);
            orderitem.setItemsId(cart.getItemId());
            orderitem.setItemNum(cart.getItemNum());
            orderitems.add(orderitem);
            itemIds.add(cart.getItemId());
        }

        userService.addOrderitems(orderitems);
        userService.deleteCartsByCartsIds(cartId);

        List<Items> buyItems = itemsService.getItemsByItemIds(itemIds);
        List<CartCustom> buyItemsCustoms = new ArrayList<>();
        float totalPrice = 0f;
        for (int i=0; i<carts.size(); i++){
            CartCustom cartCustom = new CartCustom();
            cartCustom.setItemId(buyItems.get(i).getItemsId());
            cartCustom.setItemPic(buyItems.get(i).getItemsPic());
            cartCustom.setItemName(buyItems.get(i).getItemsName());
            cartCustom.setItemPrice(buyItems.get(i).getItemsPrice());
            cartCustom.setItemNum(carts.get(i).getItemNum());
            buyItemsCustoms.add(cartCustom);
            totalPrice += buyItems.get(i).getItemsPrice() * carts.get(i).getItemNum();
        }

        List<Address> addresses = userService.getAddressByUserId(currentUser.getUserId());

        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("buyItems", buyItemsCustoms);
        model.addAttribute("orderId", orderId);
        model.addAttribute("addresses", addresses);

        return "user/create_order";
    }

    //跳转个人订单页面
    @RequestMapping("orders")
    public String orders(HttpSession session, Model model, Integer pageIndex) throws Exception {
        User currentUser = (User) session.getAttribute("user");
        if (currentUser == null){
            return "user/log_out";
        }

        Integer pageIndexEx = pageIndex == null?1:pageIndex;
        List<Orders> orders = userService.pageOrders(currentUser.getUserId(), pageIndexEx, 5);
        PageInfo<Orders> pageInfo = new PageInfo<>(orders);

        model.addAttribute("pageInfo", pageInfo);

        return "user/my_orders";

    }

    //从订单页面购买
    @RequestMapping("buyFromOrder")
    public String buyFromOrder(HttpSession session,Model model, String orderId) throws Exception {
        User currentUser = (User) session.getAttribute("user");
        if (currentUser == null){
            return "user/log_out";
        }

        List<Orderitem> orderItems = userService.getOrderItemsByOrderId(orderId);
        List<Address> addresses = userService.getAddressByUserId(currentUser.getUserId());
        if (orderItems.size() == 1){
            Items buyItem = itemsService.getItemByItemId(orderItems.get(0).getItemsId());
            model.addAttribute("buyItem", buyItem);
            model.addAttribute("buyNum", orderItems.get(0).getItemNum());
        } else {
            List<Integer> itemIds = new ArrayList<>();
            for (Orderitem orderItem : orderItems) {
                itemIds.add(orderItem.getItemsId());
            }

            List<Items> items = itemsService.getItemsByItemIds(itemIds);
            List<CartCustom> buyItems = new ArrayList<>();
            float totalPrice = 0f;
            for (int i=0; i<orderItems.size(); i++){
                CartCustom cartCustom = new CartCustom();
                cartCustom.setItemId(items.get(i).getItemsId());
                cartCustom.setItemPic(items.get(i).getItemsPic());
                cartCustom.setItemName(items.get(i).getItemsName());
                cartCustom.setItemPrice(items.get(i).getItemsPrice());
                cartCustom.setItemNum(orderItems.get(i).getItemNum());
                buyItems.add(cartCustom);
                totalPrice += items.get(i).getItemsPrice() * orderItems.get(i).getItemNum();
            }

            model.addAttribute("buyItems", buyItems);
            model.addAttribute("totalPrice", totalPrice);

        }

        model.addAttribute("orderId", orderId);
        model.addAttribute("addresses", addresses);

        return "user/create_order";
    }

    //删除一个订单
    @RequestMapping("/delOrder")
    @ResponseBody
    public String delOrder(HttpSession session, String orderId) throws Exception{
        if (session.getAttribute("user") == null) {
            return "user_log_out";
        }

        userService.deleteOrderByOrderId(orderId);

        return "delSuccess";
    }

    //查看订单的商品详情
    @RequestMapping("/seeOrderItem")
    public String seeOrderItem(HttpSession session, Model model, String orderId, Integer pageIndex) throws Exception{
        if (session.getAttribute("user") == null) {
            return "user/log_out";
        }

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

        return "user/my_orders";
    }


}
