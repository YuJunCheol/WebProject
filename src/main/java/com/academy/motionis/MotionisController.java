package com.academy.motionis;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.academy.motionis.model.LoginDTO;
import com.academy.motionis.service.MotionisMapper;

@Controller
public class MotionisController {
	
	@Autowired
	private MotionisMapper motionisMapper;
	
	
	//#1__ 메인 이동 __ //
	@RequestMapping(value = {"/","index.do"})
	public String index(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		HttpSession session = req.getSession(false);
		
		if (session != null && session.getAttribute("SESSION_USER") != null) {
			LoginDTO user = (LoginDTO) session.getAttribute("SESSION_USER");
			
			if(user.getU_access().equals("admin")) {
				res.sendRedirect(req.getContextPath() + "/studentIndex.do");
			} else if (user.getU_access().equals("teacher")) {
				res.sendRedirect(req.getContextPath() + "/clientIndex.do?u_code=" + user.getU_code());
			}
		}
		
		return "index";
	}
	
	//#add__회원가입 관련__//
	@RequestMapping(value = "addUserForm.do")
	public String addUserForm(HttpServletRequest req) {
		return "login/addUserForm";
	}
	
	@RequestMapping(value = "addUser.do")
	public String addUser(HttpServletRequest req, LoginDTO dto) {
		
		int res = motionisMapper.insertLogin(dto);
		if(res > 0) {
			req.setAttribute("msg", "회원가입 완료!! 메인 화면으로 이동합니다.");
			req.setAttribute("url", "index.do");
		} else {
			req.setAttribute("msg", "회원가입 실패!! 회원가입 화면으로 이동합니다.");
			req.setAttribute("url", "addUserForm.do");
		}
		
		return "message";
	}
	
	//#login__로그인 관련 __ //
	@RequestMapping(value = "login.do") 
	public String login(HttpServletRequest req, LoginDTO dto) {	
		LoginDTO user = motionisMapper.login(dto);
		//System.out.println("데이터 넘어온 후 : " + user.toString());
		
		HttpSession session = req.getSession();
		
		if(user.getU_access().equals("admin")) {
			req.setAttribute("msg", "관리자로 접속하셧습니다 관리자 페이지로 이동합니다.");
			req.setAttribute("url", "studentIndex.do");
			session.setAttribute("SESSION_USER", user);
		}else if (user.getU_access().equals("teacher")) {
			req.setAttribute("msg", "강사로 접속하셧습니다 출석체크 페이지로 이동합니다.");
			req.setAttribute("url", "clientIndex.do?u_code="+user.getU_code());
			session.setAttribute("SESSION_USER", user);
		}else {
			req.setAttribute("msg", "아이디 또는 비밀번호가 일치하지 않거나 존재하지 않습니다 메인 화면으로 이동합니다.");
			req.setAttribute("url", "index.do");
		}
		
		return "message";
	}
	
	//#logout__로그아웃 관련__// 
	@RequestMapping(value = "logout.do")
	public void logout(HttpServletRequest req, HttpServletResponse res) throws IOException {
		HttpSession session = req.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		
		res.sendRedirect(req.getContextPath() + "/");
	}
	
	@RequestMapping(value = "clientIndex.do")
	public String clientIndex(HttpServletRequest req) {
		String u_code = req.getParameter("u_code");
		//System.out.println(u_code);
		req.setAttribute("u_code", u_code);
		return "client/attendance";
	}
}
