package bean;

import lombok.Data;
import lombok.ToString;

/**
 * 文章 Bean
 * @author Jason
 * @version 1.0
 * @date 6/13/2020 8:25 PM
 */
@ToString
@Data
public class Article {
    //已通过审核状态
    public static final int PASS_STATUS=2;
    //未通过审核状态
    public static final int NOT_PASS_STATUS=1;

    private int article_id;
    private String article_title;
    private int article_type;
    private String article_content;
    private String article_summary;
    private int article_read_count;
    private String article_author;
    private String article_release_time;
    private String article_poster;
    private int article_status;
    private String article_uuid;
}
