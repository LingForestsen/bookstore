package com.bookstore.ssh.entity;

import com.bookstore.commons.entity.BaseEntity;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

import javax.persistence.*;

/**
 * 订单页里面的每一行订单实体
 */
@Entity
@Table(name = "TB_OrderItem")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class OrderItem extends BaseEntity {
    private int quantity;//购买的数量
    private double price;//购买时的价格

    @ManyToOne(fetch = FetchType.EAGER)
    @Cascade(CascadeType.SAVE_UPDATE)
    @JoinColumn(name = "ordersId")
    private Orders orders;//属于哪个订单

    @ManyToOne(fetch = FetchType.EAGER)
    @Cascade(CascadeType.SAVE_UPDATE)
    @JoinColumn(name = "productId")
    private Product product;//每一行订单里面的商品

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Orders getOrders() {
        return orders;
    }

    public void setOrders(Orders orders) {
        this.orders = orders;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
