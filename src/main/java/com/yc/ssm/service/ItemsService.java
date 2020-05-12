package com.yc.ssm.service;

import java.util.List;
import java.util.Set;

import com.yc.ssm.po.Items;
import com.yc.ssm.po.ItemsType;

public interface ItemsService {

	Items getItemByItemId(Integer itemId) throws Exception;

	List<Items> getItemsByItemIds(List<Integer> itemIds) throws Exception;
	
	List<Items> getItemsByType(String type) throws Exception;

	List<Items> getItemsByWords(String queryWords) throws Exception;

	String getItemPicByItemId(Integer itemId) throws Exception;
	
	List<Items> getLastFiveItems() throws Exception;

	List<Items> getFirstTenItems() throws Exception;

	void updateItem(Items updateItem) throws Exception;
	
	List<Items> getSelectedItems(Items queryCriteriaVo) throws Exception;
	
	List<ItemsType> getItemsTypeAndNum() throws Exception;
	
	Set<String> getAllItemType() throws Exception;
}
