package com.luowenit.domain.mapper;

import com.luowenit.domain.User;

public interface UserMapper {

    int addOne(User user);

    User login(User user);
}
