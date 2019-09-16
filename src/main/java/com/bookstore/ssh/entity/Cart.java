package com.bookstore.ssh.entity;


import java.util.*;

/**
 * 购物车
 */
public class Cart {
    private Map<Long, CartItem> items = new HashMap<Long, CartItem>();

    /**
     * 添加商品到购物车
     * @param product
     */
    public void add(Product product) {
        CartItem it = items.get(product.getId());
        if (it == null) {
            items.put(product.getId(), new CartItem(product, 1));
        }else {
            it.setNumber(it.getNumber() + 1);
        }
    }

    /**
     * 从购物车中移除商品
     * @param id
     */
    public void remove(long id) {
        items.remove(id);
    }

    /**
     * 设置商品的数量（要求已在购物车中的商品）
     * @param id 商品id
     * @param num 要设置的商品数量
     */
    public void setNumber(long id, int num) {
        CartItem it = items.get(id);
        it.setNumber(num);
    }

    /**
     * 购物车中所有商品的总价
     * @return
     */
    public double getTotalPrice() {
        double total = 0.00;
        Iterator<Map.Entry<Long,CartItem>> iterator = items.entrySet().iterator();
        while (iterator.hasNext()) {
            Map.Entry<Long,CartItem> entry = iterator.next();
            total +=entry.getValue().getTotalPrice();
        }
        return total;
    }
    public Map<Long, CartItem> getItems() {
        return items;
    }

    /**
     * 获取购物车的每一行数据
     * @return
     */
    public List<CartItem> getItemList() {
        List<CartItem> list = new ArrayList<CartItem>();
        Iterator<Map.Entry<Long, CartItem>> it = items.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry<Long,CartItem> entry = it.next();
            list.add(entry.getValue());
        }
        return list;
    }
}