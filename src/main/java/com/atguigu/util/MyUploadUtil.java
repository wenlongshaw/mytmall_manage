package com.atguigu.util;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.springframework.web.multipart.MultipartFile;

public class MyUploadUtil {

	public static List<String> image_upload(MultipartFile[] files) {
		String basePath=getMyProperties("windows_path");
		ArrayList<String> list_image = new ArrayList<String>();
		for(int i=0;i<files.length;i++){
		    String image_name =	System.currentTimeMillis()+files[i].getOriginalFilename();
		    list_image.add(image_name);
		    String image_name_path = basePath+"\\"+image_name;
		    try {
				files[i].transferTo(new File(image_name_path));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list_image;
	}

	
	public static String getMyProperties(String key){
		Properties properties = new Properties();
		InputStream inputStream = MyUploadUtil.class.getClassLoader()
						.getResourceAsStream("pathResource.properties");
		try {
			properties.load(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String property = properties.getProperty(key);
		return property;
	}
}
