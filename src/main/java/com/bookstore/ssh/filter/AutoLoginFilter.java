package com.bookstore.ssh.filter;

import com.bookstore.commons.util.DesUtil;
import com.bookstore.ssh.entity.User;
import com.bookstore.ssh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@Component//让spring管理filter
public class AutoLoginFilter implements Filter {
    private static UserService userService;

    @Autowired
    private void getService(UserService service) {
        userService = service;
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession();
        User info = (User) session.getAttribute("Login_Info");
        if (info == null) {
            Cookie[] cs = req.getCookies();
            if (cs != null) {
                for (Cookie ck : cs) {
                    if ("token".equals(ck.getName())) {
                        String str = DesUtil.decrypt(ck.getValue());
                        String[] ups = str.split(",");
                        String username = ups[0];
                        String password = ups[1];
                        try {
                            User user = userService.findByNameAndPassword(username, password);
                            if (user != null) {
                                session.setAttribute("Login_Info", user);
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
        }
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }
}
