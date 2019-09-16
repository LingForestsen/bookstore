package com.bookstore.ssh.dao;

import com.bookstore.commons.persistence.BaseDaoImpl;
import com.bookstore.ssh.entity.User;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao {
}
