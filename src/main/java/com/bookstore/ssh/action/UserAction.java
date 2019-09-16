package com.bookstore.ssh.action;

import com.bookstore.commons.action.BaseAction;
import com.bookstore.commons.util.MD5Util;
import com.bookstore.ssh.entity.User;
import com.bookstore.ssh.service.UserService;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

@Namespace("/user")
public class UserAction extends BaseAction {
    @Autowired
    private UserService service;
    //struts2接受对象要使用构造参数或者实现接口（具体名字忘了）
    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    @Action(value = "/showregister",results = {
            @Result(name = SUCCESS,location = "/WEB-INF/pages/user/register.jsp")
    })
    public String showRegister()throws Exception{
        return SUCCESS;
    }
    @Action(value = "/register", results = {
            @Result(name = SUCCESS, type ="redirect" ,location = "/user/login.html"),
            @Result(name = INPUT,location = "/WEB-INF/pages/user/register.jsp")
    })
    public String register()throws Exception {
        try {
            user.setMoney(0.0);
            user.setPassword(MD5Util.md5(user.getPassword()));
            service.save(user);
        } catch (Exception e) {
            e.printStackTrace();
            return INPUT;
        }
        return SUCCESS;
    }
    @Action(value = "/showlogin",results = {
            @Result(name = "login",location = "/WEB-INF/pages/user/login.jsp")
    })
    public String showLogin()throws Exception{
        return "login";
    }

}
