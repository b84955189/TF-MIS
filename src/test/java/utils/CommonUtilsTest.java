package utils;

import org.junit.Test;

/**
 * @author Jason
 * @version 1.0
 * @date 6/15/2020 9:39 PM
 */
public class CommonUtilsTest {
    @Test
    public void testAppendSQLSyntaxOption(){
        System.out.println(CommonUtils.appendSQLSyntaxOption(R.MYSQL.MYSQL_PRE_SQL_SYNTAX_DELETE_ARTICLE,new Object[3]));
    }
    @Test
    public void testConvertStringNumberArray(){
        Integer[] integers = CommonUtils.convertStringNumberArray(new String[]{"1", "3"});
        for(int a:integers){
            System.out.println(a);
        }
    }
}
