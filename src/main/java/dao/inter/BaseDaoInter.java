package dao.inter;

import java.sql.SQLException;
import java.util.List;

/**
 * 基础Dao接口
 * @author Jason
 * @version 1.0
 * @date 6/11/2020 8:12 PM
 */
public interface BaseDaoInter {
    /**
     * 获取任意对象
     * @author Jason
     * @date 9:57 PM 6/11/2020
     * @param  beanType Java Bean 类型
     * @param  sqlSyntax SQL语句
     * @param  params 查询参数
     * @return
     */
    Object getObject(Class beanType,String sqlSyntax,Object[] params) throws SQLException;
    /**
     * 获取任意对象集合
     * @author Jason
     * @date 8:57 PM 6/13/2020
     * @param  beanType Java Bean 类型
     * @param  sqlSyntax SQL语句
     * @param  params 查询参数
     * @return
     */
    List<Object> getObjectList(Class beanType,String sqlSyntax,Object[] params) throws SQLException;
    /**
     * 数据库更新操作
     * @author Jason
     * @date 9:29 AM 6/14/2020
     * @param  sqlSyntax SQL语句
     * @param params 参数
     * @return 更新状态
     */
    boolean update(String sqlSyntax,Object[] params) throws SQLException;
    /**
     * 获取查询数目
     * @author Jason
     * @date 7:26 PM 6/15/2020
     * @param
     * @return
     */
    long getCount(String sqlSyntax,Object[] params) throws SQLException;
}
