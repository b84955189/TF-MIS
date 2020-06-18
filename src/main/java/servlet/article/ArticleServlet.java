package servlet.article;

import bean.Article;
import bean.Page;
import bean.User;
import org.apache.commons.beanutils.BeanUtils;
import org.json.JSONObject;
import service.ArticleService;
import servlet.BaseServlet;
import utils.CommonUtils;
import utils.R;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 创作中心
 * 文章管理
 * @author Jason
 * @version 1.0
 * @date 6/13/2020 11:05 AM
 */
@WebServlet("/articleAction.do")
public class ArticleServlet extends BaseServlet {
    private ArticleService service=new ArticleService();
    /**
     * 转发至文章管理View
     * @author Jason
     * @date 11:09 AM 6/13/2020
     * @param
     * @return
     */
    protected void toArticleManagementView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher(R.GLOBAL_URL.GLOBAL_URL_ARTICLE_MANAGEMENT_PAGE).forward(request,response);
    }
    /**
     * 转发至EditorMDView
     * @author Jason
     * @date 5:26 PM 6/13/2020
     * @param
     * @return
     */
    protected void toEditorMDView(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {

        /*TODO: restructure to editor view method,fix article_id  can't save to request attribute filed.*/
        HttpSession session = request.getSession();
        String intention=request.getParameter(R.REQUEST.REQUEST_FILED_OPEN_EDITOR_INTENTION);
        String articleID=request.getParameter(R.REQUEST.REQUEST_FILED_ARTICLE_ID);
        if(intention!=null){
            switch (intention){
                case R.REQUEST.REQUEST_FILED_OPEN_EDITOR_INTENTION_POST_ARTICLE:{session.setAttribute(R.REQUEST.REQUEST_FILED_OPEN_EDITOR_INTENTION,R.REQUEST.REQUEST_FILED_OPEN_EDITOR_INTENTION_POST_ARTICLE);session.setAttribute(R.REQUEST.REQUEST_FILED_ARTICLE_ID,0);};break;
                case R.REQUEST.REQUEST_FILED_OPEN_EDITOR_INTENTION_EDIT_ARTICLE:{session.setAttribute(R.REQUEST.REQUEST_FILED_OPEN_EDITOR_INTENTION,R.REQUEST.REQUEST_FILED_OPEN_EDITOR_INTENTION_EDIT_ARTICLE);session.setAttribute(R.REQUEST.REQUEST_FILED_ARTICLE_ID,articleID);};break;
                default:{request.setAttribute(R.REQUEST.REQUEST_FILED_OPEN_EDITOR_INTENTION,R.REQUEST.REQUEST_FILED_OPEN_EDITOR_INTENTION_POST_ARTICLE);};break;
            }
        }else{
            //默认目的---发布文章
            session.setAttribute(R.REQUEST.REQUEST_FILED_OPEN_EDITOR_INTENTION,R.REQUEST.REQUEST_FILED_OPEN_EDITOR_INTENTION_POST_ARTICLE);
        }
        request.getRequestDispatcher(R.GLOBAL_URL.GLOBAL_URL_EDITOR_MD_PAGE).forward(request,response);
    }
    /**
     * 获取文章类型数据
     * @author Jason
     * @date 8:18 PM 6/13/2020
     * @param
     * @return
     */
    protected void toGetArticleTypes(HttpServletRequest request,HttpServletResponse response) throws IOException, SQLException {
        try {
            List<Object> articleTypes = service.getArticleTypes();
            HashMap<String, List> stringListHashMap = new HashMap<>();
            stringListHashMap.put(R.JSON.JSON_FILED_DATA,articleTypes);
            //转为JSON格式返回
            JSONObject jsonObject = new JSONObject(stringListHashMap);

            response.getWriter().write(jsonObject.toString());
        }catch (Exception e){
            response.getWriter().write(R.JSON.JSON_GLOBAL_FAIL_RESULT);
        }
    }
    /**
     * 文章发布
     * @author Jason
     * @date 10:23 AM 6/14/2020
     * @param
     * @return
     */
    protected void toPostArticle(HttpServletRequest request,HttpServletResponse response) throws IOException {
        //封装Bean ----Start
        Enumeration<String> parameterNames = request.getParameterNames();
        Article article = new Article();
        JSONObject jsonObject = new JSONObject();
        try{
            while(parameterNames.hasMoreElements()){
                String name=parameterNames.nextElement();
                String value=request.getParameter(name);
                BeanUtils.setProperty(article,name,value);
            }
            //设置文章UUID
            article.setArticle_uuid(String.valueOf(new Date().getTime()));
            //封装Bean ----End

            //获取操作用户对象
            User author=(User) request.getSession(false).getAttribute(R.SESSION.SESSION_DATA_USER_INFO);
            //判断用户角色
            if(User.ADMIN_USER==author.getUser_role()){
                //管理员用户直接发布文章
                article.setArticle_status(Article.PASS_STATUS);
            }else if(User.COMMON_USER==author.getUser_role()){
                //普通用户 待审核状态
                article.setArticle_status(Article.NOT_PASS_STATUS);
            }else{
                //默认 待审核
                article.setArticle_status(Article.NOT_PASS_STATUS);
            }
            //服务层处理
            boolean result=service.postArticle(article,author);
            //判断发布情况
            if (result){
                /*TODO:return article url etc.*/
                //test
                jsonObject.put(R.JSON.JSON_STATUS_CODE,R.JSON.JSON_STATUS_CODE_200);
                jsonObject.put(R.JSON.JSON_STATUS_MESSAGE,R.RESPONSE.RESPONSE_RESULT_EDITOR_OPERATION_ARTICLE_SUCCESS);
                jsonObject.put(R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_UUID,article.getArticle_uuid());
            }else {
                //test
                jsonObject.put(R.JSON.JSON_STATUS_CODE,R.JSON.JSON_STATUS_CODE_500);
                jsonObject.put(R.JSON.JSON_STATUS_MESSAGE,R.RESPONSE.RESPONSE_RESULT_EDITOR_OPERATION_ARTICLE_FAILED);
                jsonObject.put(R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_UUID,0);
            }
            response.getWriter().write(jsonObject.toString());
        }catch (Exception e){
            e.printStackTrace();
            //test
            jsonObject.put(R.JSON.JSON_STATUS_CODE,R.JSON.JSON_STATUS_CODE_500);
            jsonObject.put(R.JSON.JSON_STATUS_MESSAGE,R.RESPONSE.RESPONSE_RESULT_EDITOR_OPERATION_ARTICLE_FAILED);
            jsonObject.put(R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_UUID,0);
            response.getWriter().write(jsonObject.toString());
        }

    }

    /**
     * 获取JSON格式的文章集合数据---分页
     * @author Jason
     * @date 8:06 AM 6/15/2020
     * @param
     * @return
     */
    protected void toGetArticleListJSON(HttpServletRequest request,HttpServletResponse response) throws IOException, SQLException {
        Enumeration<String> parameterNames = request.getParameterNames();
        //封装 Page Bean --Start
        Page page = new Page();
        try {
            while(parameterNames.hasMoreElements()){
                String name=parameterNames.nextElement();
                String value=request.getParameter(name);
                BeanUtils.setProperty(page,name,value);
            }
            //封装 Page Bean --End
            //服务层提取数据
            Map<String, Object> articles = service.getArticles(page);
            JSONObject jsonObject = new JSONObject(articles);
            response.getWriter().write(jsonObject.toString());
        }catch (Exception e){
            e.printStackTrace();
            response.getWriter().write(R.JSON.JSON_GLOBAL_FAIL_RESULT);
        }



    }
    /**
     * 获取文章信息
     * @author Jason
     * @date 10:54 AM 6/16/2020
     * @param
     * @return
     */
    protected void toGetArticle(HttpServletRequest request,HttpServletResponse response) throws IOException {

            String articleIDString=request.getParameter(R.REQUEST.REQUEST_FILED_ARTICLE_ID);
            try{
                int articleID=Integer.parseInt(articleIDString);
                Article article = service.getArticle(articleID);
                if(article!=null){
                    JSONObject jsonObject = new JSONObject(article);
                    response.getWriter().write(jsonObject.toString());
                }else {
                    /*TODO: add a better json failed status.*/
                    response.getWriter().write("access_fail");
                }
            }catch (Exception e){
                e.printStackTrace();
                response.getWriter().write("access_fail");
            }


    }

    /**
     * 删除文章
     * @author Jason
     * @date 10:09 PM 6/15/2020
     * @param
     * @return
     */
    protected void toDeleteArticles(HttpServletRequest request,HttpServletResponse response) throws IOException {

        //获取参数
        String[] ids = request.getParameterValues(R.REQUEST.REQUEST_FILED_IDS+"[]");
        try{
            boolean result = service.deleteArticle(CommonUtils.convertStringNumberArray(ids));
            if(!result){
                //返回失败信息
                response.getWriter().write(R.RESPONSE.RESPONSE_RESULT_DELETE_ARTICLE_FAILED);
                return;
            }
            //返回成功信息
            response.getWriter().write(R.RESPONSE.RESPONSE_RESULT_DELETE_ARTICLE_SUCCESS);
        }catch (Exception e){
            e.printStackTrace();
            //返回失败信息
            response.getWriter().write(R.RESPONSE.RESPONSE_RESULT_DELETE_ARTICLE_FAILED);
        }



    }
    /**
     * 修改更新文章
     * @author Jason
     * @date 4:44 PM 6/16/2020
     * @param
     * @return
     */
    protected void toUpdateArticle(HttpServletRequest request,HttpServletResponse response) throws IOException {
        Enumeration<String> parameterNames = request.getParameterNames();
        //封装Bean --Start
        Article article = new Article();
        JSONObject jsonObject = new JSONObject();
        try {
            while(parameterNames.hasMoreElements()){
                String name=parameterNames.nextElement();
                String value=request.getParameter(name);
                BeanUtils.setProperty(article,name,value);
            }
            //封装Bean --End
            boolean result=service.updateArticle(article);
            //判断更新情况
            if (result){
                /*TODO:return article url etc.*/
                //test
                jsonObject.put(R.JSON.JSON_STATUS_CODE,R.JSON.JSON_STATUS_CODE_200);
                jsonObject.put(R.JSON.JSON_STATUS_MESSAGE,R.RESPONSE.RESPONSE_RESULT_EDITOR_OPERATION_ARTICLE_SUCCESS);
            }else {
                //test
                jsonObject.put(R.JSON.JSON_STATUS_CODE,R.JSON.JSON_STATUS_CODE_500);
                jsonObject.put(R.JSON.JSON_STATUS_MESSAGE,R.RESPONSE.RESPONSE_RESULT_EDITOR_OPERATION_ARTICLE_FAILED);
            }
            response.getWriter().write(jsonObject.toString());
        }catch (Exception e){
            e.printStackTrace();
            //test
            jsonObject.put(R.JSON.JSON_STATUS_CODE,R.JSON.JSON_STATUS_CODE_500);
            jsonObject.put(R.JSON.JSON_STATUS_MESSAGE,R.RESPONSE.RESPONSE_RESULT_EDITOR_OPERATION_ARTICLE_FAILED);
            response.getWriter().write(jsonObject.toString());
        }


    }
    /**
     * 修改文章状态
     * @author Jason
     * @date 10:48 AM 6/17/2020
     * @param
     * @return
     */
    protected void toChangeArticleStatus(HttpServletRequest request,HttpServletResponse response) throws IOException {
        //获取参数
        String[] parameterValues = request.getParameterValues(R.REQUEST.REQUEST_FILED_IDS + "[]");
        String requestParameter = request.getParameter(R.REQUEST.REQUEST_FILED_SIGN);
        try {
            //整型转置
            Integer[] ids = CommonUtils.convertStringNumberArray(parameterValues);
            int sign = Integer.parseInt(requestParameter);
            //转至服务层操作
            boolean result = service.changeArticleStatus(ids,sign);
            if (result){
                response.getWriter().write(R.RESPONSE.RESPONSE_RESULT_CHANGE_ARTICLE_STATUS_SUCCESS);
            }else {
                response.getWriter().write(R.RESPONSE.RESPONSE_RESULT_CHANGE_ARTICLE_STATUS_FAILED);
            }

        }catch (Exception e){
            e.printStackTrace();
            response.getWriter().write(R.RESPONSE.RESPONSE_RESULT_CHANGE_ARTICLE_STATUS_FAILED);
        }

    }

}
