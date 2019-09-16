package com.bookstore.ssh.service;

import com.bookstore.commons.persistence.Page;
import com.bookstore.ssh.entity.Product;

import java.io.Serializable;

public interface ProductService {
    void save(Product product) throws Exception;
    void update(Product product) throws Exception;
    void delete(Product product) throws Exception;
    Product findById(Serializable id)throws Exception;
    Page<Product> findAllBypage(int page,int pageSize)throws Exception;
    Page<Product> findAllBypage(int page,int pageSize,Object[] param)throws Exception;
    Page<Product> findAllBypage(int page,int pageSize,Object[] param,String hql)throws Exception;
}
