package servlet;

import bean.json.ImageUploadStatus;
import org.json.JSONObject;
import utils.CommonUtils;
import utils.ImageUploadUtils;
import utils.R;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.util.Date;

/**
 * @author Jason
 * @version 1.0
 * @date 6/19/2020 8:26 AM
 */
@MultipartConfig
@WebServlet("/imageUploadAction.do")
public class ImageUploadServlet extends BaseServlet{
    /**
     * 上传图片
     * @author Jason
     * @date 8:30 AM 6/19/2020
     * @param
     * @return
     */
    protected void toUploadImage(HttpServletRequest request, HttpServletResponse response) throws IOException {
        /*TODO: restructure this method! add image size and type check limit.*/
        ImageUploadStatus imageUploadStatus = new ImageUploadStatus();
        try{
            Part part = request.getPart(R.REQUEST.REQUEST_FILED_EDITOR_INSERT_IMAGE_FILED_NAME);
            if(part==null){
                throw new Exception("null error");
            }
            //test ----should add a service check
            byte[] imageBytes = CommonUtils.toByteArray(part.getInputStream());
            ImageUploadUtils imageUploadUtils = new ImageUploadUtils();
            String url = imageUploadUtils.put64image(imageBytes, String.valueOf(new Date().getTime()));

            imageUploadStatus.setSuccess(ImageUploadStatus.SUCCESS_STATUS);
            imageUploadStatus.setMessage("Success");
            imageUploadStatus.setUrl(url);


        }catch (Exception e){
            e.printStackTrace();
            imageUploadStatus.setSuccess(ImageUploadStatus.FAIL_STATUS);
        }
        JSONObject jsonObject = new JSONObject(imageUploadStatus);
        response.getWriter().write(jsonObject.toString());


    }
}
