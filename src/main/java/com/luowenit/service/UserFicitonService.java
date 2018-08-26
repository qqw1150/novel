package com.luowenit.service;

import com.luowenit.dao.UserFictionDao;
import com.luowenit.domain.UserFiction;
import com.luowenit.domain.assist.Pager;
import com.luowenit.domain.mapper.UserFictionMapper;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.transaction.jdbc.JdbcTransactionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserFicitonService {

    @Autowired
    private UserFictionDao userFictionDao;


    public List<UserFiction> getAllByUser(int userId, Pager pager){
        return userFictionDao.getAllByUser(userId,pager);
    }

    public void setTop(int userId,int id){
        userFictionDao.setTop(userId,id);
    }

    public UserFiction getTop(int userId){
        return userFictionDao.getTop(userId);
    }

    public void cancelTop(int userId) {
        userFictionDao.cancelTop(userId);
    }

    public void deleteOne(int userId,int id){
        userFictionDao.deleteOne(userId,id);
    }
}
