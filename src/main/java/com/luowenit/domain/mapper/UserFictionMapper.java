package com.luowenit.domain.mapper;

import com.luowenit.domain.Chapter;
import com.luowenit.domain.UserFiction;

import java.util.HashMap;
import java.util.List;

public interface UserFictionMapper {
    List<UserFiction> getAllByUser(HashMap<String,Object> params);

    int openTop(int id);
    int cloesTop(int userId);

    int getTotalByUser(int userId);

    UserFiction getTop(int userId);

    int deleteById(HashMap<String,Object> params);

}
