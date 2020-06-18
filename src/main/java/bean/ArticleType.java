package bean;

import lombok.Data;
import lombok.ToString;

/**
 * 文章类别 Bean
 * @author Jason
 * @version 1.0
 * @date 6/13/2020 8:24 PM
 */
@ToString
@Data
public class ArticleType {
    private int article_type_id;
    private String article_type_name;
}
