package bean.json;

import lombok.Data;
import lombok.ToString;

/**
 * @author Jason
 * @version 1.0
 * @date 6/19/2020 10:16 AM
 */
@ToString
@Data
public class ImageUploadStatus {

    /**
     * success : 0 | 1
     * message : 提示的信息，上传成功或上传失败及错误信息等。
     * url : 图片地址
     */
    public static final int SUCCESS_STATUS=1;
    public static final int FAIL_STATUS=0;
    private int success;
    private String message;
    private String url;

}
