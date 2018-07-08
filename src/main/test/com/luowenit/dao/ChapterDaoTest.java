package com.luowenit.dao;

import com.luowenit.config.RootConfig;
import com.luowenit.domain.Chapter;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {RootConfig.class})
public class ChapterDaoTest {
    @Autowired
    ChapterDao chapterDao;

    /*@Test
    public void getOne() throws Exception {
        Chapter chapter = chapterDao.getOneLazy(1);
        System.out.println(chapter);
    }*/

}