package com.academy.motionis;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.academy.motionis.model.CheckDTO;
import com.academy.motionis.model.ClassDTO;
import com.academy.motionis.model.ClassTimeTableDTO;
import com.academy.motionis.model.LoginDTO;
import com.academy.motionis.model.StudentDTO;
import com.academy.motionis.model.StudentSelectClassDTO;
import com.academy.motionis.model.TeacherDTO;
import com.academy.motionis.service.ClassMapper;
import com.academy.motionis.service.MotionisMapper;
import com.academy.motionis.service.StudentMapper;
import com.academy.motionis.service.TeacherMapper;

@Controller
public class MotionisController {
	
	@Autowired
	private MotionisMapper motionisMapper;
	
	@Autowired 
	private TeacherMapper teacherMapper;
	
	@Autowired
	private ClassMapper classMapper;
	
	@Autowired
	private StudentMapper studentMapper;
	
	//#1__ ���� �̵� __ //
	@RequestMapping(value = {"/","index.do"})
	public String index(HttpServletRequest req) {
		
		HttpSession session =  req.getSession();
		
		req.setAttribute("user", session.getAttribute("User"));
		
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
		HttpSession session =  req.getSession();
		LoginDTO user = motionisMapper.login(dto);	

		//System.out.println("������ �Ѿ�� �� : " + user.toString());
		session.setAttribute("User", user);
		if(user.getU_access().equals("admin")) {
			req.setAttribute("msg", "�����ڷ� �����ϼ˽��ϴ� ������ �������� �̵��մϴ�.");	
			req.setAttribute("url", "studentIndex.do");
		}else if (user.getU_access().equals("teacher")) {
			req.setAttribute("msg", "����� �����ϼ˽��ϴ� �⼮üũ �������� �̵��մϴ�.");
			req.setAttribute("url", "clientIndex.do?u_code="+user.getU_code());
		}else {
			req.setAttribute("msg", "���̵� �Ǵ� ��й�ȣ�� ��ġ���� �ʰų� �������� �ʽ��ϴ� ���� ȭ������ �̵��մϴ�.");
			req.setAttribute("url", "index.do");
		}
		
		return "message";
	}
	
	@RequestMapping(value = "clientIndex.do")
	public String clientIndex(HttpServletRequest req) {
		String u_code = req.getParameter("u_code");
		
		// �����̸� ���ϱ�
		TeacherDTO t_dto = teacherMapper.selectTeacher(u_code);
		
		// �̸����� ���簡 �����ϴ� ���� ����Ʈ ��������
		List<ClassDTO> ct_list = motionisMapper.getClassCate(t_dto);
		
		List<StudentDTO> studentList = studentMapper.selectAllStudent();

		String jString = null;
		
		ObjectMapper mp = new ObjectMapper();
		try {
			jString = mp.writeValueAsString(studentList);
			
		} catch (IOException e) {
			e.printStackTrace();
		}

		req.setAttribute("studentList", jString);
		
		req.setAttribute("data", t_dto.getT_name());
		req.setAttribute("ct_list", ct_list);
		
		return "client/attendance";
	}
	
	@RequestMapping(method=RequestMethod.POST, value="getClassList.do")
	@ResponseBody
	public List<ClassTimeTableDTO> getClassList(@RequestBody Map<String,String> map) {
		List<ClassTimeTableDTO> list = motionisMapper.getClassList(map.get("c_code"));
		return list;
	}
	
	@RequestMapping(method=RequestMethod.POST, value="getStudentCheckList.do")
	@ResponseBody
	public List<StudentSelectClassDTO> getStCkList(@RequestBody Map<String,String> map, HttpServletRequest req) {
		
		return motionisMapper.getStCkList(map.get("ct_code"));
	}
	
	@RequestMapping(value ="insertCheck.do")
	public String insertCheck(HttpServletRequest req, CheckDTO dto) {
		
		System.out.println(dto.toString());
		
		req.setAttribute("msg", "�⼮�� ��� �Ϸ� ���� ȭ������ �̵��մϴ�.");
		req.setAttribute("url", "index.do");
		
		return "message";
	}
	
}
