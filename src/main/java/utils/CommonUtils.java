package utils;

/**
 * 一般工具类
 * @author Jason
 * @version 1.0
 * @date 6/15/2020 9:30 PM
 */
public class CommonUtils {
    /**
     * 根据参数值数量，动态变更预编译语句Option数目
     * @author Jason
     * @date 9:32 PM 6/15/2020
     * @param sqlSyntax SQL 语句
     * @param params 参数数组
     * @return 返回结果SQL语句
     */
    public static String appendSQLSyntaxOption(String sqlSyntax,Object[] params){
        StringBuffer stringBuffer = new StringBuffer(sqlSyntax);
        stringBuffer.append("(");

        for(int i=0;i<params.length-1;i++){
            stringBuffer.append("?,");
        }
        stringBuffer.append("?");
        stringBuffer.append(")");



        return stringBuffer.toString();
    }
    /**
     * 转换字符串数字数组
     * @author Jason
     * @date 8:49 AM 6/16/2020
     * @param stringNumberArray 字符串形式的数字数组
     * @exception 抛出 NumberFormatException
     * @return 整形结果数组
     */
    public static Integer[] convertStringNumberArray(String[] stringNumberArray) throws NumberFormatException{
        Integer[] resultArray=new Integer[stringNumberArray.length];
        for(int i=0;i<stringNumberArray.length;i++){
            resultArray[i]=Integer.parseInt(stringNumberArray[i]);
        }
        return resultArray;
    }
}
