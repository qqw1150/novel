package com.luowenit.domain.mapper;

import com.luowenit.domain.Chapter;

import java.util.List;
import java.util.Map;

public interface ChapterMapper {
    int addOne(Chapter chapter);

    int addMore(List<Chapter> list);

    /**
     * 获取一个章节 （懒加载）
     * @param params
     * @return
     */
    Chapter getOne(Map<String,Object> params);

    Chapter getOneLazy(Map<String,Object> params);

    int deleteMoreByFid(int fiction_id);

    List<Chapter> getLatests(List<Integer> list);

    int getTotalByFiction(int fiction_id);
}
