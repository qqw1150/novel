package com.luowenit.dao;

import com.luowenit.domain.Chapter;
import com.luowenit.domain.Fiction;
import com.luowenit.domain.assist.FictionStatus;
import com.luowenit.domain.assist.Pager;
import com.luowenit.domain.mapper.ChapterMapper;
import com.luowenit.domain.mapper.FictionMapper;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ChapterDao {

    @Autowired
    SqlSessionFactory factory;

    public int addOne(Chapter chapter){
        SqlSession session = factory.openSession();
        ChapterMapper mapper = session.getMapper(ChapterMapper.class);
        int count = mapper.addOne(chapter);
        session.commit();
        session.close();
        return count;
    }

    public int addMore(List<Chapter> list){
        SqlSession session = factory.openSession();
        ChapterMapper mapper = session.getMapper(ChapterMapper.class);
        int count = mapper.addMore(list);
        session.commit();
        session.close();
        return count;
    }

    /**
     * 获取一个章节 (懒加载)
     * @param number
     * @return
     */
    public Chapter getOne(int number,int fiction_id){
        SqlSession session = factory.openSession();
        ChapterMapper mapper = session.getMapper(ChapterMapper.class);
        Map<String, Object> params = new HashMap<>();
        params.put("number", number);
        params.put("fiction_id", fiction_id);
        Chapter chapter = mapper.getOne(params);
        session.commit();
        session.close();
        return chapter;
    }

    public Chapter getOneLazy(int number,int fiction_id){
        SqlSession session = factory.openSession();
        ChapterMapper mapper = session.getMapper(ChapterMapper.class);
        Map<String, Object> params = new HashMap<>();
        params.put("number", number);
        params.put("fiction_id", fiction_id);
        Chapter chapter = mapper.getOneLazy(params);
        session.commit();
        session.close();
        return chapter;
    }

    public int deleteMoreByFid(int fiction_id){
        SqlSession session = factory.openSession();
        ChapterMapper mapper = session.getMapper(ChapterMapper.class);
        int count = mapper.deleteMoreByFid(fiction_id);
        session.commit();
        session.close();
        return count;
    }

    public List<Chapter> getLatest(List<Integer> list){
        SqlSession session = factory.openSession();
        ChapterMapper mapper = session.getMapper(ChapterMapper.class);
        List<Chapter> chapters = mapper.getLatests(list);
        session.commit();
        session.close();
        return chapters;
    }

    public int getTotalByFiction(int fiction_id){
        SqlSession session = factory.openSession();
        ChapterMapper mapper = session.getMapper(ChapterMapper.class);
        int count = mapper.getTotalByFiction(fiction_id);
        session.commit();
        session.close();
        return count;
    }

    public Chapter getLatest(int fictionId){
        SqlSession session = factory.openSession();
        ChapterMapper mapper = session.getMapper(ChapterMapper.class);
        Chapter chapter= mapper.getLatest(fictionId);
        session.commit();
        session.close();
        return chapter;
    }
}
