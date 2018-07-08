package com.luowenit.service;

import com.luowenit.dao.UserDao;
import com.luowenit.domain.User;
import com.luowenit.domain.mapper.UserMapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    private UserDao userDao;

    public User addOne(User user){
        return userDao.addOne(user);
    }

    public User login(User user){
        User loginUser = userDao.login(user);
        if(loginUser != null){
           return loginUser;
        }
        return null;
    }

}
