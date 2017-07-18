package com.atguigu.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.mapper.SupMapper;
@Service
public class SupServiceImpl implements SupServiceInf{
	@Autowired
	SupMapper supMapper;
	public void save_spu(T_MALL_PRODUCT spu, List<String> list_image) {
		//插入商品表
		supMapper.insert_spu(spu);
		//插入商品图片
		HashMap<String,Object> hashMap = new HashMap<String,Object>();
		hashMap.put("shp_id", spu.getSpu_id());
		hashMap.put("list_image", list_image);
		
		supMapper.insert_spu_image(hashMap);
	}

	
}
