package com.yc.ssm.mapper;

import com.yc.ssm.po.ItemsComment;
import com.yc.ssm.po.ItemsCommentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ItemsCommentMapper {
    int countByExample(ItemsCommentExample example);

    int deleteByExample(ItemsCommentExample example);

    int deleteByPrimaryKey(Integer commentId);

    int insert(ItemsComment record);

    int insertSelective(ItemsComment record);

    List<ItemsComment> selectByExampleWithBLOBs(ItemsCommentExample example);

    List<ItemsComment> selectByExample(ItemsCommentExample example);

    ItemsComment selectByPrimaryKey(Integer commentId);

    int updateByExampleSelective(@Param("record") ItemsComment record, @Param("example") ItemsCommentExample example);

    int updateByExampleWithBLOBs(@Param("record") ItemsComment record, @Param("example") ItemsCommentExample example);

    int updateByExample(@Param("record") ItemsComment record, @Param("example") ItemsCommentExample example);

    int updateByPrimaryKeySelective(ItemsComment record);

    int updateByPrimaryKeyWithBLOBs(ItemsComment record);

    int updateByPrimaryKey(ItemsComment record);
}