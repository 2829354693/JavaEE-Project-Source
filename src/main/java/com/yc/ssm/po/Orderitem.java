package com.yc.ssm.po;

import java.io.Serializable;

public class Orderitem implements Serializable {
    private Integer orderitemId;

    private String orderId;

    private Integer itemsId;

    private Integer itemNum;

    public Orderitem() {
    }

    public Integer getOrderitemId() {
        return orderitemId;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId == null ? null : orderId.trim();
    }

    public Integer getItemsId() {
        return itemsId;
    }

    public void setItemsId(Integer itemsId) {
        this.itemsId = itemsId;
    }

    public Integer getItemNum() {
        return itemNum;
    }

    public void setItemNum(Integer itemNum) {
        this.itemNum = itemNum;
    }
}