package com.luowenit.domain.mapper;

import com.luowenit.domain.User;
import com.luowenit.domain.UserFiction;

import java.util.HashMap;
import java.util.List;

public interface UserMapper {

    int addOne(User user);

    User login(User user);

    User getOneByUserName(String username);

    List<UserFiction> getShelfs(int user_id);

    UserFiction getShelf(HashMap<String, Object> params);

    void addShelf(HashMap<String, Object> userFiction);

    void updateShelf(HashMap<String, Object> userFiction);
}
