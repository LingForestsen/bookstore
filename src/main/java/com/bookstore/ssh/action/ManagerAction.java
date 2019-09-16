package com.bookstore.ssh.action;

import com.bookstore.commons.action.BaseAction;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

@Namespace("/user")
@Results({
        @Result(name = "success",location = "/WEB-INF/pages/manager/control.jsp")
})
public class ManagerAction extends BaseAction {
    @Action("/manager")
    public  String manager(){
        return SUCCESS;
    }
}
