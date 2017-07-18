package com.atguigu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.atguigu.bean.MODEL_OBJECT_T_MALL_ATTR;
import com.atguigu.bean.OBJECT_T_MALL_ATTR;
import com.atguigu.service.AttrServiceImpl;
@Controller
public class AttrController {
	@Autowired
	AttrServiceImpl attrServiceImpl;
	@RequestMapping("goto_attr_publish")
	public String goto_attr_publish() {
		return "managet_attr_publish";
	}
	@ResponseBody
	@RequestMapping("get_attr_by_class_2_id_json")
	public List<OBJECT_T_MALL_ATTR> get_attr_by_class_2_id_json(int class_2_id,String class_2_name,ModelMap map) {
		//根据二级属性名的id查询属性列表
		List<OBJECT_T_MALL_ATTR> list_attr=attrServiceImpl.get_attr_list_by_class_2_id(class_2_id);
		
		return list_attr;
	}
	@RequestMapping("get_attr_by_class_2_id")
	public String get_attr_by_class_2_id(int class_2_id,String class_2_name,ModelMap map) {
		//根据二级属性名的id查询属性列表
		List<OBJECT_T_MALL_ATTR> list_attr=attrServiceImpl.get_attr_list_by_class_2_id(class_2_id);
		map.put("list_attr", list_attr);
		map.put("class_2_id", class_2_id);
		map.put("class_2_name", class_2_name);
		
		return "managet_attr_publish_inner";
	}
	@RequestMapping("goto_attr_add")
	public String goto_attr_add(int class_2_id,String class_2_name,ModelMap map){
		map.put("class_2_id", class_2_id);
		map.put("class_2_name", class_2_name);
		return "manager_attr_publish_add";
	}
	@RequestMapping("save_attr")
	public ModelAndView save_attr(int class_2_id, String class_2_name, MODEL_OBJECT_T_MALL_ATTR list_attr,
			ModelMap map) {
		attrServiceImpl.save_attr(class_2_id,list_attr.getList_attr());
		ModelAndView modelAndView = new ModelAndView("redirect:/goto_attr_add.do");
		modelAndView.addObject("class_2_id", class_2_id);
		modelAndView.addObject("class_2_name", class_2_name);
		return modelAndView;
	}
}
