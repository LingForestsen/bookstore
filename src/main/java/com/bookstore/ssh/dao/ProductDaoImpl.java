package com.bookstore.ssh.dao;

import com.bookstore.commons.persistence.BaseDaoImpl;
import com.bookstore.ssh.entity.Product;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDaoImpl extends BaseDaoImpl<Product> implements ProductDao{
}
