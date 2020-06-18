package filter;

import utils.R;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * 全局编码Filter
 * @author Jason
 * @version 1.0
 * @date 6/12/2020 9:59 PM
 */
public class EncodingFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        String uri=((HttpServletRequest)servletRequest).getRequestURI();
        //设置请求与响应编码
        servletRequest.setCharacterEncoding(R.REQUEST.REQUEST_GLOBAL_ENCODING);
        servletResponse.setCharacterEncoding(R.RESPONSE.RESPONSE_GLOBAL_ENCODING);
        //根据请求类型设置不同MIME类型
        if("toGetCaptcha".equals(servletRequest.getParameter(R.REQUEST.REQUEST_METHOD))){
            servletResponse.setContentType(R.RESPONSE.RESPONSE_GLOBAL_JPEG_MIME_TYPE);
        }else if(uri.endsWith(".css")){
            servletResponse.setContentType(R.RESPONSE.RESPONSE_GLOBAL_CSS_MIME_TYPE);
        }else if(uri.endsWith(".js")) {
            servletResponse.setContentType(R.RESPONSE.RESPONSE_GLOBAL_JAVASCRIPT_MIME_TYPE);
        }else{
            servletResponse.setContentType(R.RESPONSE.RESPONSE_GLOBAL_HTML_MIME_TYPE);
        }

        //放行
        filterChain.doFilter(servletRequest,servletResponse);
    }

    @Override
    public void destroy() {

    }
}
