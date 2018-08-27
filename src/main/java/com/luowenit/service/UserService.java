package com.luowenit.service;

import com.luowenit.dao.UserDao;
import com.luowenit.domain.User;
import com.luowenit.domain.UserFiction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

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

    public User getOneByUsername(String username){
        return userDao.getOneByUsername(username);
    }

    public void addShelf(int user_id, int fiction_id, int chapter_id) {
        userDao.addShelf(user_id,fiction_id,chapter_id);
    }

    public void updateShelf(int user_id, int fiction_id, int chapter_id) {
        userDao.updateShelf(user_id,fiction_id,chapter_id);
    }

    public UserFiction getShelf(int user_id, int fiction_id) {
        return userDao.getShelf(user_id,fiction_id);
    }

    public List<UserFiction> getShelfs(int user_id){
        return userDao.getShelfs(user_id);
    }
}
