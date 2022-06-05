package com.academy.motionis;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.academy.motionis.model.TestDTO;
import com.academy.motionis.service.StudentMapper;

@Controller
public class MotionisController {
	
	@RequestMapping(value = {"/","index.do"})
	public String index(HttpServletRequest req) {
		return "index";
	}
}
