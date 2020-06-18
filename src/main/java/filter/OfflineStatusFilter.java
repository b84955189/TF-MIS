package filter;

import bean.User;
import utils.R;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 离线状态过滤器
 * 阻止未登录用户操作。
 * @author Jason
 * @version 1.0
 * @date 6/13/2020 8:05 AM
 */
public class OfflineStatusFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request=(HttpServletRequest)servletRequest;
        HttpServletResponse response=(HttpServletResponse)servletResponse;

        //判断是否登录
        User user=(User) request.getSession().getAttribute(R.SESSION.SESSION_DATA_USER_INFO);
        if(user==null){
            //未登录 跳转至登录页
            response.sendRedirect(request.getContextPath()+R.GLOBAL_SERVLET_INFO.LOGIN_SERVLET.ADMIN_SERVLET_URL_PATTERN);
            return;
        }
        //放行
        filterChain.doFilter(request,response);
    }

    @Override
    public void destroy() {

    }
}
