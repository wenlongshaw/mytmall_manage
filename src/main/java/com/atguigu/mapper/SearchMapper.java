package com.atguigu.mapper;

import java.util.HashMap;
import java.util.List;

import com.atguigu.bean.OBJECT_T_MALL_SKU;
import com.atguigu.bean.T_MALL_VALUE;

public interface SearchMapper {

	List<OBJECT_T_MALL_SKU> select_sku_by_class_2(HashMap<String, Object> hashMap);

	List<OBJECT_T_MALL_SKU> select_sku_by_class_2_attr_value(HashMap<String, Object> hashMap);

	List<T_MALL_VALUE> select_value_by_attr_id(Integer attr_id);

}
