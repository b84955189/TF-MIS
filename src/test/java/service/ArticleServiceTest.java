package service;

import org.junit.Assert;
import org.junit.Test;

import java.sql.SQLException;

/**
 * @author Jason
 * @version 1.0
 * @date 6/13/2020 10:15 PM
 */
public class ArticleServiceTest {
    @Test
    public void testGetArticleTypes() throws SQLException {
        ArticleService articleService = new ArticleService();
        articleService.getArticleTypes();


    }
}
