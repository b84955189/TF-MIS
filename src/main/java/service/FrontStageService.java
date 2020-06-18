package service;

import bean.Article;
import dao.impl.FrontStageDaoImpl;
import utils.R;

import java.sql.SQLException;

/**
 * @author Jason
 * @version 1.0
 * @date 6/17/2020 6:49 PM
 */
public class FrontStageService {
    private FrontStageDaoImpl dao=new FrontStageDaoImpl();
    /**
     * 获取带有文章内容的文章Bean
     * @author Jason
     * @date 7:02 PM 6/17/2020
     * @param
     * @return
     */
    public Article getArticle(String articleUUID) throws SQLException {
        return (Article)dao.getObject(Article.class, R.MYSQL.MYSQL_PRE_SQL_SYNTAX_QUERY_ALL_META_ARTICLE_BY_EQUAL_ARTICLE_UUID+R.MYSQL.MYSQL_PRE_SQL_SYNTAX_QUERY_ALL_META_ARTICLE_BY_EQUAL_ARTICLE_ID_WHERE_ARTICLE_STATUS,new Object[]{
                articleUUID
        });

    }
    /**
     * 文章阅读数+1
     * @author Jason
     * @date 6:56 PM 6/18/2020
     * @param oldCount 未更新阅读数
     * @param articleUUID 文章UUID
     * @return
     */
    public void increaseArticleReadCount(int oldCount,String articleUUID) throws SQLException {
        dao.update(R.MYSQL.MYSQL_PRE_SQL_SYNTAX_INCREASE_ARTICLE_READ_COUNT,new Object[]{
           ++oldCount,articleUUID
        });
    }

}
