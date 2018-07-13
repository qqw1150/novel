package com.luowenit.service;

import com.luowenit.dao.ChapterDao;
import com.luowenit.dao.FictionDao;
import com.luowenit.domain.Chapter;
import com.luowenit.domain.Fiction;
import com.luowenit.domain.assist.FictionStatus;
import com.luowenit.domain.assist.FictionType;
import com.luowenit.domain.assist.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class FictionService {
    @Autowired
    private FictionDao fictionDao;
    @Autowired
    private ChapterDao chapterDao;

    /**
     * 获取热门推荐的小说
     *
     * @return
     */
    public List<Fiction> getHots(int count) {
        return fictionDao.getHots(count);
    }

    /**
     * 获取分类最热
     * @param type
     * @return
     */
    public List<Fiction> getTypesHots(FictionType type, Pager pager) {
        return fictionDao.getTypesHots(type, pager);
    }

    /**
     * 获取所有分类热门
     * @return
     */
    public List<Map<Integer,List<Fiction>>> getTypeHotsItems(){
        List<Map<Integer,List<Fiction>>> list = new ArrayList<>();
            Map<Integer,List<Fiction>> typesHotsItems = new HashMap<>();
            List<FictionType> allType = FictionType.getAllType();
            int i = 1;
            Pager pager = new Pager(1, 5);
            for (FictionType fictionType : allType) {
                List<Fiction> typesHots = fictionDao.getTypesHots(fictionType, pager);
                typesHotsItems.put(fictionType.getIndex(),typesHots);
                if(i % 4 == 0 ){
                    list.add(typesHotsItems);
                    typesHotsItems = new HashMap<>();
                }
            i++;
        }
        return list;
    }

    public Map<FictionType, Integer> getTotalByType(){
        Map<FictionType, Integer> map = new HashMap<>();
        for (FictionType type : FictionType.getAllType()) {
            int totalByType = fictionDao.getTotalByType(type);
            map.put(type,totalByType);
        }
        return map;
    }

    /**
     * 最近更新
     *
     * @return
     */
    public List<Fiction> getLatests(int count) {
        List<Integer> fictionIds = new ArrayList<>();
        List<Fiction> latests = fictionDao.getLatests(count);
        Calendar cal = Calendar.getInstance();
        for (int i = 0; i < latests.size(); i++) {
            fictionIds.add(latests.get(i).getId());
            cal.setTime(latests.get(i).getUptime());
            cal.add(Calendar.DATE,1);
            latests.get(i).setUptime(cal.getTime());
        }
        List<Chapter> chapters = chapterDao.getLatest(fictionIds);
        for (Chapter chapter : chapters) {
            for (Fiction fiction : latests) {
                if(chapter.getFiction().getId() == fiction.getId()){
                    fiction.setLatest(chapter);
                }
            }
        }

        return latests;
    }

    /**
     * 按条件获取分类
     * @param type
     * @return
     */
    public List<Fiction> getTypeByCondition(FictionType type,Pager pager) {
        return fictionDao.getTypeByCondition(type, pager);
    }

    /**
     * 按条件获取状态
     * @param status
     * @return
     */
    public List<Fiction> getStatusByCondition(FictionStatus status, Pager pager) {
        return fictionDao.getStatusByCondition(status, pager);
    }

    public List<Fiction> getTypeStatusByCondition(FictionType type,FictionStatus status, Pager pager) {
        return fictionDao.getTypeStatusByCondition(type,status, pager);
    }

    public Fiction getOne(int id,Pager pager,int orderBy){
        return fictionDao.getOne(id,pager,orderBy);
    }

    public List<Fiction> getMoreByTitle(String title,Pager pager){
        List<Fiction> fictions = fictionDao.getMoreByTitle("%" + title + "%",pager);

        List<Integer> fictionIds = new ArrayList<>();
        for (int i = 0; i < fictions.size(); i++) {
            fictionIds.add(fictions.get(i).getId());
        }

        List<Chapter> chapters = chapterDao.getLatest(fictionIds);
        for (Chapter chapter : chapters) {
            for (Fiction fiction : fictions) {
                if(chapter.getFiction().getId() == fiction.getId()){
                    fiction.setLatest(chapter);
                }
            }
        }
        return fictions;
    }

    public int getTotalByTypeStatus(FictionType type,FictionStatus status, Pager pager){
        return fictionDao.getTotalByTypeStatus(type, status, pager);
    }

    public int getTotalByType(FictionType type, Pager pager){
        return fictionDao.getTotalByType(type,pager);
    }

    public int getTotalByStatus(FictionStatus status, Pager pager){
        return fictionDao.getTotalByStatus(status,pager);
    }

}
