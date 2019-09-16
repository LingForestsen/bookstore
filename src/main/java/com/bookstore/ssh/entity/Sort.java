package com.bookstore.ssh.entity;

import com.bookstore.commons.entity.BaseEntity;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 商品类别
 */
@Entity
@Table(name="TB_Sort")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Sort extends BaseEntity {
    private String name;
    private String text;//类别的描述

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }
}
