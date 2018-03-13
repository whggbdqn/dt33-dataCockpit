package com.airintelli.ssm.vo;
/**
 * 响应ajax请求的数据模型(带响应内容数据)
 * 
 * @author thinkpad
 * @date 2017-7-24
 */
public class JsonDataResult<T> extends JsonResult {
	
	public JsonDataResult() {
		super(SUCCESS);
	}

	private T data;

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

}
