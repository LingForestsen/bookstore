package com.bookstore.commons.persistence;

import java.io.Serializable;

public interface BaseDao<T> {
    abstract void save(T t) throws Exception;

    abstract  void delete(T t) throws Exception;

    abstract  void update(T t) throws Exception;

    /**
     * 分页查询（无参）
     * @param hql 查询语句
     * @param page 第几页
     * @param pageSize 每页多少条
     * @return 页的属性类
     * @throws Exception
     */
    abstract Page<T> find(String hql, int page, int pageSize) throws Exception;

    /**
     * 分页查询（带参数）
     * @param hql 查询语句
     * @param page 第几页
     * @param pageSize 每页多少条
     * @param params 查询参数
     * @return 返回也属性类
     * @throws Exception
     */
    abstract Page<T> find(String hql, int page, int pageSize, Object[] params ) throws Exception;

    /**
     * 通过id查询
     * @param c 指定返回的参数类型
     * @param id  类的id
     * @return
     * @throws Exception
     */
    abstract T findById(Class<T> c, Serializable id) throws Exception;

    /**
     * 根据属性进行分页查询
     * @param c 指定实体类
     * @param propertry 那个属性
     * @param value 什么值
     * @param page 第几页
     * @param Pagesize 每页记录数
     * @return
     * @throws Exception
     */
    abstract Page<T> findByPagePropertry(Class<T> c, String propertry, Object value, int page, int Pagesize) throws Exception;

    /**
     * 对所有属性进行分页查询
     * @param c 指定实体类型
     * @param page 要查第几页
     * @param pageSize 每页多少条
     * @return
     * @throws Exception
     */
    abstract Page<T> findAll(Class<T> c, int page, int pageSize) throws Exception;

    /**
     * 根据hql语句查询一个对象
     * @param hql
     * @param params
     * @return
     * @throws Exception
     */
    abstract T findOne(String hql, Object[] params)throws Exception;

    /**
     * 根据属性查询一个对象
     * @param c 指定实体类型
     * @param propertry 哪个属性
     * @param value 属性的社么值
     * @return
     * @throws Exception
     */
    abstract T findOneByPropertry(Class<T> c, String propertry, Object value) throws Exception;
}

