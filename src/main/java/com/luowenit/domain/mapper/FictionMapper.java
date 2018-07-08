package com.luowenit.domain.mapper;

import com.luowenit.domain.Fiction;
import com.luowenit.domain.assist.FictionStatus;
import com.luowenit.domain.assist.FictionType;
import com.luowenit.domain.assist.Pager;
import org.apache.ibatis.annotations.One;

import java.util.List;
import java.util.Map;

public interface FictionMapper {

    /**
     * 添加一本小说
     * @param fiction
     * @return 受影响个数
     */
    int addOne(Fiction fiction);

    /**
     * 添加多本小说
     * @param list
     * @return 受影响个数
     */
    int addMore(List<Fiction> list);

    /**
     * 最近更新
     * @param count
     * @return
     */
    List<Fiction> getLatests(int count);

    /**
     * 获取热门推荐的小说
     * @param count
     * @return
     */
    List<Fiction> getHots(int count);

    /**
     * 获取分类最热
     * @param params
     * @return
     */
    List<Fiction> getTypesHots(Map<String,Object> params);

    /**
     * 获取各日期的排行榜
     * @param params
     * @return
     */
    List<Fiction> getSortedByDate(Map<String,Object> params);

    /**
     * 按条件获取分类
     * @param params
     * @return
     */
    List<Fiction> getTypeByCondition(Map<String,Object> params);

    /**
     * 按条件获取状态
     * @param params
     * @return
     */
    List<Fiction> getStatusByCondition(Map<String,Object> params);

    /**
     * 按条件获取时间
     * @param params
     * @return
     */
    List<Fiction> getDateByCondition(Map<String,Object> params);

    /**
     * 根据id获取fiction
     * @param id
     * @return
     */
    Fiction getOne(int id);

    /**
     * 获取一个ficiton
     * @param params
     * @return
     */
    Fiction getOne(Map<String,Object> params);

    /**
     * 根据id获取fiction （懒加载）
     * @param id
     * @return
     */
    Fiction getOneLazy(int id);

    int deleteOne(int id);

    int getTotalByType(Map<String,Object> params);

    int getTotalByStatus(Map<String,Object> params);

    List<Fiction> getTypeStatusByCondition(Map<String,Object> params);

    int getTotalByTypeStatus(Map<String,Object> params);

    List<Fiction> getMoreByTitle(Map<String,Object> params);

    int getTotalByTitle(Map<String,Object> params);

}
