package com.yc.ssm.po;

import java.io.Serializable;

public class CartCustom implements Serializable {

    private Integer cartId;
    private Integer itemId;
    private String itemName;
    private Float itemPrice;
    private Integer itemNum;
    private String itemPic;

    public CartCustom() {
    }

    public CartCustom(Integer cartId, Integer itemId, String itemName, Float itemPrice, Integer itemNum, String itemPic) {
        this.cartId = cartId;
        this.itemId = itemId;
        this.itemName = itemName;
        this.itemPrice = itemPrice;
        this.itemNum = itemNum;
        this.itemPic = itemPic;
    }

    public String getItemPic() {
        return itemPic;
    }

    public void setItemPic(String itemPic) {
        this.itemPic = itemPic;
    }

    public Integer getCartId() {
        return cartId;
    }

    public void setCartId(Integer cartId) {
        this.cartId = cartId;
    }

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public Float getItemPrice() {
        return itemPrice;
    }

    public void setItemPrice(Float itemPrice) {
        this.itemPrice = itemPrice;
    }

    public Integer getItemNum() {
        return itemNum;
    }

    public void setItemNum(Integer itemNum) {
        this.itemNum = itemNum;
    }
}
