package com.academy.motionis.service;

import java.util.Iterator;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.academy.motionis.model.IndexDTO;
import com.academy.motionis.model.StudentSelectClassDTO;
import com.academy.motionis.model.StudentDTO;
import com.academy.motionis.model.TestDTO;

@Service
public class StudentMapper {

	@Autowired
	private SqlSession sqlSession;
	

	public int insertStudent(StudentDTO sDto, StudentSelectClassDTO sscDto) {
		int res=0;
		
		if(sDto.getS_work() == null || sDto.getS_work().equals("")) {
			sDto.setS_work("없음");
		}
		if(sDto.getS_disc()== null || sDto.getS_disc().equals("")) {
			sDto.setS_disc("정가");
		}
		
		sqlSession.insert("insertStudent", sDto);
		String s_code = sqlSession.selectOne("selectScode", sDto);
		
		System.out.println("Test : " + sDto.getSscList().get(0).getC_code());
		
		for(int i=0; i<sDto.getSscList().size(); i++) {
			System.out.println("Count : " + i);
			if(!sDto.getSscList().get(i).getC_payCheck().equals("수강")) {
				sDto.getSscList().get(i).setC_code(sscDto.getC_code());
				sDto.getSscList().get(i).setC_card(sscDto.getC_card());
				sqlSession.insert("insertSSC",sDto.getSscList().get(i));
			}
		}
				
		return res;
	}
	
	public List<StudentDTO> selectAllStudent(){
		return sqlSession.selectList("selectAllStudent");
	}

}
