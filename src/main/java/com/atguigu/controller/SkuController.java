package com.atguigu.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.bean.MODEL_T_MALL_SKU_ATTR_VALUE;
import com.atguigu.bean.OBJECT_T_MALL_ATTR;
import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.bean.T_MALL_SKU;
import com.atguigu.bean.T_MALL_SKU_ATTR_VALUE;
import com.atguigu.service.SkuServiceImpl;

@Controller
public class SkuController {
	@Autowired
	SkuServiceImpl skuServiceImpl;
	@RequestMapping("goto_sku_publish")
	public String goto_sku_publish(){
		return "manager_sku_publish";
	}
	
	@RequestMapping("get_sku_by_class_2_id")
	public String get_sku_by_class_2_id(int class_2_id, ModelMap map){
		List<OBJECT_T_MALL_ATTR> list_attr = skuServiceImpl.get_attr_list_by_class_2_id(class_2_id);
		map.put("list_attr", list_attr);
		return "manager_sku_publish_attr_inner";
	}
	@ResponseBody
	@RequestMapping("get_spu_by_class_1_class_2_tm")
	public List<T_MALL_PRODUCT> get_spu_by_class_1_class_2_tm(int class_2_id,int class_1_id,int tm_id){
		List<T_MALL_PRODUCT> list_spu = skuServiceImpl.get_spu_by_class_1_class_2_tm(class_2_id, class_1_id, tm_id);
		return list_spu;
	}
	@RequestMapping("add_sku")
	public String add_sku(int shp_id,T_MALL_SKU sku,MODEL_T_MALL_SKU_ATTR_VALUE list_sku_attr_value){
		List<T_MALL_SKU_ATTR_VALUE> list_attr_value = new ArrayList<T_MALL_SKU_ATTR_VALUE>();
		for(int i=0;i<list_sku_attr_value.getList_sku_attr_value().size();i++){
			if(list_sku_attr_value.getList_sku_attr_value().get(i).getShxm_id()!=0){
				T_MALL_SKU_ATTR_VALUE t_MALL_SKU_ATTR_VALUE = new T_MALL_SKU_ATTR_VALUE();
				t_MALL_SKU_ATTR_VALUE.setShxm_id(list_sku_attr_value.getList_sku_attr_value().get(i).getShxm_id());
				t_MALL_SKU_ATTR_VALUE.setShxzh_id(list_sku_attr_value.getList_sku_attr_value().get(i).getShxzh_id());
				t_MALL_SKU_ATTR_VALUE.setShp_id(shp_id);
				list_attr_value.add(t_MALL_SKU_ATTR_VALUE);
			}
		}
		
		skuServiceImpl.add_sku(list_attr_value,sku);
		return "redirect:/goto_sku_publish.do";
	}
	
}
