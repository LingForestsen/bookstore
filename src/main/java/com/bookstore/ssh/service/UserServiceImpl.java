package com.bookstore.ssh.service;

import com.bookstore.commons.persistence.Page;
import com.bookstore.ssh.dao.UserDao;
import com.bookstore.ssh.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao dao;
    @Override
    public void save(User user) throws Exception {
        dao.save(user);
    }

    @Override
    public void update(User user) throws Exception {
        dao.update(user);
    }

    @Override
    public void delete(User user) throws Exception {
        dao.delete(user);
    }

    @Override
    public User findById(Serializable id) throws Exception {
        return dao.findById(User.class, id);
    }

    @Override
    public User findByName(String username) throws Exception {
        return dao.findOneByPropertry(User.class, "username", username);
    }

    @Override
    public User findByNameAndPassword(String name, String password) throws Exception {

        return dao.findOne("from User where username=? and password=?", new Object[]{name, password});
    }


    @Override
    public Page<User> findAllByPage(int page, int pageSize, Object[] objects) throws Exception {
        return dao.find("from User", page, pageSize, objects);
    }

    @Override
    public Page<User> findAllByPage(int page, int pageSize) throws Exception {
        return dao.find("from User", page, pageSize);
    }

    @Override
    public Page<User> findAllByPage(String hql, int page, int pageSize, Object[] objects) throws Exception {
        return dao.find(hql, page, pageSize, objects);
    }

}
