package com.yc.ssm.po;

import java.io.Serializable;

public class Cart implements Serializable {
    private Integer cartId;
    private Integer userId;
    private Integer itemId;
    private Integer itemNum;

    public Cart() {
    }

    public Cart(Integer cartId, Integer userId, Integer itemId, Integer itemNum) {
        this.cartId = cartId;
        this.userId = userId;
        this.itemId = itemId;
        this.itemNum = itemNum;
    }

    public void setCartId(Integer cartId) {
        this.cartId = cartId;
    }

    public Integer getCartId() {
        return cartId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    public Integer getItemNum() {
        return itemNum;
    }

    public void setItemNum(Integer itemNum) {
        this.itemNum = itemNum;
    }
}
