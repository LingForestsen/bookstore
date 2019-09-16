package com.bookstore.ssh.dao;

import com.bookstore.commons.persistence.BaseDao;
import com.bookstore.commons.persistence.BaseDaoImpl;
import com.bookstore.ssh.entity.Orders;
import org.springframework.stereotype.Repository;

@Repository
public class OrdersDaoImpl extends BaseDaoImpl<Orders> implements OrdersDao{
}
