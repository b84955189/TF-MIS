package service;

import bean.User;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.sql.SQLException;

/**
 * @author Jason
 * @version 1.0
 * @date 6/12/2020 6:45 AM
 */
public class UserServiceTest {
    @Before
    public void init(){
        System.out.println("老子开始测试了！");
    }
    @Test
    public void testGetUser() throws SQLException {
        UserService userService = new UserService();
        User user = new User();
        user.setUser_login("admin");
        user.setUser_pass("123");
        user.setUser_role(User.ADMIN_USER);
        userService.getUser(user);
    }
    @After
    public void close(){
        System.out.println("老子测试完了！");
    }
}
