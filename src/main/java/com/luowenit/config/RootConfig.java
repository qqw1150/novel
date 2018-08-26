package com.luowenit.config;

import com.luowenit.utils.http.HttpClientService;
import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.mchange.v2.c3p0.DataSources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.TransactionIsolationLevel;
import org.apache.ibatis.transaction.jdbc.JdbcTransactionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.EnvironmentAware;
import org.springframework.context.annotation.*;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.core.env.Environment;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import redis.clients.jedis.JedisPoolConfig;

import javax.sql.DataSource;
import java.beans.PropertyVetoException;

@Configuration
@ComponentScan(basePackages = {"com.luowenit.domain","com.luowenit.dao","com.luowenit.service"})
@ImportResource("classpath:applicationContext.xml")
@PropertySource(value = "classpath:db.properties")
public class RootConfig implements EnvironmentAware{
    @Autowired
    Environment environment;

    @Bean()
    public SqlSessionFactory sqlSessionFactoryBean() throws Exception {
        SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
        factoryBean.setDataSource(comboPooledDataSource());
        Resource res = new ClassPathResource("mybatis-config.xml");
        factoryBean.setConfigLocation(res);
        SqlSessionFactory factory = factoryBean.getObject();
        return factory;
    }

    @Bean
    public JdbcTransactionFactory jdbcTransactionFactory(DataSource dataSource){
        JdbcTransactionFactory factory = new JdbcTransactionFactory();
        return factory;
    }

    @Bean(destroyMethod = "close")
    public ComboPooledDataSource comboPooledDataSource() throws PropertyVetoException {
        ComboPooledDataSource dataSource = new ComboPooledDataSource();
        dataSource.setDriverClass(environment.getProperty("mysql.driver"));
        dataSource.setJdbcUrl(environment.getProperty("mysql.url"));
        dataSource.setUser(environment.getProperty("mysql.user"));
        dataSource.setPassword(environment.getProperty("mysql.pass"));
        dataSource.setInitialPoolSize(10);
        dataSource.setMaxIdleTime(30);
        dataSource.setMaxPoolSize(100);
        dataSource.setMinPoolSize(10);
        dataSource.setMaxStatements(200);
        return dataSource;
    }

    @Bean
    public PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer(){
        return new PropertySourcesPlaceholderConfigurer();
    }

    @Bean
    public HttpClientService httpClientService(){
        return new HttpClientService();
    }


    @Override
    public void setEnvironment(Environment environment) {
        this.environment = environment;
    }

}
