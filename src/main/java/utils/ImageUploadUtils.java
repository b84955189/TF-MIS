package utils;

import java.io.IOException;
import java.util.Properties;

import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;
import com.qiniu.util.Base64;
import com.qiniu.util.StringMap;
import com.qiniu.util.UrlSafeBase64;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;

/**
 * @author CSDN
 * @version 1.0
 * @date 6/19/2020 8:33 AM
 */
public class ImageUploadUtils {
    // 设置需要操作的账号的AK和SK
    private static String ACCESS_KEY;
    private static String SECRET_KEY;
    // 要上传的空间
    private static String BUCKET_NAME;
    //空间自定义域名
    private static String DOMAIN_URL;
    //上传地址--不同地区的url不一样 此处的为 华南地区上传url
    private static String UPLOAD_RUL;
    //图片设置样式
    private static String IMAGE_STYLE;



    //静态代码块初始化
    static {
        try {
            Properties properties = new Properties();
            properties.load(ImageUploadUtils.class.getClassLoader().getResourceAsStream("qiniu.properties"));
            ACCESS_KEY = properties.getProperty(R.QI_NIU_CONFIG.ACCESS_KEY,"");
            SECRET_KEY = properties.getProperty(R.QI_NIU_CONFIG.SECRET_KEY,"");
            UPLOAD_RUL = properties.getProperty(R.QI_NIU_CONFIG.UPLOAD_RUL,"");
            BUCKET_NAME = properties.getProperty(R.QI_NIU_CONFIG.BUCKET_NAME,"");
            DOMAIN_URL = properties.getProperty(R.QI_NIU_CONFIG.DOMAIN_URL,"");
            IMAGE_STYLE = properties.getProperty(R.QI_NIU_CONFIG.IMAGE_STYLE,"");
        }catch (Exception e){
            e.printStackTrace();
        }



    }
    // 密钥l
    private static final Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);

    public String getUpToken() {
        return auth.uploadToken(BUCKET_NAME, null, 3600, new StringMap().put("insertOnly", 1));
    }
    // 普通上传
    public String upload(String filePath, String fileName) throws IOException {
        // 创建上传对象
        UploadManager uploadManager = new UploadManager();
        try {
            // 调用put方法上传
            String token = auth.uploadToken(BUCKET_NAME);
            if(CommonUtils.isEmpty(token)) {
                System.out.println("未获取到token，请重试！");
                return null;
            }
            Response res = uploadManager.put(filePath, fileName, token);
            // 打印返回的信息
            System.out.println(res.bodyString());
            if (res.isOK()) {
                Ret ret = res.jsonToObject(Ret.class);
                //如果不需要对图片进行样式处理，则使用以下方式即可
                return DOMAIN_URL + ret.key;
                //return DOMAIN + ret.key + "?" + style;
            }
        } catch (QiniuException e) {
            Response r = e.response;
            // 请求失败时打印的异常的信息
            System.out.println(r.toString());
            try {
                // 响应的文本信息
                System.out.println(r.bodyString());
            } catch (QiniuException e1) {
                // ignore
            }
        }
        return null;
    }


    //base64方式上传
    public String put64image(byte[] base64, String key) throws Exception{
        String file64 = Base64.encodeToString(base64, 0);
        Integer l = base64.length;
        String url = UPLOAD_RUL + l + "/key/"+ UrlSafeBase64.encodeToString(key);
        //非华东空间需要根据注意事项 1 修改上传域名
        RequestBody rb = RequestBody.create(null, file64);
        Request request = new Request.Builder().
                url(url).
                addHeader("Content-Type", "application/octet-stream")
                .addHeader("Authorization", "UpToken " + getUpToken())
                .post(rb).build();
        //System.out.println(request.headers());
        OkHttpClient client = new OkHttpClient();
        okhttp3.Response response = client.newCall(request).execute();
        response.close();

        //System.out.println(response);
        //如果不需要添加图片样式，使用以下方式
        return DOMAIN_URL + key;
        //return DOMAIN + key + "?" + style;
    }


    // 普通删除(暂未使用以下方法，未测试)
    public void delete(String key) throws IOException {
        // 实例化一个BucketManager对象
        BucketManager bucketManager = new BucketManager(auth);
        // 此处的33是去掉：http://ongsua0j7.bkt.clouddn.com/,剩下的key就是图片在七牛云的名称
        key = key.substring(33);
        try {
            // 调用delete方法移动文件
            bucketManager.delete(BUCKET_NAME, key);
        } catch (QiniuException e) {
            // 捕获异常信息
            Response r = e.response;
            System.out.println(r.toString());
        }
    }

    class Ret {
        public long fsize;
        public String key;
        public String hash;
        public int width;
        public int height;
    }
}
