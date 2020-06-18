package servlet;

import bean.User;
import service.UserService;
import top.lking.captcha.Captcha;
import utils.R;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author Jason
 * @version 1.0
 * @date 6/11/2020 10:15 PM
 */
@WebServlet(urlPatterns = {"/loginAction.do","/admin"})
public class LoginServlet extends BaseServlet{
    private UserService service=new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        switch (req.getServletPath()){
            case R.GLOBAL_SERVLET_INFO.LOGIN_SERVLET.LOGIN_SERVLET_URL_PATTERN:{doPost(req,resp);};break;
            case R.GLOBAL_SERVLET_INFO.LOGIN_SERVLET.ADMIN_SERVLET_URL_PATTERN:{req.getRequestDispatcher(R.GLOBAL_URL.GLOBAL_URL_LOGIN_PAGE).forward(req,resp);};break;
            default:{doPost(req,resp);};break;
        }
    }

    /**
     * 获取验证码
     * @author Jason
     * @date 10:16 PM 6/11/2020
     * @param
     * @return
     */
    protected void toGetCaptcha(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //验证码构造器
        Captcha captcha = new Captcha();
        //输出至客户端
        ImageIO.write(captcha.getRoundCaptcha(),"jpg",response.getOutputStream());
        //将其字符串形式储存至session
        request.getSession(true).setAttribute(R.SESSION.SESSION_FIELD_CAPTCHA,captcha.getCaptchaStringCode());
    }
    /**
     * 登录验证
     * @author Jason
     * @date 10:17 PM 6/11/2020
     * @param
     * @return
     */
    protected void toLogin(HttpServletRequest request,HttpServletResponse response) throws IOException {
        //获取请求参数
        String userLogin=request.getParameter(R.REQUEST.REQUEST_FIELD_USER_LOGIN);
        String userPass=request.getParameter(R.REQUEST.REQUEST_FIELD_USER_PASS);
        String userRole=request.getParameter(R.REQUEST.REQUEST_FIELD_USER_ROLE);
        String requestCaptcha=request.getParameter(R.REQUEST.REQUEST_FIELD_CAPTCHA);
        try{
            //判断验证码是否正确
            String sessionCaptcha=(String) request.getSession().getAttribute(R.SESSION.SESSION_FIELD_CAPTCHA);
            if(sessionCaptcha.equalsIgnoreCase(requestCaptcha)){
                //封装查询
                User user = new User();
                user.setUser_login(userLogin);
                user.setUser_pass(userPass);
                user.setUser_role(Integer.parseInt(userRole));

                User resultUser=service.getUser(user);
                //判断用户是否存在
                if(resultUser!=null){
                    //保存用户信息Bean 记录登录状态
                    request.getSession().setAttribute(R.SESSION.SESSION_DATA_USER_INFO,resultUser);
                    switch (resultUser.getUser_role()){
                        case User.COMMON_USER:{response.getWriter().write(R.RESPONSE.RESPONSE_RESULT_STATUS_COMMON_USER_SUCCESS);};break;
                        case User.ADMIN_USER:{response.getWriter().write(R.RESPONSE.RESPONSE_RESULT_STATUS_ADMIN_USER_SUCCESS);};break;
                        default:{response.getWriter().write(R.RESPONSE.RESPONSE_RESULT_STATUS_COMMON_USER_SUCCESS);};break;
                    }
                }else{
                    response.getWriter().write(R.RESPONSE.RESPONSE_RESULT_STATUS_ACCOUNT_ERROR);
                }
            }else{
                response.getWriter().write(R.RESPONSE.RESPONSE_RESULT_STATUS_CAPTCHA_ERROR);
            }

        }catch (Exception e){
            response.getWriter().write(R.RESPONSE.RESPONSE_RESULT_STATUS_UNKNOWN_ERROR);
        }



    }
}
