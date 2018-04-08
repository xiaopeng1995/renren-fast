package io.renren.modules.generator.entity;

import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;


/**
 * 
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-04-08 16:45:05
 */
public class GoodsEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//商品ID
	private Long goodsid;
	//商品名称
	private String name;
	//商品描述
	private String intro;
	//商品价格
	private BigDecimal price;
	//商品剩余数量
	private Integer num;

	/**
	 * 设置：商品ID
	 */
	public void setGoodsid(Long goodsid) {
		this.goodsid = goodsid;
	}
	/**
	 * 获取：商品ID
	 */
	public Long getGoodsid() {
		return goodsid;
	}
	/**
	 * 设置：商品名称
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 获取：商品名称
	 */
	public String getName() {
		return name;
	}
	/**
	 * 设置：商品描述
	 */
	public void setIntro(String intro) {
		this.intro = intro;
	}
	/**
	 * 获取：商品描述
	 */
	public String getIntro() {
		return intro;
	}
	/**
	 * 设置：商品价格
	 */
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	/**
	 * 获取：商品价格
	 */
	public BigDecimal getPrice() {
		return price;
	}
	/**
	 * 设置：商品剩余数量
	 */
	public void setNum(Integer num) {
		this.num = num;
	}
	/**
	 * 获取：商品剩余数量
	 */
	public Integer getNum() {
		return num;
	}
}
