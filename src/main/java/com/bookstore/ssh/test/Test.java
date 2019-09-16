package com.bookstore.ssh.test;

import com.bookstore.commons.persistence.Page;
import com.bookstore.commons.util.MD5Util;
import com.bookstore.ssh.entity.User;
import com.bookstore.ssh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.util.List;

@Component
public class Test {

    static UserService service = null;
    @Autowired
    private  void getService(UserService us){
        service = us;
    }
    public static void main(String[] args) throws Exception {
        ApplicationContext act = new  ClassPathXmlApplicationContext("spring/spring.xml");
        User user = new User();
//
//        user.setUsername("dasha");
//        user.setAdddr("金鹰大众");
//        String str = "12345";
//        user.setPassword(MD5Util.md5(str));
//        service.save(user);

//        user = service.findById(1L);
//        System.out.println(user.getUsername());
//        user.setId(1l);
//        service.update(user);
//        service.delete(user);
//        Page<User> page = service.findAllByPage(1, 10);
//        List<User> list = page.getList();
//        list.forEach(user1 ->
//                        System.out.println(user1.getUsername())
//                );
//
//
    }
}
