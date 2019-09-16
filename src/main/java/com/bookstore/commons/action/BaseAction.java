package com.bookstore.commons.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport {
	public HttpServletRequest getRequest(){
		return ServletActionContext.getRequest();
	}
	public HttpServletResponse getResponse(){
		return ServletActionContext.getResponse();
	}
	public HttpSession getSession(){
		return this.getRequest().getSession();
	}
	public ServletContext getApplication(){
		return ServletActionContext.getServletContext();
	}
	public String getPath(){
		return getRequest().getContextPath();
	}
	public String getBasePath(){
		return getRequest().getScheme()+"://"+getRequest().getServerName()+":"+getRequest().getServerPort()+getPath()+"/";
	}

	public void writeJsonOut(Object object) throws Exception{
		ObjectMapper mapper = new ObjectMapper();
		String str = mapper.writeValueAsString(object);
		getResponse().setCharacterEncoding("UTF-8");
		getResponse().getWriter().print(str);
	}

	/* ------------常用属性-------------*/
	protected int rows;
	protected int page;
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
}
