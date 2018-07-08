package com.luowenit.dao;

import com.luowenit.domain.User;
import com.luowenit.domain.mapper.UserMapper;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao {
    @Autowired
    private SqlSessionFactory factory;

    public User addOne(User user){
        SqlSession session = factory.openSession();
        UserMapper mapper = session.getMapper(UserMapper.class);
        mapper.addOne(user);
        session.commit();
        session.close();
        return user;
    }

    public User login(User user){
        SqlSession session = factory.openSession();
        UserMapper mapper = session.getMapper(UserMapper.class);
        User u = mapper.login(user);
        session.commit();
        session.close();
        return u;
    }


}
