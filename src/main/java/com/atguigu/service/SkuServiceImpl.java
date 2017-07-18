package com.atguigu.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.bean.OBJECT_T_MALL_ATTR;
import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.bean.T_MALL_SKU;
import com.atguigu.bean.T_MALL_SKU_ATTR_VALUE;
import com.atguigu.mapper.SkuMapper;
@Service
public class SkuServiceImpl implements SkuserviceInf{
	@Autowired
	SkuMapper skuMapper;

	/***
	 * 根据二级分类的id，查询分类属性集合
	 */
	@Override
	public List<OBJECT_T_MALL_ATTR> get_attr_list_by_class_2_id(int class_2_id) {
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("class_2_id", class_2_id);
		List<OBJECT_T_MALL_ATTR> list_attr_value = skuMapper.select_attr_list_by_class_2_id(hashMap);
		return list_attr_value;
	}

	public List<T_MALL_PRODUCT> get_spu_by_class_1_class_2_tm(int class_2_id, int class_1_id, int tm_id) {
		HashMap<String, Object> hashMap = new HashMap<>();
		hashMap.put("class_2_id", class_2_id);
		hashMap.put("class_1_id", class_1_id);
		hashMap.put("tm_id", tm_id);
		List<T_MALL_PRODUCT> list_spu = skuMapper.select_spu_by_class_1_class_2_tm(hashMap);
		return list_spu;
	}
	public void add_sku(List<T_MALL_SKU_ATTR_VALUE> list,T_MALL_SKU sku) {
		skuMapper.insert_sku(sku);
		HashMap<String, Object> hashMap = new HashMap<String,Object>();
		hashMap.put("sku", sku);
		hashMap.put("list_attr_value", list);
		skuMapper.insert_sku_attr_values(hashMap);
	}

}
