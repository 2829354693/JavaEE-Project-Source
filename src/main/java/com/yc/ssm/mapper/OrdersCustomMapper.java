package com.yc.ssm.mapper;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrdersCustomMapper {

    List<String> getOrderIdsByUserIdAndOrderState(@Param("userId") Integer userId, @Param("orderState") String orderState) throws Exception;
}
