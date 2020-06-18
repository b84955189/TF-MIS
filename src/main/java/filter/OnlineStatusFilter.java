package filter;

import bean.User;
import utils.R;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 在线状态过滤器
 * 阻止已登录用户重复登录。
 * @author Jason
 * @version 1.0
 * @date 6/13/2020 8:59 AM
 */
public class OnlineStatusFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request=(HttpServletRequest)servletRequest;
        HttpServletResponse response=(HttpServletResponse)servletResponse;

        //判断是否登录
        User user=(User) request.getSession().getAttribute(R.SESSION.SESSION_DATA_USER_INFO);
        if(user!=null){
            //已登录 判断用户角色 并转发至本用户界面
            switch (user.getUser_role()){
                case User.COMMON_USER:{request.getRequestDispatcher(R.GLOBAL_URL.GLOBAL_URL_COMMON_USER_PAGE).forward(request,response);};break;
                case User.ADMIN_USER:{request.getRequestDispatcher(R.GLOBAL_URL.GLOBAL_URL_ADMIN_USER_PAGE).forward(request,response);};break;
                default:{request.getRequestDispatcher(R.GLOBAL_URL.GLOBAL_URL_COMMON_USER_PAGE).forward(request,response);};break;
            }
            return;
        }
        //放行
        filterChain.doFilter(request,response);
    }

    @Override
    public void destroy() {

    }
}
