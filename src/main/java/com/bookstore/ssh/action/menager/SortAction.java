package com.bookstore.ssh.action.menager;

import com.bookstore.commons.action.BaseAction;
import com.bookstore.commons.persistence.Page;
import com.bookstore.ssh.entity.Sort;
import com.bookstore.ssh.entity.User;
import com.bookstore.ssh.service.SortService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.Map;

@ParentPackage("json-default")
@Namespace("/manager")
public class SortAction extends BaseAction implements ModelDriven<Sort> {
    @Autowired
    private SortService sortService;
    private Sort sort = new Sort();
    private int rows;
    private int page;
    public Sort getSort() {
        return sort;
    }

    public void setSort(Sort sort) {
        this.sort = sort;
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
    @Override
    public Sort getModel() {
        return sort;
    }
    @Action("/sortjson")
    public String json() throws Exception{
        Page<Sort> pager = sortService.findAllByPage(page, rows);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("total", pager.getTotalCount());
        map.put("rows", pager.getList());
        ObjectMapper mapper = new ObjectMapper();
        String st = mapper.writeValueAsString(map);
        getResponse().setCharacterEncoding("UTF-8");
        getResponse().setContentType("charset=utf-8");
        getResponse().getWriter().print(st);
        return null;
    }
    @Action("/sortadd")
    public String add() throws Exception{
        try {
            System.out.println("name:" + sort.getName());
            System.out.println("text:" + sort.getText());
            sortService.save(sort);
            getResponse().getWriter().print(SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            getResponse().getWriter().print(ERROR);
        }
        return null;
    }
    @Action("/sortupdate")
    public String update()throws Exception {
        try {
            Sort tempSort = sortService.findById(sort.getId());
            tempSort.setText(sort.getText());
            tempSort.setName(sort.getName());
            sortService.update(tempSort);
            getResponse().getWriter().print(SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            getResponse().getWriter().print(ERROR);
        }

        return null;
    }
    @Action("/getproductsort")
    public String getproductsort()throws Exception {
        Page<Sort> sorts = sortService.findAllByPage(page, rows);
        ObjectMapper mapper = new ObjectMapper();
        String str = mapper.writeValueAsString(sorts.getList());
        getResponse().setCharacterEncoding("UTF-8");
        getResponse().getWriter().print(str);
        return null;
    }

}
