package com.bookstore.ssh.action;

import com.bookstore.commons.action.BaseAction;
import com.bookstore.commons.util.DesUtil;
import com.bookstore.commons.util.MD5Util;
import com.bookstore.ssh.entity.User;
import com.bookstore.ssh.service.UserService;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.Cookie;

@ParentPackage("app")
@Results({
        @Result(name = "success",type = "redirect",location = "/index.html"),
        @Result(name = "error",type = "redirect", location = "/user/showlogin.html"),
        @Result(name = "input",type = "redirect", location = "/user/showlogin.html")
})
public class LoginAction extends BaseAction implements ModelDriven<User> {
    @Autowired
    UserService service;
    private User user = new User();

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public User getModel() {
        return user;
    }

    public String exe() throws Exception {
        try {
            String md5 = MD5Util.md5(user.getPassword());
            User info = service.findByNameAndPassword(user.getUsername(), md5);
            if (info != null) {
                switch (info.getState()) {
                    case 1:
                        getSession().setAttribute("Login_Info", info);
                        String remember = getRequest().getParameter("remember");
                        if (remember != null && remember.length() > 0) {
                            String str = info.getUsername() + "," + info.getPassword();
                            String token = DesUtil.encrypt(str);
                            Cookie cookie = new Cookie("token", token);
                            cookie.setMaxAge(60 * 60 * 24 * 7);
                            cookie.setPath("/");
                            getResponse().addCookie(cookie);
                        }
                        return SUCCESS;
                    case 0: return "active";
                    case 2: return "block";

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }

        return INPUT;
    }

    public String exit() throws Exception {
        getSession().removeAttribute("Login_Info");
        Cookie cookie = new Cookie("token", null);
        cookie.setMaxAge(0);
        cookie.setPath("/");
        getResponse().addCookie(cookie);
        return SUCCESS;
    }
}
