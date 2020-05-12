package com.yc.ssm.po;

import java.io.Serializable;

public class ItemsType implements Serializable {

	private String itemTypeName;

	private Integer itemNumByType;

	/**
	 * @param itemTypeName
	 * @param itemNumByType
	 */
	public ItemsType(String itemTypeName, Integer itemNumByType) {
		this.itemTypeName = itemTypeName;
		this.itemNumByType = itemNumByType;
	}

	/**
	 * 
	 */
	public ItemsType() {
	}

	public String getItemTypeName() {
		return itemTypeName;
	}

	public void setItemTypeName(String itemTypeName) {
		this.itemTypeName = itemTypeName;
	}

	public Integer getItemNumByType() {
		return itemNumByType;
	}

	public void setItemNumByType(Integer itemNumByType) {
		this.itemNumByType = itemNumByType;
	}

	
	
	
}
