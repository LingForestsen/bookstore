package com.bookstore.ssh.action;

import com.bookstore.commons.action.BaseAction;
import com.bookstore.commons.persistence.Page;
import com.bookstore.ssh.entity.Cart;
import com.bookstore.ssh.entity.OrderItem;
import com.bookstore.ssh.entity.Orders;
import com.bookstore.ssh.entity.User;
import com.bookstore.ssh.service.OrderItemService;
import com.bookstore.ssh.service.OrdersService;
import com.bookstore.ssh.util.AppUtil;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.beans.factory.annotation.Autowired;

@ParentPackage("app")
public class OrderAction extends BaseAction implements ModelDriven<Orders> {
    @Autowired
    private OrdersService service;
    @Autowired
    private OrderItemService orderItemService;

    private Orders orders = new Orders();
    @Override
    public Orders getModel() {
        return orders;
    }

    public String save() throws Exception {
        Cart cart = (Cart) getSession().getAttribute("ShopCart");
        try {
             service.save(orders, getSession());
             cart.getItems().clear();
             return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return  ERROR;
        }
    }

    public String view() throws Exception {
        try {
            User user = AppUtil.getLoginUser();
            Page<Orders> data = service.findAll("from Orders where userid=?", 1, 999999, new Object[]{user.getId()});
            getRequest().setAttribute("OrdersData", data);
            return "view";
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
    }

    public String cancel() throws Exception {
        try {
            long id = orders.getId();
            service.updateCancel(id);
            return "cancel";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ERROR;
    }

    public String detail() throws Exception {
        try {
            Orders currOrd = service.findById(orders.getId());
            String hql = "from OrderItem where ordersid=?";
            Page<OrderItem> data = orderItemService.findAll(hql, 1, 999, new Object[]{currOrd.getId()});
            getRequest().setAttribute("Orders", currOrd);
            getRequest().setAttribute("List", data.getList());
            return "detail";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ERROR;
    }
}
