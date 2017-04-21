package com.swpu.entity;

import java.io.Serializable;

/** 
* @author  cy
* @createDate 2017年4月11日 上午11:31:36 
* @version 1.0 
* @describe  
*/
public class Dict implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7574990132103060355L;
	
	private Integer dictId;
	private String type;
	private String item;
	private String value;
	private String editable;
	public Integer getDictId() {
		return dictId;
	}
	public void setDictId(Integer dictId) {
		this.dictId = dictId;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getEditable() {
		return editable;
	}
	public void setEditable(String editable) {
		this.editable = editable;
	}
	
}
