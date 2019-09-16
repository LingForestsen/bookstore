package com.bookstore.ssh.action;

import com.bookstore.commons.action.BaseAction;
import com.bookstore.ssh.entity.Cart;
import com.bookstore.ssh.entity.Product;
import com.bookstore.ssh.service.ProductService;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 购物车相关的服务器处理
 */
@ParentPackage("app")
public class ShopAction extends BaseAction implements ModelDriven<Product> {
    @Autowired
    ProductService productService;
    private Product product = new Product();
    @Override
    public Product getModel() {
        return product;
    }

    public String add() throws Exception {
        Cart cart = null;
        try {
            cart = (Cart) getSession().getAttribute("ShopCart");
            if (cart == null) {
                cart = new Cart();
                getSession().setAttribute("ShopCart", cart);
            }
            Product currP = productService.findById(product.getId());
            cart.add(currP);
            getResponse().getWriter().print(SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            getResponse().getWriter().print(ERROR);
        }

        return null;
    }

    /**
     * 设置购物车中商品的数量（rows代表num商品的数量）
     * @return
     * @throws Exception
     */
    public String setNum() throws Exception {
        Cart cart = (Cart) getRequest().getSession().getAttribute("ShopCart");
        cart.setNumber(product.getId(), rows);
        getResponse().sendRedirect(getPath()+"/ShopCart.html");
        return null;
    }

    public String remove() throws Exception {
        Cart cart = (Cart) getRequest().getSession().getAttribute("ShopCart");
        cart.remove(product.getId());
        getResponse().sendRedirect(getPath()+"/ShopCart.html");
        return null;
    }
}
