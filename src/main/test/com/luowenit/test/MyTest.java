package com.luowenit.test;

import com.luowenit.config.RootConfig;
import com.luowenit.dao.ChapterDao;
import com.luowenit.dao.FictionDao;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {RootConfig.class})
public class MyTest {

    @Autowired
    FictionDao fictionDao;
    @Autowired
    ChapterDao chapterDao;
    @Autowired
    StringRedisTemplate template;




}
