package io.renren.modules.generator.service;

import io.renren.modules.generator.entity.GoodsEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-04-08 16:45:05
 */
public interface GoodsService {
	
	GoodsEntity queryObject(Long goodsid);
	
	List<GoodsEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(GoodsEntity goods);
	
	void update(GoodsEntity goods);
	
	void delete(Long goodsid);
	
	void deleteBatch(Long[] goodsids);
}
