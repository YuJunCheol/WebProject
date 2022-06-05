package com.academy.motionis;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.academy.motionis.model.ClassDTO;
import com.academy.motionis.model.ClassTimeTableDTO;
import com.academy.motionis.model.TeacherDTO;
import com.academy.motionis.service.ClassMapper;
import com.academy.motionis.service.TeacherMapper;

@Controller
public class ClassController {

	@Autowired
	private ClassMapper classMapper;
	
	@Autowired
	private TeacherMapper teacherMapper;
	
	@RequestMapping("classIndex.do")
	public String index(HttpServletRequest req) {
		List<ClassDTO> list = classMapper.selectClassCateAll();
		List<ClassTimeTableDTO> listCtt = classMapper.selectCTTAll();
		
		LocalDate now =  LocalDate.now();
		String nowYear = now.toString().substring(0,4);
		
		req.setAttribute("nowYear", nowYear);
		req.setAttribute("listClass", list);
		req.setAttribute("listCtt", listCtt);
		
		return "admin/class/classIndex";
	}
	
	@RequestMapping("addClassForm.do")
	public String addClassForm(HttpServletRequest req) {
		
		List<TeacherDTO> tlist = teacherMapper.selectTeacherAll();
		req.setAttribute("listTeacher", tlist);
		
		return "admin/class/classAdd";
	}
	
	@RequestMapping("inputClass.do")
	public String inputClass(HttpServletRequest req ,ClassDTO dto) {
		int res = classMapper.insertClass(dto);
		if (res>0) {
			req.setAttribute("msg", "강의등록 성공!! 강의목록 페이지로 이동합니다.");
			req.setAttribute("url", "classIndex.do");
		}else {
			req.setAttribute("msg", "강의등록 실패!! 강의등록 페이지로 이동합니다.");
			req.setAttribute("url", "addClassForm.do");
		}
		
		return "message";
	}
	
	@RequestMapping("classInfo.do")
	public String infoClass(HttpServletRequest req) {
		String code = (String)req.getParameter("c_code");
		ClassDTO dto = classMapper.selectClassCate(code);
		req.setAttribute("dto", dto);
		
		return "admin/class/classInfo";
	}
	
	@RequestMapping("updateClass.do")
	public String updateClass(HttpServletRequest req, ClassDTO dto) {
		int res = classMapper.updateClass(dto);
		if(res > 0) {
			req.setAttribute("msg", "강의 수정성공!! 강의목록 페이지로 이동합니다.");
			req.setAttribute("url", "classIndex.do");
		}else {
			req.setAttribute("msg", "강의등록 실패!! 강의수정 페이지로 이동합니다.");
			req.setAttribute("url", "updateClass.do");
		}
		return "message";
	}
	
	@RequestMapping("deleteClass.do")
	public String deleteClass(HttpServletRequest req) {
		String code = (String)req.getParameter("c_code");
		int res = classMapper.deleteClass(code);
		if(res > 0) {
			classMapper.deleteClassTimeTable(code);
			req.setAttribute("msg", "강의 삭제성공!! 강의목록 페이지로 이동합니다.");
			req.setAttribute("url", "classIndex.do");
		}else {
			req.setAttribute("msg", "강의삭제 실패!! 강의수정 페이지로 이동합니다.");
			req.setAttribute("url", "updateClass.do");
		}
		return "message";
	}
	
	@RequestMapping("updateClassCateForm.do")
	public String updateClassCateForm(HttpServletRequest req, String c_code) {
		
		ClassDTO classDto = classMapper.selectClassCate(c_code);
		
		req.setAttribute("classDto", classDto);
		
		return "admin/class/updateClassCateForm";
	}
	
	@RequestMapping("updateClassCate.do")
	public String updateClassCate(HttpServletRequest req, ClassDTO dto) {
		
		int res = classMapper.updateClassCate(dto);
		if(res > 0) {
			req.setAttribute("msg", "강의를 수정 완료했습니다!! 강의 목록 페이지로 이동합니다.");
			req.setAttribute("url", "classIndex.do");
		}else {
			req.setAttribute("msg", "강의수정 실패!! 강의수정 페이지로 이동합니다.");
			req.setAttribute("url", "updateClassCate.do");
		}
		
		return "message";
	}
	
	@RequestMapping("insertClassTimeTableForm.do")
	public String insertClassTimeTable(HttpServletRequest req) {

		LocalDate now =  LocalDate.now();
		String nowYear = now.toString().substring(0,4);
		
		List<ClassDTO> listClass = classMapper.selectClassCateAll();
		
		req.setAttribute("listClass", listClass);
		req.setAttribute("nowYear", nowYear);
		
		return "admin/class/addClassTimeTableForm";
	}
	
	@RequestMapping("insertClassTimeTable.do")
	public String insertClassTimeTable(HttpServletRequest req, ClassTimeTableDTO dto) {
		
		if(classMapper.checkClassTimeTable(dto.getC_code())) {
			int res = classMapper.updateClassTimeTable(dto);
			
			req.setAttribute("msg", "시간표를 변경하였습니다. 강의 목록페이지로 이동합니다.");
			req.setAttribute("url", "classIndex.do");
		}else {
			int res = classMapper.insertClassTimeTable(dto);
			if(res > 0) {
				req.setAttribute("msg", "시간표 등록에성공하였습니다. 강의 목록 페이지로 이동합니다.");
				req.setAttribute("url", "classIndex.do");
			}else {
				req.setAttribute("msg", "시간표 등록에 실패하였습니다. 강의 목록 페이지로 이동합니다.");
				req.setAttribute("url", "classIndex.do");
			}
		}
		
		return "message";
	}
	
	
}
