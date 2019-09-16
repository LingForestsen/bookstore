package com.bookstore.ssh.entity;

/**
 * 购物车里面的每一行的商品信息
 */
public class CartItem {
    private Product product;
    private int number;//商品数量

    public CartItem(Product product, int number) {
        this.product = product;
        this.number = number;
    }

    public double getTotalPrice() {
        return product.getPrice()*number;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }
}
