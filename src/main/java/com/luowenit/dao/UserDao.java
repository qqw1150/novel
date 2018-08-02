package com.luowenit.dao;

import com.luowenit.domain.Fiction;
import com.luowenit.domain.User;
import com.luowenit.domain.UserFiction;
import com.luowenit.domain.mapper.UserMapper;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.HashMap;
import java.util.List;
import java.util.Objects;

@Repository
public class UserDao {
    @Autowired
    private SqlSessionFactory factory;

    public User addOne(User user){
        SqlSession session = factory.openSession();
        UserMapper mapper = session.getMapper(UserMapper.class);

        User u = mapper.getOneByUserName(user.getUsername());
        if(!Objects.isNull(u)){
           return null;
        }

        mapper.addOne(user);
        session.commit();
        session.close();
        return user;

    }

    public User getOneByUsername(String username){
        if(Objects.isNull(username) || "".equals(username)){
            return null;
        }

        SqlSession session = factory.openSession();
        UserMapper mapper = session.getMapper(UserMapper.class);
        User u = mapper.getOneByUserName(username);
        session.commit();
        session.close();
        return u;
    }

    public User login(User user){
        SqlSession session = factory.openSession();
        UserMapper mapper = session.getMapper(UserMapper.class);
        User u = mapper.login(user);
        session.commit();
        session.close();
        return u;
    }


    public UserFiction getShelf(int user_id, int fiction_id, int chapter_id, int chapter_num) {
        SqlSession session = factory.openSession();
        UserMapper mapper = session.getMapper(UserMapper.class);
        HashMap<String, Object> params = new HashMap<>();
        params.put("user_id",user_id);
        params.put("fiction_id",fiction_id);
        params.put("chapter_id",chapter_id);
        params.put("chapter_num",chapter_num);
        UserFiction uf = mapper.getShelf(params);
        session.commit();
        session.close();
        return uf;
    }

    public List<UserFiction> getShelfs(int user_id) {
        SqlSession session = factory.openSession();
        UserMapper mapper = session.getMapper(UserMapper.class);
        List<UserFiction> uf = mapper.getShelfs(user_id);
        session.commit();
        session.close();
        return uf;
    }

    public void addShelf(int user_id, int fiction_id, int chapter_id, int chapter_num) {
        SqlSession session = factory.openSession();
        UserMapper mapper = session.getMapper(UserMapper.class);
        HashMap<String, Object> params = new HashMap<>();
        params.put("user_id",user_id);
        params.put("fiction_id",fiction_id);
        params.put("chapter_id",chapter_id);
        params.put("chapter_num",chapter_num);
        mapper.addShelf(params);
        session.commit();
        session.close();
    }

    public void updateShelf(int user_id, int fiction_id, int chapter_id, int chapter_num) {
        SqlSession session = factory.openSession();
        UserMapper mapper = session.getMapper(UserMapper.class);
        HashMap<String, Object> params = new HashMap<>();
        params.put("user_id",user_id);
        params.put("fiction_id",fiction_id);
        params.put("chapter_id",chapter_id);
        params.put("chapter_num",chapter_num);
        mapper.updateShelf(params);
        session.commit();
        session.close();
    }
}
