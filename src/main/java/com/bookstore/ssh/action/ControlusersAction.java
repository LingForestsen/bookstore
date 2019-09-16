package com.bookstore.ssh.action;

import com.bookstore.commons.action.BaseAction;
import com.bookstore.commons.persistence.Page;
import com.bookstore.commons.util.MD5Util;
import com.bookstore.ssh.entity.User;
import com.bookstore.ssh.service.UserService;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.sound.midi.Soundbank;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@ParentPackage("json-default")
public class ControlusersAction extends BaseAction implements ModelDriven<User> {
    @Autowired
    SessionFactory factory;
    @Autowired
    private UserService service;
    private Map<String,Object> map1 ;
    private int rows;
    private int page;
    private User user = new User();

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public Map<String, Object> getMap1() {
        return map1;
    }

    public void setMap1(Map<String, Object> map1) {
        this.map1 = map1;
    }
    @Override
    public User getModel() {
        return user;
    }
    @Action(value = "/json",results = {
        @Result(name="json",type ="json", params = {"root" ,"map1"})
    })
    public String json() throws Exception {
        map1 = new HashMap<String, Object>();
        Page<User> pager = service.findAllByPage(page, rows);
        map1.put("total", pager.getTotalCount());
        map1.put("rows", pager.getList());
        return "json";
    }
    @Action("/save")
    public  String saveuser() throws IOException {
        user.setPassword(MD5Util.md5(user.getPassword()));
        try {
            service.save(user);
            getResponse().getWriter().print("success");
        } catch (Exception e) {
            e.printStackTrace();
            getResponse().getWriter().print("error");

        }
        return null;
    }
    @Action("/checkname")
    public String checkName() throws IOException {
        PrintWriter out = getResponse().getWriter();
        try {
            User u = service.findByName(user.getUsername());
            if (u !=null){
                out.print(false);
                return null;
            }
            out.print(true);
        } catch (Exception e) {
            e.printStackTrace();
            out.print("error");
        }
        return null;
    }
    @Action("/update")
    public String update() throws IOException {
        PrintWriter out = getResponse().getWriter();
        try {
            User info = service.findById(user.getId());
//            if (!"".equals(user.getPassword())) {
//                info.setPassword(MD5Util.md5(user.getPassword()));
//            }
//            info.setMoney(user.getMoney());
//            info.setAdddr(user.getAdddr());
//            info.setCity(user.getCity());
//            info.setEmail(user.getEmail());
//            info.setProvice(user.getProvice());
//            info.setArea(user.getArea());
//            info.setIsAdmin(user.getIsAdmin());
//            info.setPhone(user.getPhone());
//            info.setState(user.getState());
//            service.update(info);
            factory.getCurrentSession().evict(info);//让info离线防止系统报错：session里面有两个id相同的对象
            if ("".equals(user.getPassword())) {
                user.setPassword(info.getPassword());
            } else {
                user.setPassword(MD5Util.md5(user.getPassword()));
            }
            service.update(user);
            out.print(SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            out.print(ERROR);
        }
        return null;
    }
    @Action("/del")
    public String del() throws IOException {
        PrintWriter out = getResponse().getWriter();
        try {
            User u = service.findById(user.getId());
           service.delete(u);
           out.print(SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            out.print("error");
        }
        return null;
    }

}
