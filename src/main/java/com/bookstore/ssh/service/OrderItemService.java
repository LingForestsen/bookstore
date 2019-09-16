package com.bookstore.ssh.service;

import com.bookstore.commons.persistence.Page;
import com.bookstore.ssh.entity.OrderItem;

import java.io.Serializable;

public interface OrderItemService {
    void save(OrderItem orderItem) throws Exception;
    void update(OrderItem orderItem) throws Exception;
    void delete(OrderItem orderItem) throws Exception;
    OrderItem findById(Serializable id) throws Exception;
    Page<OrderItem> findAll(int page,int pageSize) throws Exception;
    Page<OrderItem> findAll(int page,int pageSize,Object[] param) throws Exception;
    Page<OrderItem> findAll(String hql,int page,int pageSize,Object[] param) throws Exception;
}
