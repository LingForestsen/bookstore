package com.bookstore.ssh.action.menager;

import com.bookstore.commons.action.BaseAction;
import com.bookstore.commons.persistence.Page;
import com.bookstore.ssh.entity.Product;
import com.bookstore.ssh.entity.Sort;
import com.bookstore.ssh.service.ProductService;
import com.bookstore.ssh.service.SortService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.Map;

@Namespace("/manager")
public class ProductAction extends BaseAction implements ModelDriven<Product> {
    @Autowired
    ProductService productService;
    @Autowired
    SortService sortService;
    private Product product = new Product();

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
    @Action("/addProduct")
    public String addProduct() throws Exception{
        try {
            Sort sort = sortService.findById(product.getSort().getId());
            product.setSort(sort);
            productService.save(product);
            getResponse().getWriter().print(SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            getResponse().getWriter().print(ERROR);
        }
        return null;
    }
    @Action("/getproductjson")
    public String getProructJson()throws Exception {
        Page<Product> pager = productService.findAllBypage(page, rows);
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("total", pager.getTotalCount());
        map.put("rows", pager.getList());
        ObjectMapper mapper = new ObjectMapper();
        getResponse().setCharacterEncoding("UTF-8");
        String st = mapper.writeValueAsString(map);
        getResponse().getWriter().print(st);
        return null;
    }


    @Override
    public Product getModel() {
        return product;
    }
}
