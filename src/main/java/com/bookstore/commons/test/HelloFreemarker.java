package com.bookstore.commons.test;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
/**
 * 
 * @author Administrator
 * 
 * 翻译：process=加工
 */
public class HelloFreemarker {
	public static void main(String[] args) throws IOException, TemplateException {
		//模板+数据=结果
		
		Configuration cfg = new Configuration();
		cfg.setDirectoryForTemplateLoading(new File("c:/abc/"));
		//cfg.setServletContextForTemplateLoading(application, "/WEB-INF/template");
		
		Template tmp = cfg.getTemplate("hello.ftl");
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("title", "HelloFreemarker");
		data.put("message", "中华人民共和国万岁");
		
		File path = new File("c:/abc/code");
		if(!path.exists()){
			path.mkdirs();
		}
		File result = new File(path,"index.html");
		FileOutputStream out = new FileOutputStream(result);
		Writer wri = new OutputStreamWriter(out);
		
		
		StringWriter sw = new StringWriter();
		tmp.process(data,sw );
		String str = sw.toString();
	}
}
