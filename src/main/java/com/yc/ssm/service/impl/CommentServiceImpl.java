package com.yc.ssm.service.impl;

import com.yc.ssm.mapper.ItemsCommentCustomMapper;
import com.yc.ssm.mapper.ItemsCommentMapper;
import com.yc.ssm.mapper.OrderitemCustomMapper;
import com.yc.ssm.mapper.OrdersCustomMapper;
import com.yc.ssm.po.CommentCustom;
import com.yc.ssm.po.ItemsComment;
import com.yc.ssm.po.ItemsCommentExample;
import com.yc.ssm.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    OrdersCustomMapper ordersCustomMapper;

    @Autowired
    OrderitemCustomMapper orderitemCustomMapper;

    @Autowired
    ItemsCommentMapper itemsCommentMapper;

    @Autowired
    ItemsCommentCustomMapper itemsCommentCustomMapper;

    private List<String> getOrderIdsByUidAndState(Integer userId, String orderState) throws Exception{
        return ordersCustomMapper.getOrderIdsByUserIdAndOrderState(userId, orderState);
    }

    @Override
    public boolean isUserBuyThisItem(Integer userId, Integer itemId) throws Exception {
        if (userId==null||itemId==null){
            return false;
        }
        String orderState = "已付款";
        List<String> orderIds = getOrderIdsByUidAndState(userId, orderState);

        if (orderIds.size()==0){
            return false;
        }

        List<Integer> itemIds = orderitemCustomMapper.getItemIdsByOrderIds(orderIds);

        for (Integer id : itemIds) {
            if (id.equals(itemId)){
                return true;
            }
        }

        return false;
    }

    @Override
    public void addComment(ItemsComment itemsComment) throws Exception {
        if (itemsComment == null){
            return;
        }

        itemsCommentMapper.insert(itemsComment);
    }

    @Override
    public List<CommentCustom> getCommentsByItemId(Integer itemId) throws Exception {
        if (itemId == null){
            return null;
        }

//        ItemsCommentExample example = new ItemsCommentExample();
//        example.createCriteria().andCommentItemidEqualTo(itemId);
//        List<ItemsComment> itemsComments = itemsCommentMapper.selectByExampleWithBLOBs(example);
//
//        if (itemsComments.size() == 0){
//            return null;
//        }
//
//        List<CommentCustom> commentCustoms = new ArrayList<>();


        return itemsCommentCustomMapper.getCommentCustomsByItemId(itemId);
    }
}
