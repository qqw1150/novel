package com.luowenit.domain.type;

import com.luowenit.domain.assist.FictionStatus;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class FictionStatusHandler implements TypeHandler<FictionStatus> {
    @Override
    public void setParameter(PreparedStatement preparedStatement, int i, FictionStatus fictionStatus, JdbcType jdbcType) throws SQLException {
        preparedStatement.setInt(i,fictionStatus.getIndex().intValue());
    }

    @Override
    public FictionStatus getResult(ResultSet resultSet, String s) throws SQLException {
        return FictionStatus.fromIndex(resultSet.getInt(s));
    }

    @Override
    public FictionStatus getResult(ResultSet resultSet, int i) throws SQLException {
        return FictionStatus.fromIndex(resultSet.getInt(i));
    }

    @Override
    public FictionStatus getResult(CallableStatement callableStatement, int i) throws SQLException {
        return FictionStatus.fromIndex(callableStatement.getInt(i));
    }
}
