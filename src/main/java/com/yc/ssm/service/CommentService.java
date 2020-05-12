package com.yc.ssm.service;

import com.yc.ssm.po.CommentCustom;
import com.yc.ssm.po.ItemsComment;

import java.util.List;

public interface CommentService {

    boolean isUserBuyThisItem(Integer userId, Integer itemId) throws Exception;

    void addComment(ItemsComment itemsComment) throws Exception;

    List<CommentCustom> getCommentsByItemId(Integer itemId) throws Exception;

}
