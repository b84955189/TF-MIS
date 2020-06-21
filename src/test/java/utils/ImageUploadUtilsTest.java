package utils;

import org.junit.Test;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Date;

/**
 * @author Jason
 * @version 1.0
 * @date 6/19/2020 9:06 AM
 */
public class ImageUploadUtilsTest {
    @Test
    public void testPut64image() throws Exception {
        ImageUploadUtils imageUploadUtils = new ImageUploadUtils();
        File file = new File("C:\\Users\\liulong\\Pictures\\Camera Roll\\0.jpg");
        System.out.println(file.exists());
        byte[] bytes = CommonUtils.toByteArray(new FileInputStream(file));
        String s = imageUploadUtils.put64image(bytes, String.valueOf(new Date().getTime()));
        System.out.println(s);

    }
}
