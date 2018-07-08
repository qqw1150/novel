package com.luowenit.test;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.luowenit.config.RootConfig;
import com.luowenit.config.WebConfig;
import com.luowenit.dao.ChapterDao;
import com.luowenit.dao.FictionDao;
import com.luowenit.domain.Chapter;
import com.luowenit.domain.Fiction;
import com.luowenit.domain.assist.FictionStatus;
import com.luowenit.domain.assist.FictionType;
import com.luowenit.domain.assist.Pager;
import com.luowenit.domain.assist.Size;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.ListOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.hash.HashMapper;
import org.springframework.data.redis.hash.Jackson2HashMapper;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {RootConfig.class})
public class MyTest {

    @Autowired
    FictionDao fictionDao;
    @Autowired
    ChapterDao chapterDao;

    @Test
    public void test(){
        Chapter one = chapterDao.getOneLazy(1, 1);
        System.out.println(one);
    }

    @Test
    public void getHots(){
        List<Fiction> hots = fictionDao.getHots(10);
        System.out.println(hots);
    }

    @Test
    public void test3(){
        Pager pager = new Pager(1, 10);
        List<Fiction> hots = fictionDao.getTypesHots(null,pager);
        System.out.println(hots);
    }

    @Test
    public void test4(){
        List<Fiction> hots = fictionDao.getSortedByDate(600,0);
        System.out.println(hots);

    }

    @Test
    public void test5(){
        List<Fiction> hots = fictionDao.getLatests(10);
        List<Integer> fictionIds = new ArrayList<>();
        for (int i = 0; i < hots.size(); i++) {
            fictionIds.add(hots.get(i).getId());
        }
        List<Chapter> latest = chapterDao.getLatest(fictionIds);

        System.out.println(latest);
        System.out.println(hots);

    }

    @Test
    public void test6(){
        Pager pager = new Pager(1, 10);
        List<Fiction> hots = fictionDao.getTypeByCondition(FictionType.LISHI,pager);
        for (Fiction hot : hots) {
            System.out.println(hot.getId());
        }

    }

    @Test
    public void test7(){
        Pager pager = new Pager(1, 10);
        List<Fiction> hots = fictionDao.getStatusByCondition(FictionStatus.CONTINUE,pager);
        for (Fiction hot : hots) {
            System.out.println(hot.getId()+" "+hot.getCover());
        }

    }

    @Test
    public void test2(){
        List<Fiction> list = new ArrayList<>();
        for (int i = 0; i < 4; i++) {
            Fiction fiction = new Fiction();
            fiction.setStatus(FictionStatus.CONTINUE);
            fiction.setDownUrl("xxx"+i);
            fiction.setType(FictionType.MEIWEN);
            fiction.setUptime(new Date());
            fiction.setIntro("jjj"+i);
            fiction.setAuthor("hhh"+i);
            fiction.setCover("xxxx"+i);
            fiction.setSize(new Size(i*10));
            fiction.setClicks(i*20);
            fiction.setLevel(i);
            fiction.setTitle("ii"+i);
            list.add(fiction);
        }
        int count = fictionDao.addMore(list);
        System.out.println(count);
        for (Fiction fiction : list) {
            System.out.println(fiction.getId());
        }

    }

    @Test
    public void test8(){
        Fiction fiction = fictionDao.getOneLazy(203);

        List<Chapter> list = new ArrayList<>();
        for (int i = 0; i < 1000; i++) {
            Chapter chapter = new Chapter();
            chapter.setName("name"+i);
            chapter.setNumber(i);
            chapter.setContent("content"+i);
            chapter.setFiction(fiction);
            list.add(chapter);
        }
        chapterDao.addMore(list);
    }

    @Autowired
    private RedisTemplate redisTemplate;

    @Resource(name = "redisTemplate")
    ListOperations<String, String> listOperations;

    @Test
    public void test9() throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        List<Fiction> hots = fictionDao.getHots(10);
        for (Fiction hot : hots) {
            String json = mapper.writeValueAsString(hot);
            listOperations.leftPush("list",json);
        }

        for (int i = 0; i < 10; i++) {
            String list = listOperations.index("list",i);
            System.out.println(list);
        }
    }



}
