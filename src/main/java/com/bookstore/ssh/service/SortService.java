package com.bookstore.ssh.service;

import com.bookstore.commons.persistence.Page;
import com.bookstore.ssh.entity.Sort;

import java.io.Serializable;

public interface SortService {
    void save(Sort sort) throws Exception;
    void delete(Sort sort) throws Exception;
    void update(Sort sort) throws Exception;
    Sort findById(Serializable id)throws Exception;
    Page<Sort> findAllByPage(int page,int pageSize,Object[] param)throws Exception;
    Page<Sort> findAllByPage(int page,int pageSize)throws Exception;
    Page<Sort> findAllByPage(int page,int pageSize,Object[] param ,String hql)throws Exception;
}
