package com.yc.ssm.mapper;

import java.util.List;

import com.yc.ssm.po.Items;
import org.apache.ibatis.annotations.Param;

public interface ItemsCustomMapper {

	List<Items> selectLastFiveItems() throws Exception;

	List<Items> selectFirstTenItems() throws Exception;

	List<Items> selectItemsByItemIds(@Param("itemIds") List<Integer> itemIds) throws Exception;

	List<String> selectAllItemType() throws Exception;
	
	int countByType(String type) throws Exception;

	Items getItemByItemId(Integer itemId) throws Exception;

	String getItemNameByItemId(Integer itemId) throws Exception;

	Float getItemPriceByItemId(Integer itemId) throws Exception;

	String getItemPicByItemId(Integer itemId) throws Exception;
}
