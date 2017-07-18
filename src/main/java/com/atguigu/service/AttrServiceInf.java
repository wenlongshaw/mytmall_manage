package com.atguigu.service;

import java.util.List;

import com.atguigu.bean.OBJECT_T_MALL_ATTR;

public interface AttrServiceInf {
	public List<OBJECT_T_MALL_ATTR> get_attr_list_by_class_2_id(int class_2_id);
	
	public void save_attr(int class_2_id, List<OBJECT_T_MALL_ATTR> list);
}
