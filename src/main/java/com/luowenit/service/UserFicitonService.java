package com.luowenit.service;

import com.luowenit.dao.ChapterDao;
import com.luowenit.dao.UserFictionDao;
import com.luowenit.domain.Chapter;
import com.luowenit.domain.UserFiction;
import com.luowenit.domain.assist.Pager;
import com.luowenit.domain.mapper.UserFictionMapper;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.transaction.jdbc.JdbcTransactionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

@Service
public class UserFicitonService {

    @Autowired
    private UserFictionDao userFictionDao;
    @Autowired
    private ChapterDao chapterDao;


    public List<UserFiction> getAllByUser(int userId, Pager pager){
        List<UserFiction> allByUser = userFictionDao.getAllByUser(userId, pager);
        for (UserFiction userFiction : allByUser) {
            Chapter latest = chapterDao.getLatest(userFiction.getFiction().getId());
            userFiction.getFiction().setLatest(latest);
        }
        return allByUser;
    }

    public void setTop(int userId,int id){
        userFictionDao.setTop(userId,id);
    }

    public UserFiction getTop(int userId){
        UserFiction top = userFictionDao.getTop(userId);
        if(!Objects.isNull(top)){
            Chapter latest = chapterDao.getLatest(top.getFiction().getId());
            top.getFiction().setLatest(latest);
        }

        return top;
    }

    public void cancelTop(int userId) {
        userFictionDao.cancelTop(userId);
    }

    public void deleteOne(int userId,int id){
        userFictionDao.deleteOne(userId,id);
    }
}
