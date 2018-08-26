package com.luowenit.dao;

import com.luowenit.config.RootConfig;
import com.luowenit.domain.Chapter;
import com.luowenit.domain.Fiction;
import com.luowenit.domain.UserFiction;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {RootConfig.class})
public class FictionDaoTest {

    @Autowired
    FictionDao fictionDao;
    @Autowired
    private UserFictionDao userFictionDao;


    @Test
    public void test2(){
        List<UserFiction> allByUser = userFictionDao.getAllByUser(1,null);
        System.out.println(allByUser);
    }

}