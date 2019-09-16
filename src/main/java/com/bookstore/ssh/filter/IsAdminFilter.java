package com.bookstore.ssh.filter;

import com.bookstore.ssh.entity.User;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class IsAdminFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        User user = (User) req.getSession().getAttribute("Login_Info");
        if(user != null && user.getIsAdmin()==1){
            chain.doFilter(request, response);
        }else{
            resp.sendRedirect(req.getContextPath()+"/user/showlogin.html");
        }
    }

    @Override
    public void destroy() {

    }
}
