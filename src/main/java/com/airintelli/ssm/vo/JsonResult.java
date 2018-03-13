package com.airintelli.ssm.vo;

/**
 * 响应ajax请求的基础数据模型
 * 
 * @author thinkpad
 * @date 2017-7-24
 */
public class JsonResult {

	public final static int SUCCESS = 0;
	private int status;
	private String message;

	public JsonResult() {
	}

	public JsonResult(int status) {
		this.status = status;
	}

	public JsonResult(int status, String message) {
		this.status = status;
		this.message = message;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
