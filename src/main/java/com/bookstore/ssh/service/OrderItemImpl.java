package com.bookstore.ssh.service;

import com.bookstore.commons.persistence.Page;
import com.bookstore.ssh.dao.OrderItemDao;
import com.bookstore.ssh.entity.OrderItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;

@Service
public class OrderItemImpl implements OrderItemService {
    @Autowired
    OrderItemDao dao;
    @Override
    public void save(OrderItem orderItem) throws Exception {
        dao.save(orderItem);
    }

    @Override
    public void update(OrderItem orderItem) throws Exception {
        dao.update(orderItem);
    }

    @Override
    public void delete(OrderItem orderItem) throws Exception {
        dao.delete(orderItem);
    }

    @Override
    public OrderItem findById(Serializable id) throws Exception {
        return dao.findById(OrderItem.class, id);
    }

    @Override
    public Page<OrderItem> findAll(int page, int pageSize) throws Exception {
        return dao.find("from OrderItem", page, pageSize);
    }

    @Override
    public Page<OrderItem> findAll(int page, int pageSize, Object[] param) throws Exception {
        return dao.find("from OrderItem", page, pageSize, param);
    }

    @Override
    public Page<OrderItem> findAll(String hql, int page, int pageSize, Object[] param) throws Exception {
        return dao.find(hql, page, pageSize, param);
    }
}
