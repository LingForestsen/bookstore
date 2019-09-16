package com.bookstore.ssh.service;

import com.bookstore.commons.persistence.Page;
import com.bookstore.ssh.dao.ProductDao;
import com.bookstore.ssh.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;

@Service
public class ProductServiceImpl  implements ProductService{
    @Autowired
    ProductDao productDao;

    @Override
    public void save(Product product) throws Exception {
        productDao.save(product);
    }

    @Override
    public void update(Product product) throws Exception {
        productDao.update(product);
    }

    @Override
    public void delete(Product product) throws Exception {
        productDao.delete(product);
    }

    @Override
    public Product findById(Serializable id) throws Exception {
        return productDao.findById(Product.class, id);
    }

    @Override
    public Page<Product> findAllBypage(int page, int pageSize) throws Exception {
        return productDao.find("from Product", page, pageSize);
    }

    @Override
    public Page<Product> findAllBypage(int page, int pageSize, Object[] param) throws Exception {
        return productDao.find("from Product", page, pageSize, param);
    }

    @Override
    public Page<Product> findAllBypage(int page, int pageSize, Object[] param, String hql) throws Exception {
        return productDao.find(hql, page, pageSize, param);
    }
}
