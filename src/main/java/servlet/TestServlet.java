package servlet;

import bean.Article;
import dao.impl.BaseDaoImpl;
import org.json.JSONObject;
import service.ArticleService;
import utils.R;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

/**
 * @author Jason
 * @version 1.0
 * @date 6/14/2020 3:26 PM
 */
@WebServlet("/test.do")
public class TestServlet extends HttpServlet {
    //private ArticleService service=new ArticleService();
    private BaseDaoImpl dao=new BaseDaoImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    protected void  getArticleList(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
//        List<Object> objectList = dao.getObjectList(Article.class, R.MYSQL.MYSQL_SQL_SYNTAX_QUERY_ARTICLE_NOT_ARTICLE_CONTENT, new Object[]{});
//        HashMap<String, Object> map = new HashMap<>();
//        map.put("total",100);
//        map.put("rows",objectList);
//        JSONObject jsonObject = new JSONObject(map);
//
//        response.getWriter().write(jsonObject.toString());
    }
}
