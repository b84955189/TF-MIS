package utils;

import bean.Article;
import com.qiniu.util.Auth;

/**
 * 全局资源信息类
 * @author Jason
 * @version 1.0
 * @date 6/10/2020 10:22 AM
 */
public class R {
    /**
     * request域信息
     * @author Jason
     * @date 10:23 AM 6/10/2020
     * @param
     * @return
     */
    public interface REQUEST{
        String REQUEST_GLOBAL_ENCODING="UTF-8";


        String REQUEST_METHOD="method";

        String REQUEST_FIELD_USER_LOGIN="user_login";
        String REQUEST_FIELD_USER_PASS="user_pass";
        String REQUEST_FIELD_USER_ROLE="user_role";
        String REQUEST_FIELD_CAPTCHA="captcha";

        String REQUEST_FILED_ARTICLE_ID="article_id";
        String REQUEST_FILED_ARTICLE_TYPE="article_type";
        String REQUEST_FILED_ARTICLE_TITLE="article_title";
        String REQUEST_FILED_ARTICLE_CONTENT="article_content";
        String REQUEST_FILED_ARTICLE_SUMMARY="article_summary";
        String REQUEST_FILED_ARTICLE_AUTHOR="article_author";
        String REQUEST_FILED_ARTICLE_POSTER="article_poster";
        String REQUEST_FILED_ARTICLE_UUID="article_uuid";

        String REQUEST_FILED_IDS="ids";
        String REQUEST_FILED_SIGN="sign";

        String REQUEST_FILED_OPEN_EDITOR_INTENTION="intention";
        String REQUEST_FILED_OPEN_EDITOR_INTENTION_POST_ARTICLE="post_article";
        String REQUEST_FILED_OPEN_EDITOR_INTENTION_EDIT_ARTICLE="edit_article";

        String REQUEST_FILED_EDITOR_INSERT_IMAGE_FILED_NAME="editormd-image-file";


    }
    /**
     * response域信息
     * @author Jason
     * @date 10:23 AM 6/10/2020
     * @param
     * @return
     */
    public interface RESPONSE{
        String RESPONSE_GLOBAL_ENCODING="UTF-8";
        String RESPONSE_GLOBAL_HTML_MIME_TYPE="text/html;charset=utf-8";
        String RESPONSE_GLOBAL_CSS_MIME_TYPE="text/css";
        String RESPONSE_GLOBAL_JAVASCRIPT_MIME_TYPE="application/javascript";
        String RESPONSE_GLOBAL_JPEG_MIME_TYPE="image/jpeg";




        //Response --- Login Status
        String RESPONSE_RESULT_STATUS_COMMON_USER_SUCCESS="common_success";
        String RESPONSE_RESULT_STATUS_ADMIN_USER_SUCCESS="admin_success";

        String RESPONSE_RESULT_STATUS_CAPTCHA_ERROR="captcha_error";
        String RESPONSE_RESULT_STATUS_ACCOUNT_ERROR="account_error";
        //String RESPONSE_RESULT_STATUS_PASSWORD_ERROR="password_error";
        String RESPONSE_RESULT_STATUS_UNKNOWN_ERROR="unknown_error";

        //Response --- Post Article Result & Update Article Result
        String RESPONSE_RESULT_EDITOR_OPERATION_ARTICLE_FAILED ="editor_operation_fail";
        String RESPONSE_RESULT_EDITOR_OPERATION_ARTICLE_SUCCESS ="editor_operation_success";

        //Response --- Delete Article Result
        String RESPONSE_RESULT_DELETE_ARTICLE_FAILED="delete_fail";
        String RESPONSE_RESULT_DELETE_ARTICLE_SUCCESS="delete_success";

        //Response --- Change Article Status Result
        String RESPONSE_RESULT_CHANGE_ARTICLE_STATUS_FAILED="change_article_status_failed";
        String RESPONSE_RESULT_CHANGE_ARTICLE_STATUS_SUCCESS="change_article_status_success";

        //Response --- Get Article Result
        String RESPONSE_RESULT_GET_ARTICLE_FAILED="get_article_failed";
        String RESPONSE_RESULT_GET_ARTICLE_SUCCESS="get_article_success";

    }
    /**
     * session域信息
     * @author Jason
     * @date 10:23 AM 6/10/2020
     * @param
     * @return
     */
    public interface SESSION{
        String SESSION_FIELD_CAPTCHA="captcha";
        String SESSION_DATA_USER_INFO="user";
    }
    /**
     * JSON Filed信息
     * @author Jason
     * @date 10:09 PM 6/13/2020
     * @param
     * @return
     */
    public interface JSON{
        String JSON_GLOBAL_FAIL_RESULT="{\"fail\":\"No-Data\"}";
        String JSON_FILED_DATA ="data";
        String JSON_STATUS_MESSAGE="msg";
        String JSON_STATUS_CODE="code";
        String JSON_STATUS_CODE_500="500";
        String JSON_STATUS_CODE_200="200";
        //Article Type
        String JSON_FILED_ARTICLE_TYPE_FILED_ARTICLE_TYPE_ID="article_type_id";
        String JSON_FILED_ARTICLE_TYPE_FILED_ARTICLE_TYPE_NAME="article_type_name";

        //Article
        String JSON_FILED_ARTICLE_FILED_ARTICLE_ID="article_id";
        String JSON_FILED_ARTICLE_FILED_ARTICLE_TITLE="article_title";
        String JSON_FILED_ARTICLE_FILED_ARTICLE_SUMMARY="article_summary";
        String JSON_FILED_ARTICLE_FILED_ARTICLE_TYPE="article_type";
        String JSON_FILED_ARTICLE_FILED_ARTICLE_CONTENT="article_content";
        String JSON_FILED_ARTICLE_FILED_ARTICLE_READ_COUNT="article_read_count";
        String JSON_FILED_ARTICLE_FILED_ARTICLE_AUTHOR="article_author";
        String JSON_FILED_ARTICLE_FILED_ARTICLE_RELEASE_TIME="article_release_time";
        String JSON_FILED_ARTICLE_FILED_ARTICLE_POSTER="article_poster";
        String JSON_FILED_ARTICLE_FILED_ARTICLE_STATUS="article_status";
        String JSON_FILED_ARTICLE_FILED_ARTICLE_UUID="article_uuid";


        //Bootstrap-Table
        String JSON_FILED_TABLE_PAGINATION_ROWS="rows";
        String JSON_FILED_TABLE_PAGINATION_TOTAL="total";




    }
    /**
     * MYSQL库信息
     * @author Jason
     * @date 6:51 AM 6/12/2020
     * @param
     * @return
     */
     public interface MYSQL{
         //Table
         String MYSQL_TABLE_TIM_USER="mis_user";
         String MYSQL_TABLE_TIM_ARTICLE="mis_article";
         String MYSQL_TABLE_TIM_ARTICLE_TYPE="mis_article_type";

         //Filed tim_user
         String MYSQL_TABLE_TIM_USER_FILED_USER_LOGIN="user_login";
         String MYSQL_TABLE_TIM_USER_FILED_USER_PASS="user_pass";
         String MYSQL_TABLE_TIM_USER_FILED_USER_ROLE="user_role";

         //Filed tim_article
         String MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_ID="article_id";
         String MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_TITLE="article_title";
         String MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_SUMMARY="article_summary";
         String MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_TYPE="article_type";
         String MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_CONTENT="article_content";
         String MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_AUTHOR="article_author";
         String MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_READ_COUNT="article_read_count";
         String MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_RELEASE_TIME="article_release_time";
         String MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_POSTER="article_poster";
         String MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_STATUS="article_status";
         String MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_UUID="article_uuid";


         //Syntax
         //String MYSQL_SQL_SYNTAX_QUERY_ARTICLE_NOT_ARTICLE_CONTENT="SELECT "+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_ID+","+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_TITLE+","+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_SUMMARY+","+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_TYPE+","+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_READ_COUNT+","+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_RELEASE_TIME+","+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_STATUS+","+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_AUTHOR+" FROM "+MYSQL_TABLE_TIM_ARTICLE+";";
         String MYSQL_SQL_SYNTAX_QUERY_ARTICLE_TYPES="SELECT * FROM "+MYSQL_TABLE_TIM_ARTICLE_TYPE+";";

         String MYSQL_PER_SQL_LIMIT_TWO=" LIMIT ?,?";
         String MYSQL_PRE_SQL_AND_ARTICLE_STATUS=" AND article_status=?";
         String MYSQL_PRE_SQL_WHERE_ARTICLE_STATUS=" WHERE article_status=?";
         String MYSQL_SQL_SYNTAX_ORDER_BY=" ORDER BY ";
         String MYSQL_SQL_DESC_ORDER=" DESC ";
         String MYSQL_SQL_ASC_ORDER=" ASC ";


         String MYSQL_PRE_SQL_SYNTAX_QUERY_ARTICLE_NOT_ARTICLE_CONTENT_BY_LIKE_ARTICLE_TITLE="SELECT "+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_ID+","+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_TITLE+","+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_SUMMARY+","+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_TYPE+","+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_READ_COUNT+","+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_RELEASE_TIME+","+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_STATUS+","+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_AUTHOR+","+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_POSTER+","+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_UUID+" FROM "+MYSQL_TABLE_TIM_ARTICLE;
         String MYSQL_PRE_SQL_SYNTAX_QUERY_ARTICLE_NOT_ARTICLE_CONTENT_BY_LIKE_ARTICLE_TITLE_WHERE_SYNTAX=" WHERE "+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_TITLE+" LIKE ?";


         String MYSQL_PRE_SQL_SYNTAX_QUERY_ARTICLE_NOT_ARTICLE_CONTENT_BY_EQUAL_ARTICLE_AUTHOR="SELECT "+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_ID+","+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_TITLE+","+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_SUMMARY+","+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_TYPE+","+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_READ_COUNT+","+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_RELEASE_TIME+","+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_STATUS+","+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_AUTHOR+","+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_POSTER+","+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_UUID+" FROM "+MYSQL_TABLE_TIM_ARTICLE;
         String MYSQL_PRE_SQL_SYNTAX_QUERY_ARTICLE_NOT_ARTICLE_CONTENT_BY_EQUAL_ARTICLE_AUTHOR_WHERE_SYNTAX=" WHERE "+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_AUTHOR+"=?";


         String MYSQL_PRE_SQL_SYNTAX_QUERY_ARTICLE_BY_LIKE_ARTICLE_TITLE_QUERY_COUNT="SELECT COUNT(*) FROM "+MYSQL_TABLE_TIM_ARTICLE;
         String MYSQL_PRE_SQL_SYNTAX_QUERY_ARTICLE_BY_LIKE_ARTICLE_TITLE_QUERY_COUNT_WHERE_SYNTAX=" WHERE "+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_TITLE+" LIKE ?";

         String MYSQL_PRE_SQL_SYNTAX_QUERY_ARTICLE_BY_EQUAL_ARTICLE_AUTHOR_QUERY_COUNT="SELECT COUNT(*) FROM "+MYSQL_TABLE_TIM_ARTICLE;
         String MYSQL_PRE_SQL_SYNTAX_QUERY_ARTICLE_BY_EQUAL_ARTICLE_AUTHOR_QUERY_COUNT_WHERE_SYNTAX=" WHERE "+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_AUTHOR+"=?";

         //------------------Front Stage----------------
        String MYSQL_PRE_SQL_SYNTAX_QUERY_ARTICLE_NOT_ARTICLE_CONTENT_BY_EQUAL_ARTICLE_TYPE="SELECT "+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_ID+","+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_TITLE+","+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_SUMMARY+","+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_TYPE+","+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_READ_COUNT+","+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_RELEASE_TIME+","+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_STATUS+","+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_AUTHOR+","+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_POSTER+","+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_UUID+" FROM "+MYSQL_TABLE_TIM_ARTICLE;
        String MYSQL_PRE_SQL_SYNTAX_QUERY_ARTICLE_NOT_ARTICLE_CONTENT_BY_EQUAL_ARTICLE_TYPE_WHERE_SYNTAX=" WHERE "+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_TYPE+"=?";
        String MYSQL_PRE_SQL_SYNTAX_QUERY_ARTICLE_BY_EQUAL_ARTICLE_TYPE_QUERY_COUNT="SELECT COUNT(*) FROM "+MYSQL_TABLE_TIM_ARTICLE;
        //-----------------------------------------------

        String MYSQL_PRE_SQL_SYNTAX_QUERY_ALL_META_ARTICLE_BY_EQUAL_ARTICLE_ID="SELECT * FROM "+MYSQL_TABLE_TIM_ARTICLE+" WHERE "+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_ID+"=?";

         String MYSQL_PRE_SQL_SYNTAX_QUERY_ALL_META_ARTICLE_BY_EQUAL_ARTICLE_UUID="SELECT * FROM "+MYSQL_TABLE_TIM_ARTICLE+" WHERE "+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_UUID+"=?";

         String MYSQL_PRE_SQL_SYNTAX_QUERY_SINGLE_USER="SELECT * FROM "+MYSQL_TABLE_TIM_USER+" WHERE "+MYSQL_TABLE_TIM_USER_FILED_USER_LOGIN+"=? AND "+MYSQL_TABLE_TIM_USER_FILED_USER_PASS+"=? AND "+MYSQL_TABLE_TIM_USER_FILED_USER_ROLE+"=?;";
         String MYSQL_PRE_SQL_SYNTAX_INSERT_ARTICLE="INSERT INTO "+MYSQL_TABLE_TIM_ARTICLE+"("+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_TITLE+","+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_TYPE+","+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_CONTENT+","+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_AUTHOR+","+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_SUMMARY+","+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_UUID+","+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_STATUS+","+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_POSTER+") VALUES(?,?,?,?,?,?,?,?);";
         String MYSQL_PRE_SQL_SYNTAX_UPDATE_ARTICLE="UPDATE "+MYSQL_TABLE_TIM_ARTICLE+" SET "+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_TITLE+"=?,"+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_CONTENT+"=?,"+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_TYPE+"=?,"+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_SUMMARY+"=?,"+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_POSTER+"=? WHERE "+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_ID+"=?";
         String MYSQL_PRE_SQL_SYNTAX_DELETE_ARTICLE="DELETE FROM "+MYSQL_TABLE_TIM_ARTICLE+" WHERE "+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_ID+" IN ";
         String MYSQL_PRE_SQL_SYNTAX_CHANGE_ARTICLE_STATUS_ENABLE="UPDATE "+MYSQL_TABLE_TIM_ARTICLE+" SET "+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_STATUS+"="+ Article.PASS_STATUS +" WHERE "+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_ID+" IN ";
         String MYSQL_PRE_SQL_SYNTAX_CHANGE_ARTICLE_STATUS_DISABLE="UPDATE "+MYSQL_TABLE_TIM_ARTICLE+" SET "+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_STATUS+"="+Article.NOT_PASS_STATUS+" WHERE "+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_ID+" IN ";
         String MYSQL_PRE_SQL_SYNTAX_INCREASE_ARTICLE_READ_COUNT="UPDATE "+MYSQL_TABLE_TIM_ARTICLE+" SET "+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_READ_COUNT+"=? WHERE "+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_UUID+"=?";
         //Front Stage
         String MYSQL_PRE_SQL_SYNTAX_QUERY_ALL_META_ARTICLE_BY_EQUAL_ARTICLE_ID_WHERE_ARTICLE_STATUS=" AND "+MYSQL_TABLE_TIM_ARTICLE_FILED_ARTICLE_STATUS+"="+Article.PASS_STATUS;
     }
     /**
      * 七牛存储配置
      * @author Jason
      * @date 10:47 PM 6/20/2020
      * @param
      * @return
      */
     public interface QI_NIU_CONFIG{

          String ACCESS_KEY="access_key";
          String SECRET_KEY="secret_key";
          String BUCKET_NAME="bucket_name";
          String DOMAIN_URL="domain_url";
          String UPLOAD_RUL="upload_url";
          String IMAGE_STYLE="image_style";
     }
    /**
     * 全局URL路径
     * 注意：在服务器端无需虚拟路径,另外注意下面开头带有'/'的URL，表示从服务器根目录开始。
     * @author Jason
     * @date 5:16 PM 6/10/2020
     * @param
     * @return
     */
     public interface GLOBAL_URL{
         //Back Stage View
         String GLOBAL_URL_INDEX_PAGE="/index.jsp";
         String GLOBAL_URL_LOGIN_PAGE="/WEB-INF/back_stage_view/login.jsp";
         String GLOBAL_URL_COMMON_USER_PAGE="/WEB-INF/back_stage_view/common_user/common.jsp";
         String GLOBAL_URL_ADMIN_USER_PAGE ="/WEB-INF/back_stage_view/admin/admin.jsp";
         String GLOBAL_URL_ARTICLE_MANAGEMENT_PAGE="/WEB-INF/back_stage_view/admin/article_creation_center/article_management.jsp";
         String GLOBAL_URL_EDITOR_MD_PAGE="/WEB-INF/back_stage_view/other/editor_md.jsp";
         String GLOBAL_URL_NAV_MENU_DATA_LIST="/WEB-INF/back_stage_view/components/nav_menu_data_list.jsp";
         String GLOBAL_URL_NAV_COMPONENT="/WEB-INF/back_stage_view/components/nav_component.jsp";
         String GLOBAL_URL_RIGHT_THEME_USER_COMPONENT="/WEB-INF/back_stage_view/components/right_theme_user_component.jsp";
         //Front Stage View
         String GLOBAL_URL_HOME_PAGE="/WEB-INF/front_stage_view/home.jsp";
         String GLOBAL_URL_ARTICLE_DETAIL_PAGE="/WEB-INF/front_stage_view/article_detail.jsp";
         String GLOBAL_URL_FRONT_STAGE_SIDEBAR_COMPONENT ="/WEB-INF/front_stage_view/components/sidebar.jsp";
         String GLOBAL_URL_FRONT_STAGE_NAVIGATION_COMPONENT="/WEB-INF/front_stage_view/components/navigation.jsp";
         String GLOBAL_URL_FRONT_STAGE_GALLERY_PAGE="/WEB-INF/front_stage_view/gallery.jsp";
         String GLOBAL_URL_FRONT_STAGE_ABOUT_ME_PAGE="/WEB-INF/front_stage_view/about_me.jsp";
         String GLOBAL_URL_WEB_FAVICON_ICON="/favicon.ico";
    }
    /**
     * 全局Servlet信息
     * URL-Pattern
     * Method
     * @author Jason
     * @date 11:25 AM 6/13/2020
     * @param
     * @return
     */
    public static class GLOBAL_SERVLET_INFO{
        /**
         * FrontStageServlet
         * @author Jason
         * @date 5:24 PM 6/17/2020
         * @param
         * @return
         */
        public interface FRONT_STAGE_SERVLET{
            String FRONT_STAGE_SERVLET_URL_PATTERN="/frontStageAction.do";
            String FRONT_STAGE_SERVLET_METHOD_TO_ARTICLE_DETAIL_VIEW="toArticleDetailView";
            String FRONT_STAGE_SERVLET_METHOD_TO_GET_ARTICLE="toGetArticle";
            //TODO: delete the Test Method.
            String FRONT_STAGE_SERVLET_METHOD_TO_POSTER_GALLERY_VIEW="toPosterGalleryView";
            String FRONT_STAGE_SERVLET_METHOD_TO_ABOUT_ME_VIEW="toAboutMeView";



        }
        /**
         * LoginServlet
         * @author Jason
         * @date 11:26 AM 6/13/2020
         * @param
         * @return
         */
        public interface LOGIN_SERVLET{
            String LOGIN_SERVLET_URL_PATTERN="/loginAction.do";
            String ADMIN_SERVLET_URL_PATTERN="/admin";

            String LOGIN_SERVLET_METHOD_TO_GET_CAPTCHA="toGetCaptcha";
            String LOGIN_SERVLET_METHOD_TO_LOGIN="toLogin";

        }
        /**
         * ArticleServlet
         * @author Jason
         * @date 3:54 PM 6/13/2020
         * @param
         * @return
         */
        public interface ARTICLE_SERVLET{
            String ARTICLE_SERVLET_URL_PATTERN="/articleAction.do";

            String ARTICLE_SERVLET_METHOD_TO_ARTICLE_MANAGEMENT_VIEW="toArticleManagementView";
            String ARTICLE_SERVLET_METHOD_TO_EDITORMD_VIEW="toEditorMDView";
            String ARTICLE_SERVLET_METHOD_TO_GET_ARTICLE_TYPES="toGetArticleTypes";
            String ARTICLE_SERVLET_METHOD_TO_POST_ARTICLE="toPostArticle";
            String ARTICLE_SERVLET_METHOD_TO_GET_ARTICLE_LIST_JSON="toGetArticleListJSON";
            String ARTICLE_SERVLET_METHOD_TO_DELETE_ARTICLES="toDeleteArticles";
            String ARTICLE_SERVLET_METHOD_TO_GET_ARTICLES="toGetArticle";
            String ARTICLE_SERVLET_METHOD_TO_UPDATE_ARTICLE="toUpdateArticle";
            String ARTICLE_SERVLET_METHOD_TO_CHANGE_ARTICLE_STATUS="toChangeArticleStatus";
            //String ARTICLE_SERVLET_METHOD_TO_INCREASE_ARTICLE_READ_COUNT="toIncreaseArticleReadCount";





        }
        /**
         * SystemServlet
         * @author Jason
         * @date 3:57 PM 6/13/2020
         * @param  
         * @return 
         */
        public interface SYSTEM_SERVLET{
            String SYSTEM_SERVLET_URL_PATTERN="/systemAction.do";

            String SYSTEM_SERVLET_METHOD_TO_LOGOUT="toLogout";
            String SYSTEM_SERVLET_METHOD_TO_ADMIN_USER_VIEW="toAdminUserView";
            String SYSTEM_SERVLET_METHOD_TO_COMMON_USER_VIEW="toCommonUserView";
        }
        /**
         * ImageUploadServlet
         * @author Jason
         * @date 8:28 AM 6/19/2020
         * @param
         * @return
         */
        public interface IMAGE_UPLOAD_SERVLET{
            String IMAGE_UPLOAD_SERVLET_URL_PATTERN="/imageUploadAction.do";
            String IMAGE_UPLOAD_SERVLET_METHOD_TO_UPLOAD_IMAGE ="toUploadImage";

        }
    }

}
