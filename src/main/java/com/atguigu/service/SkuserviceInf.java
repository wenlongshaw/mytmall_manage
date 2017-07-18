package com.atguigu.service;

import java.util.List;

import com.atguigu.bean.OBJECT_T_MALL_ATTR;
import com.atguigu.bean.T_MALL_PRODUCT;

public interface SkuserviceInf {
	
	public List<OBJECT_T_MALL_ATTR> get_attr_list_by_class_2_id(int class_2_id);
	
	public List<T_MALL_PRODUCT> get_spu_by_class_1_class_2_tm(int class_2_id, int class_1_id, int tm_id);
}
