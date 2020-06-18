package dao.impl;

import dao.inter.BaseDaoInter;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import utils.JDBCUtils;

import java.sql.SQLException;
import java.util.List;

/**
 * 基础Dao实现类
 * @author Jason
 * @version 1.0
 * @date 6/11/2020 9:59 PM
 */
public class BaseDaoImpl implements BaseDaoInter {
    /**
     * 获取任意对象
     * 结果Bean需要强转
     * @param beanType  Java Bean 类型
     * @param sqlSyntax SQL语句
     * @param params    查询参数
     * @return
     * @author Jason
     * @date 9:57 PM 6/11/2020
     */
    @Override
    public Object getObject(Class beanType, String sqlSyntax, Object[] params) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
        return queryRunner.query(sqlSyntax,new BeanHandler(beanType),params);
    }

    /**
     * 获取任意对象集合
     * 注意：JSONObject是采用反射的机制获取get方法，然后再获取参数值的。所以在使用JSONObject处理结果集合时可以
     * 不必下转型。可以查看JSONObject的实现源代码。上转型类.getClass()==实例类型
     * @param  beanType Java Bean 类型
     * @param  sqlSyntax SQL语句
     * @param  params 查询参数
     * @return
     * @author Jason
     * @date 8:57 PM 6/13/2020
     */
    @Override
    public List<Object> getObjectList(Class beanType, String sqlSyntax, Object[] params) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
        return queryRunner.query(sqlSyntax,new BeanListHandler<Object>(beanType),params);
    }


    /**
     * 数据库更新操作
     * QueryRunner的update方法参数底层依旧是使用JDBC的setObject方法设置参数.setObject方法内部会通过instance of判断这个参数到底是哪个类型的具体对象，从而调用相应类型的set方法。
     * @param sqlSyntax SQL语句
     * @param params    参数
     * @return
     * @author Jason
     * @date 9:29 AM 6/14/2020
     */
    @Override
    public boolean update(String sqlSyntax, Object[] params) throws SQLException {
        boolean sign=false;
        QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
        if(queryRunner.update(sqlSyntax,params)>0){
            sign=true;
        }
        return sign;
    }

    /**
     * 获取查询数目
     *
     * @param sqlSyntax SQL 语句
     * @param params 查询限制参数
     * @return
     * @author Jason
     * @date 7:26 PM 6/15/2020
     */
    @Override
    public long getCount(String sqlSyntax, Object[] params) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
        return queryRunner.query(sqlSyntax,new ScalarHandler<Long>(),params);
    }
}
