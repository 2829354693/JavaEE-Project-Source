package com.yc.ssm.po;

public class Items {
    private Integer itemsId;

    private String itemsName;

    private String itemsType;

    private Float itemsPrice;

    private String itemsPic;

    private String itemsDetail;

    public Integer getItemsId() {
        return itemsId;
    }

    public void setItemsId(Integer itemsId) {
        this.itemsId = itemsId;
    }

    public String getItemsName() {
        return itemsName;
    }

    public void setItemsName(String itemsName) {
        this.itemsName = itemsName == null ? null : itemsName.trim();
    }

    public String getItemsType() {
        return itemsType;
    }

    public void setItemsType(String itemsType) {
        this.itemsType = itemsType == null ? null : itemsType.trim();
    }

    public Float getItemsPrice() {
        return itemsPrice;
    }

    public void setItemsPrice(Float itemsPrice) {
        this.itemsPrice = itemsPrice;
    }

    public String getItemsPic() {
        return itemsPic;
    }

    public void setItemsPic(String itemsPic) {
        this.itemsPic = itemsPic == null ? null : itemsPic.trim();
    }

    public String getItemsDetail() {
        return itemsDetail;
    }

    public void setItemsDetail(String itemsDetail) {
        this.itemsDetail = itemsDetail == null ? null : itemsDetail.trim();
    }
}