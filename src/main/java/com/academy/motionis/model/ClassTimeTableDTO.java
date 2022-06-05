package com.academy.motionis.model;

import java.util.List;

public class ClassTimeTableDTO {
	private String c_code;				// 강의 코드
	private String c_start_day;			// 개강일 
	private String c_end_day;			// 종강일
	private String c_day;				// 수강 요일
	private String c_start_time;		// 강의 시작 시간
	private String c_end_time;			// 강의 끝 시간
	private int c_limit;				// 강의 정원.
	private String ct_code;
	private List<ClassTimeTableDTO> c_list;
	
	public String getCt_code() {
		return ct_code;
	}
	public void setCt_code(String ct_code) {
		this.ct_code = ct_code;
	}
	public String getC_code() {  
		return c_code; 
	}
	public void setC_code(String c_code) {
		this.c_code = c_code;
	}
	public String getC_start_day() {
		return c_start_day;
	}
	public void setC_start_day(String c_start_day) {
		this.c_start_day = c_start_day;
	}
	public String getC_end_day() {
		return c_end_day;
	}
	public void setC_end_day(String c_end_day) {
		this.c_end_day = c_end_day;
	}
	public String getC_day() {
		return c_day;
	}
	public void setC_day(String c_day) {
		this.c_day = c_day;
	}
	public String getC_start_time() {
		return c_start_time;
	}
	public void setC_start_time(String c_start_time) {
		this.c_start_time = c_start_time;
	}
	public String getC_end_time() {
		return c_end_time;
	}
	public void setC_end_time(String c_end_time) {
		this.c_end_time = c_end_time;
	}
	public int getC_limit() {
		return c_limit;
	}
	public void setC_limit(int c_limit) {
		this.c_limit = c_limit;
	}
	public List<ClassTimeTableDTO> getC_list() {
		return c_list;
	}
	public void setC_list(List<ClassTimeTableDTO> c_list) {
		this.c_list = c_list;
	}
	
	
	
	
}
