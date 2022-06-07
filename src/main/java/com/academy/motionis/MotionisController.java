package com.academy.motionis;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.academy.motionis.model.LoginDTO;
import com.academy.motionis.service.MotionisMapper;

@Controller
public class MotionisController {
	
	@Autowired
	private MotionisMapper motionisMapper;
	
	
	//#1__ ���� �̵� __ //
	@RequestMapping(value = {"/","index.do"})
	public String index(HttpServletRequest req) {
		return "index";
	}
	
	//#add__ȸ������ ����__//
	@RequestMapping(value = "addUserForm.do")
	public String addUserForm(HttpServletRequest req) {
		return "login/addUserForm";
	}
	
	@RequestMapping(value = "addUser.do")
	public String addUser(HttpServletRequest req, LoginDTO dto) {
		
		int res = motionisMapper.insertLogin(dto);
		if(res > 0) {
			req.setAttribute("msg", "ȸ������ �Ϸ�!! ���� ȭ������ �̵��մϴ�.");
			req.setAttribute("url", "index.do");
		} else {
			req.setAttribute("msg", "ȸ������ ����!! ȸ������ ȭ������ �̵��մϴ�.");
			req.setAttribute("url", "addUserForm.do");
		}
		
		return "message";
	}
	
	//#login__�α��� ���� __ //
	@RequestMapping(value = "login.do") 
	public String login(HttpServletRequest req, LoginDTO dto) {	
		LoginDTO user = motionisMapper.login(dto);
		System.out.println("������ �Ѿ�� �� : " + user.toString());
		
		if(user.getU_access().equals("admin")) {
			req.setAttribute("msg", "�����ڷ� �����ϼ˽��ϴ� ������ �������� �̵��մϴ�.");
			req.setAttribute("url", "studentIndex.do");
		}else if (user.getU_access().equals("teacher")) {
			req.setAttribute("msg", "����� �����ϼ˽��ϴ� �⼮üũ �������� �̵��մϴ�.");
			req.setAttribute("url", "clientIndex.do");
		}else {
			req.setAttribute("msg", "���̵� �Ǵ� ��й�ȣ�� ��ġ���� �ʰų� �������� �ʽ��ϴ� ���� ȭ������ �̵��մϴ�.");
			req.setAttribute("url", "index.do");
		}
		
		return "message";
	}
}
