package servlet;

import bean.Article;
import org.json.JSONObject;
import service.FrontStageService;
import utils.R;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 前台Servlet
 * @author Jason
 * @version 1.0
 * @date 6/17/2020 5:17 PM
 */
@WebServlet("/frontStageAction.do")
public class FrontStageServlet extends BaseServlet{
    private FrontStageService service=new FrontStageService();
    /**
     * 转发至文章详情页
     * @author Jason
     * @date 5:18 PM 6/17/2020
     * @param
     * @return
     */
    protected void toArticleDetailView(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String articleUUID = request.getParameter(R.REQUEST.REQUEST_FILED_ARTICLE_UUID);
        try{
            if(articleUUID.trim().equals("")) {
                throw new Exception("uuid error");
            }
            request.setAttribute(R.REQUEST.REQUEST_FILED_ARTICLE_UUID,articleUUID);
            request.getRequestDispatcher(R.GLOBAL_URL.GLOBAL_URL_ARTICLE_DETAIL_PAGE).forward(request,response);
        }catch (Exception e){
            e.printStackTrace();
            response.sendRedirect(request.getContextPath()+R.GLOBAL_URL.GLOBAL_URL_INDEX_PAGE);
        }
    }
    /**
     * 获取文章
     * @author Jason
     * @date 6:46 PM 6/17/2020
     * @param
     * @return
     */
    protected void toGetArticle(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String articleUUID = request.getParameter(R.REQUEST.REQUEST_FILED_ARTICLE_UUID);
        try{
            if(articleUUID.trim().equals("")) {
                throw new Exception("uuid error");
            }
            Article article = service.getArticle(articleUUID);
            if(article==null){
                response.getWriter().write(R.RESPONSE.RESPONSE_RESULT_GET_ARTICLE_FAILED);
                return;
            }
            //文章阅读数+1
            service.increaseArticleReadCount(article.getArticle_read_count(),article.getArticle_uuid());
            article.setArticle_read_count(article.getArticle_read_count()+1);
            JSONObject jsonObject = new JSONObject(article);
            response.getWriter().write(jsonObject.toString());
        }catch (Exception e){
            e.printStackTrace();
            response.getWriter().write(R.RESPONSE.RESPONSE_RESULT_GET_ARTICLE_FAILED);
        }
    }

}
