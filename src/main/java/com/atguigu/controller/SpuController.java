package com.atguigu.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.service.SupServiceImpl;
import com.atguigu.util.MyUploadUtil;

@Controller
public class SpuController {
	@Autowired
	SupServiceImpl supServiceImpl;
	
	@RequestMapping("goto_spu_publish")
	public String goto_spu_publish(){
		return "manager_spu_publish";
	}
	@RequestMapping("save_spu")
	public String save_spu(T_MALL_PRODUCT spu,@RequestParam("files")MultipartFile[] files){
		
		// 上传文件，返回文件地址
		List<String> list_image = MyUploadUtil.image_upload(files);
		// 发布spu业务
		spu.setShp_tp(list_image.get(0));
		supServiceImpl.save_spu(spu, list_image);
		
		return "redirect:/index.do?useto=spu_publish&url=goto_spu_publish";
	}
}
