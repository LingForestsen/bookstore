package com.bookstore.ssh.service;

import com.bookstore.commons.persistence.Page;
import com.bookstore.ssh.entity.Orders;

import javax.servlet.http.HttpSession;
import java.io.Serializable;

public interface OrdersService {
    void save(Orders orders) throws Exception;
    void save(Orders orders, HttpSession session) throws Exception;
    void update(Orders orders) throws Exception;
    void delete(Orders orders) throws Exception;
    Orders findById(Serializable id) throws Exception;
    Page<Orders> findAll(int page,int pageSize) throws Exception;
    Page<Orders> findAll(int page,int pageSize,Object[] param) throws Exception;
    Page<Orders> findAll(String hql,int page,int pageSize,Object[] param) throws Exception;
    void updateCancel(Serializable id) throws Exception;
}
