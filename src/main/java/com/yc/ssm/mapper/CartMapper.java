package com.yc.ssm.mapper;

import com.yc.ssm.po.Cart;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CartMapper {

    Cart selectByUserIdItemId(Cart cart) throws Exception;

    void updateByCartId(Cart cart) throws Exception;

    void updateByCartIdSelective(Cart cart) throws Exception;

    void addCart(Cart cart) throws Exception;

    List<Cart> selectCartsByUserId(Integer userId) throws Exception;

    List<Cart> selectCartsByCartId(Integer[] cartIds) throws Exception;

    void deleteCartsByCartIds(@Param("cartIds")Integer[] cartIds) throws Exception;
}
