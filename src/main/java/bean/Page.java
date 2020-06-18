package bean;

import lombok.Data;
import lombok.ToString;

/**
 * Page Bean 分页
 * @author Jason
 * @version 1.0
 * @date 6/15/2020 10:55 AM
 */
@ToString
@Data
public class Page {
    //偏移量
    private int limit;
    //起始位置
    private int offset;
    //页码
    private int page;
    //排序规则
    private String sortOrder;
    //查找类型
    private String searchType;
    //查找片段
    private String snippet;

}
