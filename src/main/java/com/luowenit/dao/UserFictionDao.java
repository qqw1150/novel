package com.luowenit.dao;

import com.luowenit.domain.UserFiction;
import com.luowenit.domain.assist.Pager;
import com.luowenit.domain.mapper.UserFictionMapper;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.transaction.Transaction;
import org.apache.ibatis.transaction.jdbc.JdbcTransactionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class UserFictionDao {

    @Autowired
    private SqlSessionFactory sqlSessionFactory;
    @Autowired
    private JdbcTransactionFactory jdbcTransactionFactory;

    public List<UserFiction> getAllByUser(int userId,Pager pager) {
        int total = getAllByUserTotal(userId);
        pager.setTotal(total);
        SqlSession session = sqlSessionFactory.openSession();
        UserFictionMapper mapper = session.getMapper(UserFictionMapper.class);
        HashMap<String, Object> params = new HashMap<>();
        params.put("userId",userId);
        params.put("pager",pager);
        List<UserFiction> userFictions = mapper.getAllByUser(params);
        session.commit();
        session.close();
        return userFictions;
    }



    public int getAllByUserTotal(int userId){
        SqlSession session = sqlSessionFactory.openSession();
        UserFictionMapper mapper = session.getMapper(UserFictionMapper.class);
        int total = mapper.getTotalByUser(userId);
        session.commit();
        session.close();
        return total;
    }

    public UserFiction getTop(int userId){
        SqlSession session = sqlSessionFactory.openSession();
        UserFictionMapper mapper = session.getMapper(UserFictionMapper.class);
        UserFiction userFiction = mapper.getTop(userId);
        session.commit();
        session.close();
        return userFiction;
    }

    public void setTop(int userId,int id) {
        try {
            int count = 0;
            SqlSession session = sqlSessionFactory.openSession();
            Transaction transaction = jdbcTransactionFactory.newTransaction(session.getConnection());
            UserFictionMapper mapper = session.getMapper(UserFictionMapper.class);
            mapper.cloesTop(userId);


            count = mapper.openTop(id);
            if (count == 0) {
                transaction.rollback();
            } else {
                session.commit();
            }

            session.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void cancelTop(int userId) {
        SqlSession session = sqlSessionFactory.openSession();
        UserFictionMapper mapper = session.getMapper(UserFictionMapper.class);
        mapper.cloesTop(userId);
        session.commit();
        session.close();
    }

    public void deleteOne(int userId,int id){
        SqlSession session = sqlSessionFactory.openSession();
        UserFictionMapper mapper = session.getMapper(UserFictionMapper.class);
        HashMap<String,Object> params = new HashMap<>();
        params.put("userId", userId);
        params.put("id", id);
        mapper.deleteById(params);
        session.commit();
        session.close();
    }
}
