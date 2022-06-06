package com.academy.motionis;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.academy.motionis.model.ClassDTO;
import com.academy.motionis.model.TeacherDTO;
import com.academy.motionis.service.ClassMapper;
import com.academy.motionis.service.TeacherMapper;

@Controller
public class TeacherController {

	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Autowired
	private TeacherMapper teacherMapper;
	
	@Autowired
	private ClassMapper classMapper;
	
	@RequestMapping("teacherIndex.do")
	public String indexTeacher(HttpServletRequest req) {
		
		List<TeacherDTO> list = teacherMapper.selectTeacherAll();
		req.setAttribute("listTeacher", list);
		
		return "admin/teacher/teacherIndex";
	}
	
	@RequestMapping("addTeachertForm.do")
	public String addTeacherForm(HttpServletRequest req) {
		
		List<ClassDTO> list = classMapper.selectClassCateAll();
		req.setAttribute("listClass", list);
		
		return "admin/teacher/teacherAddForm";
	}
	
	@RequestMapping(value = "inputTeacher.do", method=RequestMethod.POST)
	public String inputTeacher(HttpServletRequest req, TeacherDTO dto, BindingResult result) {
		if (result.hasErrors()) {
			dto.setT_img("");
		}
		
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
		
		MultipartFile mf = mr.getFile("t_img");
		String newFile = mf.getOriginalFilename(); 
		
		dto.setT_img(newFile);
		
		int res = teacherMapper.insertTeacher(dto);
		if (res>0) {
			req.setAttribute("msg", "강사등록 성공!! 강사 목록 페이지로 이동합니다.");
			req.setAttribute("url", "teacherIndex.do");
			
			try {
				File file = new File(uploadPath, newFile);
				mf.transferTo(file);
			}catch (IOException e) {}
			 
		}else {
			req.setAttribute("msg", "강사등록 실패!! 강사 등록 페이지로 이동합니다.");
			req.setAttribute("url", "addTeachertForm.do");
		}
	
		return "message";
	}
	
	@RequestMapping("teacherInfo.do")
	public String teacherInfo(HttpServletRequest req) {
		String code = req.getParameter("t_code");
		TeacherDTO dto = teacherMapper.selectTeacher(code);
		
		req.setAttribute("dto", dto);
		
		return "admin/teacher/teacherInfo";
	}
	
	@RequestMapping("deleteTeacher.do")
	public String deleteTeacher(@RequestParam Map<String, String> params ,HttpServletRequest req) {
		int res = teacherMapper.deleteTeacher(params.get("code"));
		
		if (res>0) {
			File file =	new File("C:\\spring-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\motionis\\resources\\img", params.get("img"));
			file.delete();
			req.setAttribute("msg", "강사삭제 성공!! 강사 목록 페이지로 이동합니다.");
			req.setAttribute("url", "teacherIndex.do");
		}else {
			req.setAttribute("msg", "강사삭제 실패!! 강사 목록 페이지로 이동합니다.");
			req.setAttribute("url", "teacherIndex.do");
		}
		
		return "message";
	}
	
	@RequestMapping("updateTeacherForm.do")
	public String updateTeacherForm(HttpServletRequest req ) {
		
		String code = req.getParameter("code");
		List<ClassDTO> list = classMapper.selectClassCateAll();
		TeacherDTO dto = teacherMapper.selectTeacher(code);
		
		req.setAttribute("listClass", list);
		req.setAttribute("dto", dto);
		
		return "admin/teacher/teacherUpdateForm";
	}
	
	@RequestMapping("teaherUpdate.do")
	public String updateTeacher(HttpServletRequest req, TeacherDTO dto) {
		
		int res = teacherMapper.updateTeacher(dto);
		
		
		if (res>0) {
			req.setAttribute("msg", "강사수정 성공!! 강사 목록 페이지로 이동합니다.");
			req.setAttribute("url", "teacherIndex.do");
		}else {
			req.setAttribute("msg", "강사수정 실패!! 강사 목록 페이지로 이동합니다.");
			req.setAttribute("url", "teacherIndex.do");
		}
		
		return "message";
	}
}
