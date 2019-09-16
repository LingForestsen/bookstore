package com.bookstore.ssh.service;

import com.bookstore.commons.persistence.Page;
import com.bookstore.ssh.entity.User;

import java.io.Serializable;

public interface UserService {
    void  save(User user) throws Exception;
    void update(User user) throws Exception;
    void delete(User user) throws Exception;
    User findById(Serializable id) throws Exception;
    User findByName(String username) throws Exception;
    User findByNameAndPassword(String name,String password)throws Exception;
    Page<User> findAllByPage(int page, int pageSize,Object[] objects) throws Exception;
    Page<User> findAllByPage(int page, int pageSize) throws Exception;
    Page<User> findAllByPage(String hql,int page, int pageSize, Object[] objects) throws Exception;
}
