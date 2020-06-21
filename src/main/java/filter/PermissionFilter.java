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
 * 用户权限过滤器
 * 阻止非管理员角色用户访问管理模块。
 * 仅限制普通用户。
 * @author Jason
 * @version 1.0
 * @date 6/13/2020 9:26 AM
 */
public class PermissionFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request=(HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        User user=(User) request.getSession().getAttribute(R.SESSION.SESSION_DATA_USER_INFO);
        String method = request.getParameter(R.REQUEST.REQUEST_METHOD);
        try{
            //获取文章分页数据
            if(R.GLOBAL_SERVLET_INFO.ARTICLE_SERVLET.ARTICLE_SERVLET_URL_PATTERN.equals(request.getServletPath())&&R.GLOBAL_SERVLET_INFO.ARTICLE_SERVLET.ARTICLE_SERVLET_METHOD_TO_GET_ARTICLE_LIST_JSON.equals(method)){

                //放行
                filterChain.doFilter(servletRequest,servletResponse);
                return;

            }else if(R.GLOBAL_SERVLET_INFO.ARTICLE_SERVLET.ARTICLE_SERVLET_URL_PATTERN.equals(request.getServletPath())&&R.GLOBAL_SERVLET_INFO.ARTICLE_SERVLET.ARTICLE_SERVLET_METHOD_TO_GET_ARTICLE_TYPES.equals(method)) {
                //放行
                filterChain.doFilter(servletRequest,servletResponse);
                return;
            }else if (User.COMMON_USER == user.getUser_role()) {
                //判断用户角色
                //如果为普通用户，则跳转回该用户首页。
                request.getRequestDispatcher(R.GLOBAL_URL.GLOBAL_URL_COMMON_USER_PAGE).forward(servletRequest, servletResponse);
                return;
            }
        }catch (Exception e){
            //如果存在异常，则跳转门户首页。
           response.sendRedirect(request.getContextPath()+R.GLOBAL_URL.GLOBAL_URL_INDEX_PAGE);
           return;
        }

        //放行
        filterChain.doFilter(servletRequest,servletResponse);
    }

    @Override
    public void destroy() {

    }
}
