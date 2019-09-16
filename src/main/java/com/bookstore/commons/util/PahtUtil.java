package com.bookstore.commons.util;

import com.alibaba.druid.sql.visitor.functions.Substring;

import java.io.File;
import java.net.URL;
import java.net.URLDecoder;

public class PahtUtil {
    /**
     * 获得ClassPath的绝对路径（相当于src）
     * @return
     */
    public static String getClassPath() {
        URL url = PahtUtil.class.getClassLoader().getResource("");
        return URLDecoder.decode(url.toString().substring(6));
    }
    public static File getClassPahtFile(){
        return new File(getClassPath());
    }
}
