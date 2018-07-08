package com.luowenit.domain.type;

import com.luowenit.domain.assist.FictionType;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class FictionTypeHandler implements TypeHandler<FictionType> {
    @Override
    public void setParameter(PreparedStatement preparedStatement, int i, FictionType fictionType, JdbcType jdbcType) throws SQLException {
        preparedStatement.setInt(i,fictionType.getIndex().intValue());
    }

    @Override
    public FictionType getResult(ResultSet resultSet, String s) throws SQLException {
        return FictionType.fromIndex(resultSet.getInt(s));
    }

    @Override
    public FictionType getResult(ResultSet resultSet, int i) throws SQLException {
        return FictionType.fromIndex(resultSet.getInt(i));
    }

    @Override
    public FictionType getResult(CallableStatement callableStatement, int i) throws SQLException {
        return FictionType.fromIndex(callableStatement.getInt(i));
    }
}
