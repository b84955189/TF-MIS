package service;

import bean.User;
import dao.impl.UserDapImpl;
import utils.R;

import java.sql.SQLException;

/**
 * User 服务层
 * @author Jason
 * @version 1.0
 * @date 6/11/2020 10:17 PM
 */
public class UserService {
    private UserDapImpl dao=new UserDapImpl();
    /**
     * 获取数据库User对象
     * @author Jason
     * @date 6:16 AM 6/12/2020
     * @param  user 封装查询条件的User对象
     * @return
     */
    public User getUser(User user) throws SQLException {
        return (User) dao.getObject(User.class, R.MYSQL.MYSQL_PRE_SQL_SYNTAX_QUERY_SINGLE_USER,
                new Object[]{user.getUser_login(),user.getUser_pass(),user.getUser_role()});
    }
}
