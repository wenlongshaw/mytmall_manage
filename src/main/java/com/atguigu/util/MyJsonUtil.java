package com.atguigu.util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import com.atguigu.bean.T_MALL_SHOPPINGCAR;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

/**
 * 
 * @author wenlongshaw
 * @time2017年7月3日下午5:08:29
 */
public class MyJsonUtil {
	//对象转json
	public static <T> String object_to_json(T t) {
		Gson gson = new Gson();
		String json = gson.toJson(t);
		try {
			json=URLEncoder.encode(json, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return json;
	}
	//字符串转对象
	public static <T>T string_to_object(String value, Class<T> t) {
		Gson gson = new Gson();
		T json_object=null;
		
		try {
			String decode = URLDecoder.decode(value, "utf-8");
			json_object=gson.fromJson(decode,t);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return json_object;
	}
	
	/***
	 * 购物车json转购物车集合对象
	 */
	public static List<T_MALL_SHOPPINGCAR> car_json_to_car_list(String json) {

		Gson gson = new Gson();

		TypeToken<List<T_MALL_SHOPPINGCAR>> t = new TypeToken<List<T_MALL_SHOPPINGCAR>>() {
		};

		try {
			json = URLDecoder.decode(json, "utf-8");
		} catch (UnsupportedEncodingException e) {
			
			e.printStackTrace();
		}

		@SuppressWarnings("unchecked")
		List<T_MALL_SHOPPINGCAR> fromJson = (List<T_MALL_SHOPPINGCAR>) gson.fromJson(json, t.getType());

		return fromJson;
	}
	
}
