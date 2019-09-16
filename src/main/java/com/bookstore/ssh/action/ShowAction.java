package com.bookstore.ssh.action;

import com.bookstore.commons.action.BaseAction;
import com.bookstore.commons.persistence.Page;
import com.bookstore.ssh.entity.Product;
import com.bookstore.ssh.service.ProductService;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.beans.factory.annotation.Autowired;
@ParentPackage("app")
public class ShowAction extends BaseAction {
    @Autowired
    ProductService service;

    public String show() throws Exception {
        Page<Product> pager = service.findAllBypage(page, rows);
        writeJsonOut(pager);
        return null;
    }
}
