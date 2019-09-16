package com.bookstore.ssh.service;

import com.bookstore.commons.persistence.Page;
import com.bookstore.ssh.dao.OrderItemDao;
import com.bookstore.ssh.dao.OrdersDao;
import com.bookstore.ssh.dao.ProductDao;
import com.bookstore.ssh.dao.UserDao;
import com.bookstore.ssh.entity.*;
import com.bookstore.ssh.util.AppUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.servlet.http.HttpSession;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;
import java.util.logging.SimpleFormatter;

@Service
public class OrderServiceImpl implements OrdersService{
    @Autowired
    OrdersDao dao;
    @Autowired
    UserDao userDao;
    @Autowired
    ProductDao productDao;
    @Autowired
    OrderItemDao orderItemDao;
    @Override
    public void save(Orders orders) throws Exception {
        dao.save(orders);
    }
    public static int count = 0;
    public static long lastTime = new Date().getTime();
    @Override
    public void save(Orders orders, HttpSession session) throws Exception {
        //扣除用户的余额
        User sessionUser = (User) session.getAttribute("Login_Info");
        Cart cart = (Cart) session.getAttribute("ShopCart");
        User info = userDao.findById(User.class, sessionUser.getId());
        double price = cart.getTotalPrice();
        if (info.getMoney() >= price) {
            info.setMoney(info.getMoney()-price);
            userDao.update(info);
        }
        /*---- 生成订单流水号 -----*/
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
        Date now = new Date();
        String code = sdf.format(now);
        synchronized (Orders.class) {
            if (now.getTime() - lastTime > 100) {
                count = 0;
                lastTime = new Date().getTime();
            }
            code += String.format("%05d", count++);
        }


        //构建订单信息
        orders.setCreateTime(new Date());
        orders.setPrice(price);
        orders.setState(1);
        orders.setPayments(1);
        orders.setCode(code);
        orders.setUser(info);
        dao.save(orders);
        //获取并保存订单项信息
        for(CartItem cartItem: cart.getItemList()){
            //放进购物车的价格就是结算价格
            Product product = productDao.findById(Product.class,cartItem.getProduct().getId());
            OrderItem orderItem = new OrderItem();
            orderItem.setOrders(orders);
            orderItem.setPrice(product.getPrice());//购买时商品的单价
            orderItem.setProduct(product);
            orderItem.setQuantity(cartItem.getNumber());
            orderItemDao.save(orderItem);
        }
    }

    @Override
    public void update(Orders orders) throws Exception {
        dao.update(orders);
    }

    @Override
    public void delete(Orders orders) throws Exception {
        dao.delete(orders);
    }

    @Override
    public Orders findById(Serializable id) throws Exception {
        return dao.findById(Orders.class, id);
    }

    @Override
    public Page<Orders> findAll(int page, int pageSize) throws Exception {
        return dao.find("from Orders", page, pageSize);
    }

    @Override
    public Page<Orders> findAll(int page, int pageSize, Object[] param) throws Exception {
        return dao.find("from Orders", page, pageSize, param);
    }

    @Override
    public Page<Orders> findAll(String hql, int page, int pageSize, Object[] param) throws Exception {
        return dao.find(hql, page, pageSize, param);
    }

    @Override
    public void updateCancel(Serializable id) throws Exception {
        User temp = AppUtil.getLoginUser();
        Orders orders = dao.findById(Orders.class, id);
        User info = userDao.findById(User.class, temp.getId());
        //判断当前用户是否时订单的主人
        if (info.getId() == orders.getUser().getId()) {
            //如果订单为发货就允许客户取消订单
            if (orders.getState() < 2) {
                //设置订单的状态
                orders.setState(4);
                //退还用户的余额
                info.setMoney(info.getMoney() + orders.getPrice());
            }
        }
    }
}
