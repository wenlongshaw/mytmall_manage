package com.atguigu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
//此处做了修改
@Controller
public class IndexController {
	@RequestMapping("index")
	public String index(String useto,String url,ModelMap map){
		map.put("useto", useto);
		map.put("url", url);
		return "manager_index";
	}
}
