package com.academy.motionis;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.academy.motionis.model.ClassDTO;
import com.academy.motionis.model.ClassTimeTableDTO;
import com.academy.motionis.model.StudentDTO;
import com.academy.motionis.model.StudentSelectClassDTO;
import com.academy.motionis.service.ClassMapper;
import com.academy.motionis.service.StudentMapper;

@Controller
public class StudentController {
	
	@Autowired
	private StudentMapper studentmapper;
	
	@Autowired
	private ClassMapper classMapper;

	
	@RequestMapping("studentIndex.do")
	public String index(HttpServletRequest req) {
		
		List<StudentDTO> listStudent = studentmapper.selectAllStudent();
		
		req.setAttribute("listStudent", listStudent);
		
		return "admin/student/studentIndex";
	}
	
	@RequestMapping("addStudentForm.do")
	public String addStudentForm(HttpServletRequest req) {
		
		
		List<ClassDTO> listClass = classMapper.selectClassCateAll();
		List<ClassTimeTableDTO> listCtt = classMapper.selectCTTAll();
		 
		req.setAttribute("listClass", listClass);
		req.setAttribute("listCtt", listCtt);
		
		
		return "admin/student/studentAdd";
	}
	
	
	@RequestMapping("inputStudent.do")
	public String addStudent(HttpServletRequest req, StudentDTO sDto, StudentSelectClassDTO sscDto) {
		System.out.println("������ Ȯ�� : " 	+ sscDto.getC_code());
		//int res = studentmapper.insertStudent(sDto, sscDto);
		int res = 0;
		if (res > 0) {
			req.setAttribute("msg", "�л���� ����!! �л� ��� �������� �̵��մϴ�.");
			req.setAttribute("url", "studentIndex.do");
		}else {
			req.setAttribute("msg", "�л����� ����!! �л� �Է� �������� �̵��մϴ�.");
			req.setAttribute("url", "addStudentForm.do");
		}
		 
		
		
		return "message";
	}
	
	@RequestMapping(method=RequestMethod.POST, value="selectClass.do")
	@ResponseBody
	public List<ClassDTO> selectClassList(HttpServletRequest res) {
		List<ClassDTO> cList = classMapper.selectClassNmae();
	
		return cList;
 	}
	
	@RequestMapping(method=RequestMethod.POST, value="selectCtt.do", consumes = "application/json", produces = "application/json")
	@ResponseBody
	public List<ClassTimeTableDTO> selectCTTList(@RequestBody Map<String,String> map) {
		
		List<ClassTimeTableDTO> cttList = classMapper.selectCtt(map.get("c_code"));
		
		return cttList;
	}
	
	 
	
	
}