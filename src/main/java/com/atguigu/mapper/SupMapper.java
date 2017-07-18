package com.atguigu.mapper;

import java.util.HashMap;

import com.atguigu.bean.T_MALL_PRODUCT;

public interface SupMapper {

	void insert_spu(T_MALL_PRODUCT spu);

	void insert_spu_image(HashMap<String, Object> hashMap);
	
	
}
