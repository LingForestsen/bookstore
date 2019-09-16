package com.bookstore.commons.persistence;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.io.Serializable;
import java.util.List;

@Repository
public class BaseDaoImpl<T> implements BaseDao<T> {
    @Autowired
    private SessionFactory factory;

    @Override
    public void save(T t) throws Exception {
        factory.getCurrentSession().save(t);
    }

    @Override
    public void delete(T t) throws Exception {
        factory.getCurrentSession().delete(t);
    }

    @Override
    public void update(T t) throws Exception {
        factory.getCurrentSession().update(t);
    }

    @Override
    public Page<T> find(String hql, int page, int pageSize) throws Exception {
        return find(hql, page, pageSize, null);
    }

    @Override
    public Page<T> find(String hql, int page, int pageSize, Object[] params) throws Exception {
        Query query = factory.getCurrentSession().createQuery(hql);
        for (int i = 0; params != null && i < params.length; i++) {
            query.setParameter(i, params[i]);
        }
        int start = (page - 1) * pageSize;
        int count = query.list().size();

        query.setFirstResult(start);
        query.setMaxResults(pageSize);
        List<T> list = query.list();
        return new Page<>(list, page, count, pageSize);
    }

    @Override
    public T findById(Class<T> c, Serializable id) throws Exception {
        return factory.getCurrentSession().find(c, id);
    }

    @Override
    public Page<T> findByPagePropertry(Class<T> c, String propertry, Object value, int page, int Pagesize) throws Exception {
        String hql = "from " + c.getSimpleName() + " where " + propertry + " =?";
        return find(hql, page, Pagesize, new Object[]{value});
    }

    @Override
    public Page<T> findAll(Class<T> c, int page, int pageSize) throws Exception {
        return find("from" + c.getSimpleName() , page, pageSize);
    }

    @Override
    public T findOne(String hql, Object[] params) throws Exception {
        Page<T> data = find(hql, 1, 1, params);
        if (data.getList().size() > 0) return data.getList().get(0);
        return null;
    }

    @Override
    public T findOneByPropertry(Class<T> c, String propertry, Object value) throws Exception {
        String hql = "from " + c.getSimpleName() + " where " + propertry + " =?";
        Page<T> data = find(hql, 1, 1, new Object[]{value});
        if(data.getList().size() > 0) return data.getList().get(0);
        return null;
    }
}
