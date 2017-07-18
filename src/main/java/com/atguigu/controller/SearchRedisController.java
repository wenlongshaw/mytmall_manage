package com.atguigu.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.bean.OBJECT_T_MALL_SKU;
import com.atguigu.bean.T_MALL_SKU_ATTR_VALUE;
import com.atguigu.service.SearchRedisServiceInf;
import com.atguigu.util.JedisPoolUtils;
import com.atguigu.util.MyJsonUtil;

import redis.clients.jedis.Jedis;

@Controller
public class SearchRedisController {
	@Autowired
	SearchRedisServiceInf searchRedisServiceImp;
	@RequestMapping("goto_search_redis")
	public String publish() {
		return "manager_search_redis";
	}
	@RequestMapping("refresh_class_2_redis")
	@ResponseBody
	public int refresh_class_2_redis (int class_2_id){
		// 查询二级分类检索集合
		List<OBJECT_T_MALL_SKU> list_object_sku = searchRedisServiceImp.get_sku_by_class_2(class_2_id);
		// 创建redis客户端连接
		Jedis jedis = JedisPoolUtils.getJedis();
		// 生成redis的二级分类key
		String class_2_key = "class_2_"+class_2_id;
		jedis.del(class_2_key);
		// 循环集合
		for (int i = 0; i < list_object_sku.size(); i++) {
			// 将商品集合中的每一个商品转化为json字符串存入redis的集合中
			String object_to_json = MyJsonUtil.object_to_json(list_object_sku.get(i));
			jedis.zadd(class_2_key, i, object_to_json);
		}
		return list_object_sku.size();
	}
	
	@RequestMapping("refresh_attr_value_redis")
	@ResponseBody
	public long refresh_attr_value_redis(int class_2_id, @RequestParam("attr_array[]") Integer[] attr_array) {

		Jedis jedis = JedisPoolUtils.getJedis();

		long sum = 0l;

		// 1 根据分类属性的id，循环，查询出对应的分类属性值
		for (int i = 0; i < attr_array.length; i++) {
			List<Integer> list_value_id = searchRedisServiceImp.get_value_by_attr(attr_array[i]);

			// 2 根据分类属性值id，循环，查询出对应的商品集合，每一个分类属性值的id对应一个商品集合的key
			for (int j = 0; j < list_value_id.size(); j++) {
				List<T_MALL_SKU_ATTR_VALUE> list_attr_value = new ArrayList<T_MALL_SKU_ATTR_VALUE>();
				T_MALL_SKU_ATTR_VALUE t_MALL_SKU_ATTR_VALUE = new T_MALL_SKU_ATTR_VALUE();
				t_MALL_SKU_ATTR_VALUE.setShxm_id(attr_array[i]);
				t_MALL_SKU_ATTR_VALUE.setShxzh_id(list_value_id.get(j));

				// 放入集合
				list_attr_value.add(t_MALL_SKU_ATTR_VALUE);

				List<OBJECT_T_MALL_SKU> list_sku = searchRedisServiceImp.get_sku_by_class_2_attr_value(class_2_id,
						list_attr_value, "");

				String key = "attr_" + class_2_id + "_" + attr_array[i] + "_" + list_value_id.get(j);
				jedis.del(key);
				// 3 循环商品集合，将商品集合插入到对应的redis的zset的key中
				for (int k = 0; k < list_sku.size(); k++) {
					String object_to_json = MyJsonUtil.object_to_json(list_sku.get(k));
					jedis.zadd(key, k, object_to_json);
					sum++;
				}
			}
		}

		return sum;
	}
}
