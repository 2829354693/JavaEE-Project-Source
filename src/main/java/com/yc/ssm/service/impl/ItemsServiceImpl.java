package com.yc.ssm.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.yc.ssm.mapper.ItemsCustomMapper;
import com.yc.ssm.mapper.ItemsMapper;
import com.yc.ssm.po.Items;
import com.yc.ssm.po.ItemsExample;
import com.yc.ssm.po.ItemsExample.Criteria;
import com.yc.ssm.po.ItemsType;
import com.yc.ssm.service.ItemsService;
import org.springframework.stereotype.Service;

@Service
public class ItemsServiceImpl implements ItemsService {

	@Autowired
	ItemsMapper itemsMapper;
	
	@Autowired
	ItemsCustomMapper itemsCustomMapper;
	
	@Override
	public Items getItemByItemId(Integer itemId) throws Exception {
		if (itemId == null) {
			return null;
		}
		
		return itemsMapper.selectByPrimaryKey(itemId);
	}

	@Override
	public List<Items> getItemsByItemIds(List<Integer> itemIds) throws Exception {
		if (itemIds == null){
			return null;
		}

		return itemsCustomMapper.selectItemsByItemIds(itemIds);
	}

	@Override
	public void updateItem(Items updateItem) throws Exception {
		if (updateItem == null) {
			return;
		}
		
		itemsMapper.updateByPrimaryKey(updateItem);
	}

	@Override
	public String getItemPicByItemId(Integer itemId) throws Exception {
		if (itemId == null) {
			return null;
		}
		
		String itemsPic = getItemByItemId(itemId).getItemsPic();
		
		return itemsPic;
	}

	@Override
	public List<Items> getSelectedItems(Items queryCriteriaVo) throws Exception {
		ItemsExample itemsExample = new ItemsExample();
		Criteria criteria = itemsExample.createCriteria();
		
		if (queryCriteriaVo.getItemsId() != null) {
			if (queryCriteriaVo.getItemsName() != null && !queryCriteriaVo.getItemsName().equals("")) {
				String itemsName = "%" + queryCriteriaVo.getItemsName() + "%";
				criteria.andItemsIdEqualTo(queryCriteriaVo.getItemsId()).andItemsNameLike(itemsName);
			} else {
				criteria.andItemsIdEqualTo(queryCriteriaVo.getItemsId());
			}
		} else {
			if (queryCriteriaVo.getItemsName() != null && !queryCriteriaVo.getItemsName().equals("")) {
				String itemsName = "%" + queryCriteriaVo.getItemsName() + "%";
				criteria.andItemsNameLike(itemsName);
			}
		}
		
		return itemsMapper.selectByExampleWithBLOBs(itemsExample);
	}

	@Override
	public List<Items> getLastFiveItems() throws Exception {
		
		return itemsCustomMapper.selectLastFiveItems();
	}

	@Override
	public List<Items> getFirstTenItems() throws Exception {
		
		return itemsCustomMapper.selectFirstTenItems();
	}

	@Override
	public List<ItemsType> getItemsTypeAndNum() throws Exception {
		List<String> allItemType = itemsCustomMapper.selectAllItemType();
		Set<String> typeSet = new HashSet<>(allItemType);
		
		List<ItemsType> typeAndNumList = new ArrayList<>();

		for (String type : typeSet) {
			ItemsType itemsType = new ItemsType();
			itemsType.setItemTypeName(type);
			itemsType.setItemNumByType(itemsCustomMapper.countByType(type));
			
			typeAndNumList.add(itemsType);
		}
		
		return typeAndNumList;
	}

	@Override
	public Set<String> getAllItemType() throws Exception {
		List<String> allItemType = itemsCustomMapper.selectAllItemType();
		Set<String> allItemTypeSet = new HashSet<String>(allItemType);
		
		return allItemTypeSet;
	}

	@Override
	public List<Items> getItemsByType(String type) throws Exception {
		ItemsExample example = new ItemsExample();
		Criteria criteria = example.createCriteria();
		criteria.andItemsTypeEqualTo(type);
		
		List<Items> itemsByType = itemsMapper.selectByExample(example);
		
		return itemsByType;
	}

	@Override
	public List<Items> getItemsByWords(String queryWords) throws Exception {
		String words = "%" + queryWords + "%";
		ItemsExample example = new ItemsExample();
		Criteria criteria = example.createCriteria();
		criteria.andItemsNameLike(words);
		
		List<Items> items = itemsMapper.selectByExample(example);
		
		return items;
	}

}
