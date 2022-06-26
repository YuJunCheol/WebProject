package com.academy.motionis.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.academy.motionis.model.CheckDTO;
import com.academy.motionis.model.CheckListDTO;
import com.academy.motionis.model.ClassDTO;
import com.academy.motionis.model.ClassTimeTableDTO;
import com.academy.motionis.model.LoginDTO;
import com.academy.motionis.model.StudentSelectClassDTO;
import com.academy.motionis.model.TeacherDTO;

@Service
public class MotionisMapper {

	@Autowired
	private SqlSession sqlSession;
	
	public int insertLogin(LoginDTO dto) {		
		return sqlSession.insert("insertLogin", dto);
	}
	
	public LoginDTO login(LoginDTO dto) {
		return sqlSession.selectOne("selectLogin", dto);
	}
	
	public List<CheckListDTO> checkList() {
		return sqlSession.selectList("selectCheckList");
	}
	
	public List<ClassDTO> getClassCate(TeacherDTO dto) {
		return sqlSession.selectList("selectClassFromTname",dto);
	}
	
	public List<ClassTimeTableDTO> getClassList(String c_code) {
		return sqlSession.selectList("getClassList",c_code);
	}
	
	public List<StudentSelectClassDTO> getStCkList (String ct_code) {
		return sqlSession.selectList("getStCkList",ct_code);
	}
	
	public int insertCheck(CheckDTO dto) {
		// 만약 오늘 있으면 데이터를 수정하고 없으면 등록하자.
		int res=0;
		List<CheckDTO> to_day = sqlSession.selectList("if_check", dto);
		if(to_day.size() > 0) {
			// System.out.println("수정하기" + to_day.size());
			res = sqlSession.update("update_check",dto);
		}else {
			// System.out.println("새로등록");
			res = sqlSession.insert("insertCheck",dto);			
		}
		
		
		return res;
	}
}
