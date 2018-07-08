package com.luowenit.domain.type;

import com.luowenit.domain.assist.ReadStatus;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ReadStatusHandler implements TypeHandler<ReadStatus> {

    @Override
    public void setParameter(PreparedStatement preparedStatement, int i, ReadStatus readStatus, JdbcType jdbcType) throws SQLException {
        preparedStatement.setInt(i,readStatus.getIndex().intValue());
    }

    @Override
    public ReadStatus getResult(ResultSet resultSet, String s) throws SQLException {
        return ReadStatus.fromIndex(resultSet.getInt(s));
    }

    @Override
    public ReadStatus getResult(ResultSet resultSet, int i) throws SQLException {
        return ReadStatus.fromIndex(resultSet.getInt(i));
    }

    @Override
    public ReadStatus getResult(CallableStatement callableStatement, int i) throws SQLException {
        return ReadStatus.fromIndex(callableStatement.getInt(i));
    }
}
