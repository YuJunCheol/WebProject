package com.academy.motionis.model;
// 과목 DB
public class ClassDTO {

	private int c_no;
	private String c_code;			// 강의 코드
	private String c_name;			// 강의 명.
	private String c_teacher;		// 강사. 
	private int c_tuition;			// 수강료
	
	
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public String getC_code() {
		return c_code;
	}
	public void setC_code(String c_code) {
		this.c_code = c_code;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_teacher() {
		return c_teacher;
	}
	public void setC_teacher(String c_teacher) {
		this.c_teacher = c_teacher;
	}
	public int getC_tuition() {
		return c_tuition;
	}
	public void setC_tuition(int c_tuition) {
		this.c_tuition = c_tuition;
	}

	
	
	
	
}
