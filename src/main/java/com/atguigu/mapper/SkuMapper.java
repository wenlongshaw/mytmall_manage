package com.atguigu.mapper;

import java.util.HashMap;
import java.util.List;

import com.atguigu.bean.OBJECT_T_MALL_ATTR;
import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.bean.T_MALL_SKU;

public interface SkuMapper {

	List<OBJECT_T_MALL_ATTR> select_attr_list_by_class_2_id(HashMap<String, Object> hashMap);

	List<T_MALL_PRODUCT> select_spu_by_class_1_class_2_tm(HashMap<String, Object> hashMap);

	void insert_sku(T_MALL_SKU sku);

	void insert_sku_attr_values(HashMap<String, Object> hashMap);
}
