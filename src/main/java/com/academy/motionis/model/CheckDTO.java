package com.academy.motionis.model;

public class CheckDTO {
	private String t_name;
	private String c_code;
	private String ct_code;
	private String s_code;
	private String ck_status;
	private String to_day;
	
	
	@Override
	public String toString() {
		return "CheckDTO [t_name=" + t_name + ", c_code=" + c_code + ", ct_code=" + ct_code + ", s_code=" + s_code
				+ ", ck_status=" + ck_status + ", to_day=" + to_day + "]";
	}
	public String getTo_day() {
		return to_day;
	}
	public void setTo_day(String to_day) {
		this.to_day = to_day;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	public String getC_code() {
		return c_code;
	}
	public void setC_code(String c_code) {
		this.c_code = c_code;
	}
	public String getCt_code() {
		return ct_code;
	}
	public void setCt_code(String ct_code) {
		this.ct_code = ct_code;
	}
	public String getS_code() {
		return s_code;
	}
	public void setS_code(String s_code) {
		this.s_code = s_code;
	}
	public String getCk_status() {
		return ck_status;
	}
	public void setCk_status(String ck_status) {
		this.ck_status = ck_status;
	}

	
	
	
}
