package com.yc.ssm.po;

import java.io.Serializable;

public class CartItemNumAndPrice implements Serializable {
    private Integer totalItemNum;
    private float totalPrice;

    public CartItemNumAndPrice() {
    }

    public Integer getTotalItemNum() {
        return totalItemNum;
    }

    public void setTotalItemNum(Integer totalItemNum) {
        this.totalItemNum = totalItemNum;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }
}
