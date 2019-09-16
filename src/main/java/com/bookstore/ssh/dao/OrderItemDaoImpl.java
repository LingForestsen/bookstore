package com.bookstore.ssh.dao;

import com.bookstore.commons.persistence.BaseDaoImpl;
import com.bookstore.ssh.entity.OrderItem;
import org.springframework.stereotype.Repository;

@Repository
public class OrderItemDaoImpl extends BaseDaoImpl<OrderItem> implements OrderItemDao{
}
