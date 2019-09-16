package com.bookstore.commons.util;

import javax.persistence.criteria.CriteriaBuilder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Util {
    /**
     * MD5加密明文密码得到密文
     * @param str
     * @return
     */
    public static String md5(String str) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(str.getBytes());
            byte b[] = md.digest();
            int i ;
            StringBuffer buf = new StringBuffer("");
            for (int offset = 0; offset < b.length; offset++) {
                i = b[offset];
                if (i < 0) {
                    i += 256;
                }
                if (i < 16) {
                    buf.append("0");
                }
                buf.append((Integer.toHexString(i)));
            }
            str = buf.toString();
        } catch (NoSuchAlgorithmException e) {

            e.printStackTrace();
        }
        return str;
    }

    public static void main(String[] args) {
        String str = "12345";
        byte b = 'a';
        System.out.println(b);
        StringBuffer buf = new StringBuffer(" ");
        buf.append("0");
        buf.append(Integer.toHexString(15));
        System.out.println("buf:"+buf);
        String pass = md5("123456");
        System.out.println("pass:" + pass);
        System.out.println("原始密码：" + md5("asdfalkjdsflj"));
    }
}
