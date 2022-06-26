package com.academy.motionis.model;

public class LoginDTO {
	private String u_code;
	private String u_id;
	private String u_pw;
	private String u_access;
	
	public String getU_code() {
		return u_code;
	}
	public void setU_code(String u_code) {
		this.u_code = u_code;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_pw() {
		return u_pw;
	}
	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}
	public String getU_access() {
		return u_access;
	}
	public void setU_access(String u_access) {
		this.u_access = u_access;
	}
	@Override
	public String toString() {
		return "LoginDTO [u_code=" + u_code + ", u_id=" + u_id + ", u_pw=" + u_pw + ", u_access=" + u_access + "]";
	}
	
	

}
