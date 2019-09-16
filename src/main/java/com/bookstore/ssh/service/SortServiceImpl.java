package com.bookstore.ssh.service;

import com.bookstore.commons.persistence.Page;
import com.bookstore.ssh.dao.SortDao;
import com.bookstore.ssh.entity.Sort;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
@Service
public class SortServiceImpl implements SortService {
    @Autowired
    SortDao sortDao;
    @Override
    public void save(Sort sort) throws Exception {
        sortDao.save(sort);
    }

    @Override
    public void delete(Sort sort) throws Exception {
        sortDao.delete(sort);
    }

    @Override
    public void update(Sort sort) throws Exception {
        sortDao.update(sort);
    }

    @Override
    public Sort findById(Serializable id) throws Exception {
        return sortDao.findById(Sort.class, id);
    }

    @Override
    public Page<Sort> findAllByPage(int page, int pageSize, Object[] param) throws Exception {
        return sortDao.find("from Sort", page, pageSize,param);
    }

    @Override
    public Page<Sort> findAllByPage(int page, int pageSize) throws Exception {
        return sortDao.find("from Sort", page, pageSize);
    }

    @Override
    public Page<Sort> findAllByPage(int page, int pageSize, Object[] param, String hql) throws Exception {
        return sortDao.find(hql, page, pageSize, param);
    }
}
