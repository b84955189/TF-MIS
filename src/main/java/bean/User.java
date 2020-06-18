package bean;

import lombok.Data;
import lombok.ToString;

/**
 * User Bean
 * @author Jason
 * @version 1.0
 * @date 6/11/2020 7:54 PM
 */
@Data
@ToString
public class User {
    //普通用户
    public static final int COMMON_USER=1;
    //管理员用户
    public static final int ADMIN_USER=2;

    private int user_id;
    private String user_login;
    private String user_pass;
    private String user_email;
    private String user_register_time;
    private String display_name;
    private String user_head_url;
    private int user_role;
}
