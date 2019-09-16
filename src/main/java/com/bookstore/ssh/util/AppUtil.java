package com.bookstore.ssh.util;

import com.bookstore.ssh.entity.Cart;
import com.bookstore.ssh.entity.User;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;

import javax.servlet.Servlet;
import javax.servlet.http.HttpSession;

public class AppUtil {
    public static User getLoginUser() {
        HttpSession session = ServletActionContext.getRequest().getSession();
        User user = (User) session.getAttribute("Login_Info");
        return user;
    }

    public static void setLoginUser(User info) {
        HttpSession session = ServletActionContext.getRequest().getSession();
        session.setAttribute("Login_Info",info);
    }

    public static void removeLoginUser() {
        HttpSession session = ServletActionContext.getRequest().getSession();
        session.removeAttribute("Login_Info");
    }

    public static Cart getShopCart() {
        HttpSession session = ServletActionContext.getRequest().getSession();
        Cart cart = (Cart) session.getAttribute("ShopCart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("ShopCart", cart);
        }
        return cart;
    }
}
