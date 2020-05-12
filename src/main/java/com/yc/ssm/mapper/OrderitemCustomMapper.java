package com.yc.ssm.mapper;

import com.yc.ssm.po.Orderitem;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderitemCustomMapper {

    void insertManyOrderitem(@Param("orderitems")List<Orderitem> orderitems) throws Exception;

    List<Integer> getItemIdsByOrderIds(@Param("orderIds") List<String> orderIds) throws Exception;
}
