package io.renren.modules.generator.entity;

import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;


/**
 * 
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-04-08 16:28:50
 */
public class GoodsEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long goodsid;
	//
	private String name;
	//
	private String intro;
	//
	private BigDecimal price;
	//
	private Integer num;

	/**
	 * 设置：
	 */
	public void setGoodsid(Long goodsid) {
		this.goodsid = goodsid;
	}
	/**
	 * 获取：
	 */
	public Long getGoodsid() {
		return goodsid;
	}
	/**
	 * 设置：
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 获取：
	 */
	public String getName() {
		return name;
	}
	/**
	 * 设置：
	 */
	public void setIntro(String intro) {
		this.intro = intro;
	}
	/**
	 * 获取：
	 */
	public String getIntro() {
		return intro;
	}
	/**
	 * 设置：
	 */
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	/**
	 * 获取：
	 */
	public BigDecimal getPrice() {
		return price;
	}
	/**
	 * 设置：
	 */
	public void setNum(Integer num) {
		this.num = num;
	}
	/**
	 * 获取：
	 */
	public Integer getNum() {
		return num;
	}
}
