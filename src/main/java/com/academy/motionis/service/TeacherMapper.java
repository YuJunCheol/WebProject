package com.academy.motionis.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.academy.motionis.model.TeacherDTO;

@Service
public class TeacherMapper {

	@Autowired 
	private SqlSession sqlSession;
	
	public int insertTeacher(TeacherDTO dto) {
		return sqlSession.insert("insertTeacher", dto);
	}
	
	public List<TeacherDTO> selectTeacherAll() {
		return sqlSession.selectList("selectTeacherAll");
	}
	
	public TeacherDTO selectTeacher(String code) {
		return sqlSession.selectOne("selectTeacher", code);
	}
	 
	public int deleteTeacher(String code) {
		return sqlSession.delete("deleteTeacher", code);
	}
	
	public int updateTeacher(TeacherDTO dto) {
		return sqlSession.update("updateTeacher", dto);
	}
}
