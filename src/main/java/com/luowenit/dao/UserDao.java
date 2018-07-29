package com.luowenit.dao;

import com.luowenit.domain.User;
import com.luowenit.domain.mapper.UserMapper;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.Objects;

@Repository
public class UserDao {
    @Autowired
    private SqlSessionFactory factory;

    public User addOne(User user){
        SqlSession session = factory.openSession();
        UserMapper mapper = session.getMapper(UserMapper.class);

        User u = mapper.getOneByUserName(user.getUsername());
        if(!Objects.isNull(u)){
           return null;
        }

        mapper.addOne(user);
        session.commit();
        session.close();
        return user;

    }

    public User getOneByUsername(String username){
        if(Objects.isNull(username) || "".equals(username)){
            return null;
        }

        SqlSession session = factory.openSession();
        UserMapper mapper = session.getMapper(UserMapper.class);
        User u = mapper.getOneByUserName(username);
        session.commit();
        session.close();
        return u;
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
