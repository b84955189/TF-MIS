package utils;

import com.sun.xml.internal.messaging.saaj.util.ByteOutputStream;

import java.io.IOException;
import java.io.InputStream;

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
    /**
     * 检测字符串是否为空
     * @author Jason
     * @date 8:39 AM 6/19/2020
     * @param
     * @return
     */
    public static boolean isEmpty(String str){
        return str.trim().equals("");
    }
    /**
     * 将输入流转为字节数组
     * @author Jason
     * @date 9:49 AM 6/19/2020
     * @param
     * @return
     */
    public static byte[] toByteArray(InputStream in) throws IOException {
        ByteOutputStream byteOutputStream = new ByteOutputStream();
        byte[] bytes = new byte[1024];
        int len=0;
        while ((len=in.read(bytes))!=-1){
             byteOutputStream.write(bytes,0,len);
        }
        return  byteOutputStream.toByteArray();
    }
}
