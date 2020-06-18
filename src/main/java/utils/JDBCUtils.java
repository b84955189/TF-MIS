package utils;

import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

/**
 * JDBC工具类
 * @author Jason
 * @version 1.0
 * @date 6/10/2020 11:06 AM
 */
public class JDBCUtils {


    private static DataSource dataSource;
    //保证单例
    private static ThreadLocal<Connection> threadLocal=new ThreadLocal<Connection>();
    static {
        try {
            Properties properties=new Properties();
            properties.load(JDBCUtils.class.getClassLoader().getResourceAsStream("druid.properties"));
            dataSource = DruidDataSourceFactory.createDataSource(properties);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    /**
     * 获取数据源
     * @author Jason
     * @date 9:44 PM 6/11/2020
     * @param
     * @return
     */
    public static DataSource getDataSource(){
        return dataSource;
    }
    /**
     * 获取连接
     * @author Jason
     * @date 3:02 PM 6/10/2020
     * @param
     * @return
     */
    public static Connection getConnection() throws SQLException {

        Connection connection = null;
        connection = threadLocal.get();
        if(connection==null){
            connection=dataSource.getConnection();
            threadLocal.set(connection);
        }
        return connection;
    }
    /**
     * 释放连接
     * @author Jason
     * @date 3:02 PM 6/10/2020
     * @param
     * @return
     */
    public static void closeConnection() throws SQLException {
        Connection connection=null;
        connection=threadLocal.get();
        if(connection!=null){
            connection.close();
        }
        threadLocal.remove();
    }

    public static void main(String[] args) throws SQLException {
        System.out.println(JDBCUtils.getConnection().getClass());
    }
}
