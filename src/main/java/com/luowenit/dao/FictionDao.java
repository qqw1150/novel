package com.luowenit.dao;

import com.luowenit.domain.Fiction;
import com.luowenit.domain.assist.FictionStatus;
import com.luowenit.domain.assist.FictionType;
import com.luowenit.domain.assist.Pager;
import com.luowenit.domain.mapper.FictionMapper;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class FictionDao {

    @Autowired
    SqlSessionFactory factory;

    @Autowired
    ChapterDao chapterDao;

    public int addOne(Fiction fiction){
        SqlSession session = factory.openSession();
        FictionMapper mapper = session.getMapper(FictionMapper.class);
        int count = mapper.addOne(fiction);
        session.commit();
        session.close();
        return count;
    }

    public int addMore(List<Fiction> list){
        SqlSession session = factory.openSession();
        FictionMapper mapper = session.getMapper(FictionMapper.class);
        int count = mapper.addMore(list);
        session.commit();
        session.close();
        return count;
    }

    /**
     * 获取热门推荐的小说
     *
     * @return
     */
    public List<Fiction> getHots(int count) {
        SqlSession session = factory.openSession();
        FictionMapper mapper = session.getMapper(FictionMapper.class);
        List<Fiction> fictions = mapper.getHots(count);
        session.commit();
        session.close();
        return fictions;
    }

    /**
     * 获取分类最热
     * @param type
     * @param pager
     * @return
     */
    public List<Fiction> getTypesHots(FictionType type, Pager pager) {
        SqlSession session = factory.openSession();
        FictionMapper mapper = session.getMapper(FictionMapper.class);
        Map<String, Object> params = new HashMap<>();
        params.put("type", type);
        params.put("pager", pager);
        List<Fiction> fictions = mapper.getTypesHots(params);
        session.commit();
        session.close();
        return fictions;
    }


    /**
     * 最近更新
     *
     * @return
     */
    public List<Fiction> getLatests(int count) {
        SqlSession session = factory.openSession();
        FictionMapper mapper = session.getMapper(FictionMapper.class);
        List<Fiction> fictions = mapper.getLatests(count);
        session.commit();
        session.close();
        return fictions;
    }

    public List<Fiction> getTypeStatusByCondition(FictionType type,FictionStatus status, Pager pager) {
        getTotalByTypeStatus(type,status,pager);
        SqlSession session = factory.openSession();
        FictionMapper mapper = session.getMapper(FictionMapper.class);
        Map<String, Object> params = new HashMap<>();
        params.put("type", type);
        params.put("status", status);
        params.put("pager", pager);
        List<Fiction> fictions = mapper.getTypeStatusByCondition(params);
        session.commit();
        session.close();
        return fictions;
    }

    public int getTotalByTypeStatus(FictionType type,FictionStatus status, Pager pager){
        SqlSession session = factory.openSession();
        FictionMapper mapper = session.getMapper(FictionMapper.class);
        Map<String, Object> params = new HashMap<>();
        params.put("type", type);
        params.put("status", status);
        params.put("pager", pager);
        int count = mapper.getTotalByTypeStatus(params);
        pager.setTotal(count);
        session.commit();
        session.close();
        return count;
    }

    /**
     * 按条件获取分类
     * @param type
     * @param pager
     * @return
     */
    public List<Fiction> getTypeByCondition(FictionType type, Pager pager) {
        getTotalByType(type,pager);
        SqlSession session = factory.openSession();
        FictionMapper mapper = session.getMapper(FictionMapper.class);
        Map<String, Object> params = new HashMap<>();
        params.put("type", type);
        params.put("pager", pager);
        List<Fiction> fictions = mapper.getTypeByCondition(params);
        session.commit();
        session.close();
        return fictions;
    }

    public int getTotalByType(FictionType type, Pager pager){
        SqlSession session = factory.openSession();
        FictionMapper mapper = session.getMapper(FictionMapper.class);
        Map<String, Object> params = new HashMap<>();
        params.put("type", type);
        params.put("pager", pager);
        int count = mapper.getTotalByType(params);
        pager.setTotal(count);
        session.commit();
        session.close();
        return count;
    }

    public int getTotalByType(FictionType type){
        SqlSession session = factory.openSession();
        FictionMapper mapper = session.getMapper(FictionMapper.class);
        Map<String, Object> params = new HashMap<>();
        params.put("type", type);
        int count = mapper.getTotalByType(params);
        session.commit();
        session.close();
        return count;
    }

    /**
     * 按条件获取状态
     * @param status
     * @param pager
     * @return
     */
    public List<Fiction> getStatusByCondition(FictionStatus status, Pager pager) {
        getTotalByStatus(status,pager);
        SqlSession session = factory.openSession();
        FictionMapper mapper = session.getMapper(FictionMapper.class);
        Map<String, Object> params = new HashMap<>();
        params.put("status", status);
        params.put("pager", pager);
        List<Fiction> fictions = mapper.getStatusByCondition(params);
        session.commit();
        session.close();
        return fictions;
    }

    public int getTotalByStatus(FictionStatus status, Pager pager){
        SqlSession session = factory.openSession();
        FictionMapper mapper = session.getMapper(FictionMapper.class);
        Map<String, Object> params = new HashMap<>();
        params.put("status", status);
        params.put("pager", pager);
        int count = mapper.getTotalByStatus(params);
        pager.setTotal(count);
        session.commit();
        session.close();
        return count;
    }

    /**
     * 根据id获取fiction （懒加载）
     * @param id
     * @return
     */
    public Fiction getOneLazy(int id){
        SqlSession session = factory.openSession();
        FictionMapper mapper = session.getMapper(FictionMapper.class);
        Fiction fiction = mapper.getOneLazy(id);
        session.commit();
        session.close();
        return fiction;
    }

    /**
     * 根据id获取fiction
     * @param id
     * @return
     */
    public Fiction getOne(int id, Pager pager,int orderBy){
        if(pager != null){
            int total = chapterDao.getTotalByFiction(id);
            pager.setTotal(total);
        }

        SqlSession session = factory.openSession();
        FictionMapper mapper = session.getMapper(FictionMapper.class);
        Map<String, Object> params = new HashMap<>();
        params.put("id", id);
        params.put("pager", pager);
        params.put("orderBy", orderBy);
        Fiction fiction = mapper.getOne(params);
        session.commit();
        session.close();
        return fiction;
    }

    public List<Fiction> getMoreByTitle(String title,Pager pager){
        getTotalByTitle(title,pager);
        SqlSession session = factory.openSession();
        FictionMapper mapper = session.getMapper(FictionMapper.class);
        Map<String, Object> params = new HashMap<>();
        params.put("title", title);
        params.put("pager", pager);
        List<Fiction> fictions = mapper.getMoreByTitle(params);
        session.commit();
        session.close();
        return fictions;
    }

    public int getTotalByTitle(String title, Pager pager){
        SqlSession session = factory.openSession();
        FictionMapper mapper = session.getMapper(FictionMapper.class);
        Map<String, Object> params = new HashMap<>();
        params.put("title", title);
        params.put("pager", pager);
        int count = mapper.getTotalByTitle(params);
        pager.setTotal(count);
        session.commit();
        session.close();
        return count;
    }

}
