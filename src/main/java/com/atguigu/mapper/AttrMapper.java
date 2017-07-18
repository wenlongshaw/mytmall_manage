package com.atguigu.mapper;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.atguigu.bean.OBJECT_T_MALL_ATTR;

public interface AttrMapper {

	List<OBJECT_T_MALL_ATTR> select_attr_list_by_class_2_id(@Param("class_2_id")int class_2_id);

	void insert_attr_list_by_class_2_id(@Param("class_2_id")int class_2_id);

	void insert_attr(OBJECT_T_MALL_ATTR object_T_MALL_ATTR);

	void inset_values(HashMap<String, Object> hashMap);

	

}
