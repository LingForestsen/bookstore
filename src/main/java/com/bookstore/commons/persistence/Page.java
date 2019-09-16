package com.bookstore.commons.persistence;

import java.io.Serializable;
import java.util.List;

/**
 * 分页查询支持类，代表一页的属性
 */

public class Page<T> implements Serializable {
    private int prev; //上一页
    private int now; //当前页
    private int next; //下一页
    private int pageSize; //每页页宽
    private int totalPage; //总页数
    private int totalCount; //总记录数
    private List<T> list; //查询到的数据集合

    private boolean isFirst; //是否时第一页
    private boolean isLast; //是否是最后一页

    /**
     * 根据Page的构造方法设置Page类的相关属性
     * @param list 数据集合
     * @param nowPage 总数据条数
     * @param totalCount 总记录数
     * @param pageSize 页宽
     */
    public Page(List<T> list, int nowPage, int totalCount,int pageSize) {
        this.list = list;
        this.now = nowPage;
        this.totalCount = totalCount;
        this.pageSize = pageSize;
        this.totalPage = (totalCount + pageSize - 1) / pageSize;
        this.next = nowPage-1>1?nowPage-1:1;
        this.isFirst = nowPage == 1;
        this.isFirst = nowPage == totalPage;

    }
    public int getPrev() {
        return prev;
    }

    public int getNow() {
        return now;
    }

    public int getNext() {
        return next;
    }

    public int getPageSize() {
        return pageSize;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public List<T> getList() {
        return list;
    }

    public boolean isFirst() {
        return isFirst;
    }

    public boolean isLast() {
        return isLast;
    }
}
