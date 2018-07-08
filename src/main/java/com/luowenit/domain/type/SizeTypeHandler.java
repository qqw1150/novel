package com.luowenit.domain.type;

import com.luowenit.domain.assist.Size;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SizeTypeHandler implements TypeHandler<Size> {


    @Override
    public void setParameter(PreparedStatement preparedStatement, int i, Size size, JdbcType jdbcType) throws SQLException {
        preparedStatement.setDouble(i,size.getSize());
    }

    @Override
    public Size getResult(ResultSet resultSet, String s) throws SQLException {
        return new Size(resultSet.getLong(s));
    }

    @Override
    public Size getResult(ResultSet resultSet, int i) throws SQLException {
        return new Size(resultSet.getLong(i));
    }

    @Override
    public Size getResult(CallableStatement callableStatement, int i) throws SQLException {
        return new Size(callableStatement.getLong(i));
    }
}
