package com.academy.motionis.model;

import java.util.List;

/* STUDENTBASEINFO */
public class StudentDTO {
	private int s_no; // 번호
	private String s_code; 				// 고유번호
	private String s_name;		 		// 학생이름
	private String s_barth; 			// 학생 생일 
	private String s_email;				// 이메일
	private String s_call;				// 학생 번호
	private String s_addr;				// 학생 주소
	private String s_school; 			// 출신 학교
	private String s_major;				// 과목
	private String s_work;				// 직장
	private String s_join;				// 가입일
	private String s_disc;	// 할인 유무
	
	
	public String getS_addr() {
		return s_addr;
	}

	public void setS_addr(String s_addr) {
		this.s_addr = s_addr;
	}

	public int getS_no() {
		return s_no;
	}
	
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public String getS_code() {
		return s_code;
	}
	public void setS_code(String s_code) {
		this.s_code = s_code;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getS_barth() {
		return s_barth;
	}
	public void setS_barth(String s_barth) {
		this.s_barth = s_barth;
	}
	public String getS_call() {
		return s_call;
	}
	public void setS_call(String s_call) {
		this.s_call = s_call;
	}

	public String getS_school() {
		return s_school;
	}

	public void setS_school(String s_school) {
		this.s_school = s_school;
	}

	public String getS_email() {
		return s_email;
	}

	public void setS_email(String s_email) {
		this.s_email = s_email;
	}

	public String getS_work() {
		return s_work;
	}

	public void setS_work(String s_work) {
		this.s_work = s_work;
	}


	public String getS_major() {
		return s_major;
	}

	public void setS_major(String s_major) {
		this.s_major = s_major;
	}

	public String getS_join() {
		return s_join;
	}

	public void setS_join(String s_join) {
		this.s_join = s_join;
	}

	public String getS_disc() {
		return s_disc;
	}

	public void setS_disc(String s_disc) {
		this.s_disc = s_disc;
	}

	@Override
	public String toString() {
		return "StudentDTO [s_no=" + s_no + ", s_code=" + s_code + ", s_name=" + s_name + ", s_barth=" + s_barth
				+ ", s_email=" + s_email + ", s_call=" + s_call + ", s_addr=" + s_addr + ", s_school=" + s_school
				+ ", s_major=" + s_major + ", s_work=" + s_work + ", s_join=" + s_join + ", s_disc=" + s_disc + "]";
	}

	
	
	
	
}
