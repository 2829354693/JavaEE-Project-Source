package com.yc.ssm.mapper;

import com.yc.ssm.po.CommentCustom;

import java.util.List;

public interface ItemsCommentCustomMapper {

    List<CommentCustom> getCommentCustomsByItemId(Integer itemId) throws Exception;

}
