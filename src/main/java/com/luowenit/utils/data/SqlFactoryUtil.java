package com.luowenit.utils.data;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;

public class SqlFactoryUtil {
    private static final SqlSessionFactory factory = init();

    private static SqlSessionFactory init(){
        SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
        try {
             return builder.build(Resources.getResourceAsStream("mybatis-config.xml"));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static SqlSessionFactory getInstance(){
        return factory;
    }
}
