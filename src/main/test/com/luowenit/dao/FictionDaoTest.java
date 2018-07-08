package com.luowenit.dao;

import com.luowenit.config.RootConfig;
import com.luowenit.domain.Chapter;
import com.luowenit.domain.Fiction;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {RootConfig.class})
public class FictionDaoTest {

    @Autowired
    FictionDao fictionDao;

    /*@Test
    public void getOne() throws Exception {
        Fiction fiction = fictionDao.getOne(203);
        for (Chapter chapter : fiction.getChapters()) {
            System.out.println(chapter);
        }
    }*/

}