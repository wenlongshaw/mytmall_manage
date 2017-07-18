package com.atguigu.service;

import java.util.List;

import org.springframework.stereotype.Service;
import com.atguigu.bean.OBJECT_T_MALL_SKU;
import com.atguigu.bean.T_MALL_SKU_ATTR_VALUE;
@Service
public interface SearchRedisServiceInf{

	public List<OBJECT_T_MALL_SKU> get_sku_by_class_2(int class_2_id);

	List<OBJECT_T_MALL_SKU> get_sku_by_class_2_attr_value(int class_2_id, List<T_MALL_SKU_ATTR_VALUE> list_attr_value,
			String order);

	public List<Integer> get_value_by_attr(Integer integer);
}
