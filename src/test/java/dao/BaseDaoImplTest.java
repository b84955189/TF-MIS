package dao;

import bean.Article;
import bean.ArticleType;
import bean.User;
import dao.impl.BaseDaoImpl;
import org.json.JSONObject;
import org.junit.Assert;
import org.junit.Test;
import utils.R;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

/**
 * @author Jason
 * @version 1.0
 * @date 6/12/2020 6:36 AM
 */
public class BaseDaoImplTest {
    BaseDaoImpl baseDao = new BaseDaoImpl();
    @Test
    public void testGetObject() throws SQLException {

        baseDao.getObject(User.class,"SELECT * FROM tim_user WHERE user_login=? AND user_pass=? AND user_role=?;",
                new Object[]{"admin","123",2});
    }
    @Test
    public void testGetObjectList() throws SQLException {

        baseDao.getObjectList(ArticleType.class,"SELECT * FROM tim_article_type;",new Object[]{});
        HashMap<String, List> stringListHashMap = new HashMap<>();
        //List<Object> objectList = baseDao.getObjectList(ArticleType.class, "SELECT * FROM tim_article_type;", new Object[]{});
        List<Object> objectList = baseDao.getObjectList(Article.class, "SELECT * FROM tim_article;", new Object[]{});

        stringListHashMap.put("testData",objectList);
        JSONObject jsonObject=new JSONObject(stringListHashMap);

        System.out.println(jsonObject.toString());
        System.out.println(objectList);
    }
    @Test
    public void testUpdate() throws SQLException {
        Article article = new Article();
        article.setArticle_author("test");
        article.setArticle_content("我爱我的祖国");
        article.setArticle_title("祖国");
        article.setArticle_type(1);
        Boolean result=baseDao.update(R.MYSQL.MYSQL_PRE_SQL_SYNTAX_UPDATE_ARTICLE,new Object[]{
            article.getArticle_title(),article.getArticle_content(),article.getArticle_type(),67
        });
        Assert.assertEquals(true,result);
    }
    @Test
    public void testGetCount() throws SQLException {
        Object[] params = {

        };
        long result=baseDao.getCount("SELECT COUNT(*) FROM tim_article WHERE article_title LIKE ?",new Object[]{true});
        Assert.assertEquals(10,result);
    }
    @Test
    public void testChangeArticleStatus() throws SQLException {
//        boolean update = baseDao.update(R.MYSQL.MYSQL_PRE_SQL_SYNTAX_CHANGE_ARTICLE_STATUS, new Object[]{
//                1, 71
//        });
//        Assert.assertEquals(true,update);
    }

}
