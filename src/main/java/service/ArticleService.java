package service;

import bean.Article;
import bean.ArticleType;
import bean.Page;
import bean.User;
import dao.impl.ArticleDaoImpl;
import org.json.JSONObject;
import utils.CommonUtils;
import utils.R;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Article 服务层
 * @author Jason
 * @version 1.0
 * @date 6/13/2020 9:54 PM
 */
public class ArticleService {
    private ArticleDaoImpl dao=new ArticleDaoImpl();

    /**
     * 获取文章类别数据
     * @author Jason
     * @date 10:06 PM 6/13/2020
     * @param
     * @return 文章类型数据集合
     */
    public List<Object> getArticleTypes() throws SQLException {
        return dao.getObjectList(ArticleType.class, R.MYSQL.MYSQL_SQL_SYNTAX_QUERY_ARTICLE_TYPES, new Object[]{});
    }
    /**
     * 发布文章
     * @author Jason
     * @date 10:27 AM 6/14/2020
     * @param
     * @return
     */
    public boolean postArticle(Article article, User author) throws SQLException {

        return dao.update(R.MYSQL.MYSQL_PRE_SQL_SYNTAX_INSERT_ARTICLE,new Object[]{
                article.getArticle_title(),
                article.getArticle_type(),
                article.getArticle_content(),
                author.getUser_login(),
                article.getArticle_summary(),
                article.getArticle_uuid(),
                article.getArticle_status(),
                article.getArticle_poster()
        });
    }
    /**
     * 获取文章数据 集合
     * @author Jason
     * @date 4:48 PM 6/15/2020
     * @param  page 分页Bean
     * @return
     */
    public Map<String,Object> getArticles(Page page) throws SQLException {
        /*TODO: fix order option.*/
        long total=0;
        List<Object> list = new ArrayList<>();
        HashMap<String, Object> stringObjectHashMap = new HashMap<>();
        if(R.MYSQL.MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_TITLE.equalsIgnoreCase(page.getSearchType())){
            //标题-模糊查询检索
            if(page.getSnippet().trim().equals("")){
                list.addAll(dao.getObjectList(Article.class,R.MYSQL.MYSQL_PRE_SQL_SYNTAX_QUERY_ARTICLE_NOT_ARTICLE_CONTENT_BY_LIKE_ARTICLE_TITLE+R.MYSQL.MYSQL_SQL_SYNTAX_ORDER_BY+" "+page.getSort()+" "+page.getSortOrder()+" "+R.MYSQL.MYSQL_PER_SQL_LIMIT_TWO,new Object[]{
                        page.getOffset(), page.getLimit()
                }));
                total=dao.getCount(R.MYSQL.MYSQL_PRE_SQL_SYNTAX_QUERY_ARTICLE_BY_LIKE_ARTICLE_TITLE_QUERY_COUNT,new Object[]{});
            }else{
                list.addAll(dao.getObjectList(Article.class,R.MYSQL.MYSQL_PRE_SQL_SYNTAX_QUERY_ARTICLE_NOT_ARTICLE_CONTENT_BY_LIKE_ARTICLE_TITLE+R.MYSQL.MYSQL_PRE_SQL_SYNTAX_QUERY_ARTICLE_NOT_ARTICLE_CONTENT_BY_LIKE_ARTICLE_TITLE_WHERE_SYNTAX+R.MYSQL.MYSQL_SQL_SYNTAX_ORDER_BY+" "+page.getSort()+" "+page.getSortOrder()+" "+R.MYSQL.MYSQL_PER_SQL_LIMIT_TWO,new Object[]{
                        "%"+page.getSnippet()+"%",page.getOffset(), page.getLimit()
                }));
                total=dao.getCount(R.MYSQL.MYSQL_PRE_SQL_SYNTAX_QUERY_ARTICLE_BY_LIKE_ARTICLE_TITLE_QUERY_COUNT+R.MYSQL.MYSQL_PRE_SQL_SYNTAX_QUERY_ARTICLE_BY_LIKE_ARTICLE_TITLE_QUERY_COUNT_WHERE_SYNTAX,new Object[]{
                        "%"+page.getSnippet()+"%"
                });
            }


        }else if(R.MYSQL.MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_AUTHOR.equalsIgnoreCase(page.getSearchType())){
            //用户名检索
            if(page.getSnippet().trim().equals("")){
                list.addAll(dao.getObjectList(Article.class,R.MYSQL.MYSQL_PRE_SQL_SYNTAX_QUERY_ARTICLE_NOT_ARTICLE_CONTENT_BY_EQUAL_ARTICLE_AUTHOR+R.MYSQL.MYSQL_SQL_SYNTAX_ORDER_BY+" "+page.getSort()+" "+page.getSortOrder()+" "+R.MYSQL.MYSQL_PER_SQL_LIMIT_TWO,new Object[]{
                        page.getOffset(), page.getLimit()
                }));
                total=dao.getCount(R.MYSQL.MYSQL_PRE_SQL_SYNTAX_QUERY_ARTICLE_BY_EQUAL_ARTICLE_AUTHOR_QUERY_COUNT,new Object[]{});
            }else{
                list.addAll(dao.getObjectList(Article.class,R.MYSQL.MYSQL_PRE_SQL_SYNTAX_QUERY_ARTICLE_NOT_ARTICLE_CONTENT_BY_EQUAL_ARTICLE_AUTHOR+R.MYSQL.MYSQL_PRE_SQL_SYNTAX_QUERY_ARTICLE_NOT_ARTICLE_CONTENT_BY_EQUAL_ARTICLE_AUTHOR_WHERE_SYNTAX+R.MYSQL.MYSQL_SQL_SYNTAX_ORDER_BY+" "+page.getSort()+" "+page.getSortOrder()+" "+R.MYSQL.MYSQL_PER_SQL_LIMIT_TWO,new Object[]{
                        page.getSnippet(),page.getOffset(), page.getLimit()
                }));
                total=dao.getCount(R.MYSQL.MYSQL_PRE_SQL_SYNTAX_QUERY_ARTICLE_BY_EQUAL_ARTICLE_AUTHOR_QUERY_COUNT+R.MYSQL.MYSQL_PRE_SQL_SYNTAX_QUERY_ARTICLE_NOT_ARTICLE_CONTENT_BY_EQUAL_ARTICLE_AUTHOR_WHERE_SYNTAX,new Object[]{
                        page.getSnippet()
                });
            }
            //类别检索
        }else if(R.MYSQL.MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_TYPE.equalsIgnoreCase(page.getSearchType())){
            //如果没有指明类别，则检索全部---已经通过审核的
            if(page.getSnippet().trim().equals("")){
                list.addAll(dao.getObjectList(Article.class,R.MYSQL.MYSQL_PRE_SQL_SYNTAX_QUERY_ARTICLE_NOT_ARTICLE_CONTENT_BY_EQUAL_ARTICLE_TYPE+R.MYSQL.MYSQL_PRE_SQL_WHERE_ARTICLE_STATUS+R.MYSQL.MYSQL_SQL_SYNTAX_ORDER_BY+" "+page.getSort()+" "+page.getSortOrder()+" "+R.MYSQL.MYSQL_PER_SQL_LIMIT_TWO,new Object[]{
                        Article.PASS_STATUS,page.getOffset(), page.getLimit()
                }));
                total=dao.getCount(R.MYSQL.MYSQL_PRE_SQL_SYNTAX_QUERY_ARTICLE_BY_EQUAL_ARTICLE_TYPE_QUERY_COUNT+R.MYSQL.MYSQL_PRE_SQL_WHERE_ARTICLE_STATUS,new Object[]{Article.PASS_STATUS});
            }else{
                list.addAll(dao.getObjectList(Article.class,R.MYSQL.MYSQL_PRE_SQL_SYNTAX_QUERY_ARTICLE_NOT_ARTICLE_CONTENT_BY_EQUAL_ARTICLE_TYPE+R.MYSQL.MYSQL_PRE_SQL_SYNTAX_QUERY_ARTICLE_NOT_ARTICLE_CONTENT_BY_EQUAL_ARTICLE_TYPE_WHERE_SYNTAX+R.MYSQL.MYSQL_PRE_SQL_AND_ARTICLE_STATUS+R.MYSQL.MYSQL_SQL_SYNTAX_ORDER_BY+" "+page.getSort()+" "+page.getSortOrder()+" "+R.MYSQL.MYSQL_PER_SQL_LIMIT_TWO,new Object[]{
                        page.getSnippet(),Article.PASS_STATUS,page.getOffset(), page.getLimit()
                }));
                total=dao.getCount(R.MYSQL.MYSQL_PRE_SQL_SYNTAX_QUERY_ARTICLE_BY_EQUAL_ARTICLE_TYPE_QUERY_COUNT+R.MYSQL.MYSQL_PRE_SQL_SYNTAX_QUERY_ARTICLE_NOT_ARTICLE_CONTENT_BY_EQUAL_ARTICLE_TYPE_WHERE_SYNTAX+R.MYSQL.MYSQL_PRE_SQL_AND_ARTICLE_STATUS,new Object[]{
                        page.getSnippet(),Article.PASS_STATUS
                });
            }
        }else {
            //无操作
        }
        stringObjectHashMap.put(R.JSON.JSON_FILED_TABLE_PAGINATION_ROWS,list);
        stringObjectHashMap.put(R.JSON.JSON_FILED_TABLE_PAGINATION_TOTAL,total);


        return stringObjectHashMap;
    }
    /**
     * 删除文章
     * @author Jason
     * @date 8:55 AM 6/16/2020
     * @param  ids 预期删除文章ID
     * @return
     */
    public boolean deleteArticle(Integer[] ids) throws SQLException {
        //追加SQL Option
        String resultSQLSyntax = CommonUtils.appendSQLSyntaxOption(R.MYSQL.MYSQL_PRE_SQL_SYNTAX_DELETE_ARTICLE, ids);
        return dao.update(resultSQLSyntax,ids);
    }
    /**
     * 获取文章
     * @author Jason
     * @date 11:03 AM 6/16/2020
     * @param id 文章id
     * @return 返回文章Bean
     */
    public Article getArticle(int id) throws SQLException {
        return (Article) dao.getObject(Article.class,R.MYSQL.MYSQL_PRE_SQL_SYNTAX_QUERY_ALL_META_ARTICLE_BY_EQUAL_ARTICLE_ID,new Object[]{id});
    }
    /**
     * 修改更新文章
     * @author Jason
     * @date 4:48 PM 6/16/2020
     * @param
     * @return
     */
    public boolean updateArticle(Article article) throws SQLException {
        return dao.update(R.MYSQL.MYSQL_PRE_SQL_SYNTAX_UPDATE_ARTICLE,new Object[]{
                article.getArticle_title(),article.getArticle_content(),article.getArticle_type(),article.getArticle_summary(),article.getArticle_poster(),article.getArticle_id()
        });
    }
    /**
     * 更改文章状态
     * @author Jason
     * @date 2:27 PM 6/17/2020
     * @param ids 被操作文章ID
     * @param sign Article 状态操作标记
     * @return 返回操作状态
     */
    public boolean changeArticleStatus(Integer[] ids,int sign) throws Exception {
        String resultSQLSyntax=null;
        if(sign==Article.PASS_STATUS) {
            //追加SQL Syntax
            resultSQLSyntax = CommonUtils.appendSQLSyntaxOption(R.MYSQL.MYSQL_PRE_SQL_SYNTAX_CHANGE_ARTICLE_STATUS_ENABLE, ids);
        }else if(sign==Article.NOT_PASS_STATUS){
            //追加SQL Syntax
            resultSQLSyntax = CommonUtils.appendSQLSyntaxOption(R.MYSQL.MYSQL_PRE_SQL_SYNTAX_CHANGE_ARTICLE_STATUS_DISABLE, ids);
        }else{
            throw new Exception("参数错误！");
        }
        return dao.update(resultSQLSyntax, ids);
    }

}
