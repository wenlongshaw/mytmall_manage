package com.atguigu.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.bean.OBJECT_T_MALL_ATTR;
import com.atguigu.mapper.AttrMapper;
@Service
public class AttrServiceImpl implements AttrServiceInf{
	@Autowired
	AttrMapper attrMapper;

	@Override
	public List<OBJECT_T_MALL_ATTR> get_attr_list_by_class_2_id(int class_2_id) {
		List<OBJECT_T_MALL_ATTR> list_attr_value = attrMapper.select_attr_list_by_class_2_id(class_2_id);
		
		return list_attr_value;
	}
	
	public void save_attr(int class_2_id, List<OBJECT_T_MALL_ATTR> list_attr) {
		for(int i=0;i<list_attr.size();i++){
			OBJECT_T_MALL_ATTR object_T_MALL_ATTR = list_attr.get(i);
			object_T_MALL_ATTR.setFlbh2(class_2_id);
			attrMapper.insert_attr(object_T_MALL_ATTR);
			HashMap<String,Object> hashMap = new HashMap<String,Object>();
			hashMap.put("shxm_id", object_T_MALL_ATTR.getId());
			hashMap.put("class_2_id", class_2_id);
			hashMap.put("list_value", object_T_MALL_ATTR.getList_value());
			attrMapper.inset_values(hashMap);
		}
		
	}
	
	
}
