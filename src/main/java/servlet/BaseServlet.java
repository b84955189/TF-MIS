package servlet;

import utils.R;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;

/**
 * 基础Servlet类
 * @author Jason
 * @version 1.0
 * @date 6/10/2020 10:20 AM
 */
public class BaseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String methodName=req.getParameter(R.REQUEST.REQUEST_METHOD);
        try{
            Method method=this.getClass().getDeclaredMethod(methodName,HttpServletRequest.class,HttpServletResponse.class);
            //获取非公共方法调用权限
            method.setAccessible(true);
            //调用
            method.invoke(this,req,resp);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
