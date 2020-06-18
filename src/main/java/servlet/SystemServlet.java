package servlet;

import utils.R;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author Jason
 * @version 1.0
 * @date 6/12/2020 7:34 PM
 */
@WebServlet("/systemAction.do")
public class SystemServlet extends BaseServlet{

    /**
     * 用户登出
     * @author Jason
     * @date 7:59 PM 6/12/2020
     * @param
     * @return
     */
    protected void toLogout(HttpServletRequest request,HttpServletResponse response) throws IOException {
        HttpSession session=request.getSession(false);
        if(session!=null){
            //销毁Session
            session.invalidate();
        }
        //返回主页面
        response.sendRedirect(request.getContextPath()+R.GLOBAL_URL.GLOBAL_URL_INDEX_PAGE);
    }
    /**
     * 管理View转发
     * @author Jason
     * @date 7:39 PM 6/12/2020
     * @param
     * @return
     */
    protected void toAdminUserView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher(R.GLOBAL_URL.GLOBAL_URL_ADMIN_USER_PAGE).forward(request,response);
    }
    /**
     * 普通用户后台View转发
     * @author Jason
     * @date 7:39 PM 6/12/2020
     * @param
     * @return
     */
    protected void toCommonUserView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher(R.GLOBAL_URL.GLOBAL_URL_COMMON_USER_PAGE).forward(request,response);
    }
    /**
     * 获取Menu导航
     * @author Jason
     * @date 7:57 PM 6/12/2020
     * @param  
     * @return 
     */
    
    /**
     * 获取用户数据
     * @author Jason
     * @date 7:57 PM 6/12/2020
     * @param  
     * @return 
     */
}
