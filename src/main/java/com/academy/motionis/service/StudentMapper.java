package com.academy.motionis.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.academy.motionis.model.IndexDTO;
import com.academy.motionis.model.StudentDTO;
import com.academy.motionis.model.StudentSelectClassDTO;

@Service
public class StudentMapper {

	@Autowired
	private SqlSession sqlSession;
	

	public int insertStudent(StudentDTO sDto, StudentSelectClassDTO sscDto) {
		int res=0;
		
		sqlSession.insert("insertStudent", sDto);
		String s_code = sqlSession.selectOne("selectScode", sDto);
		String c_codeList[] = sscDto.getC_code().split(",");
		String ct_codeList[] = sscDto.getCt_code().split(",");
		String c_payCheck[] = sscDto.getC_payCheck().split(",");
		
		StudentSelectClassDTO sccValue = new StudentSelectClassDTO();
		
		for(int i = 0; i< c_codeList.length; i++) {
			sccValue.setS_code(s_code);
			sccValue.setC_code(c_codeList[i]);
			sccValue.setCt_code(ct_codeList[i]);
			sccValue.setC_card(sscDto.getC_card());
			sccValue.setC_payCheck(c_payCheck[i]);
			System.out.println(sccValue.toString());
			res = sqlSession.insert("insertStudnetSelectClass", sccValue);
		}
		
		return res;
	}
	
	public List<StudentDTO> selectAllStudent(){
		return sqlSession.selectList("selectAllStudent");
	}
	
	public List<IndexDTO> selectIndex(String year) {
		return sqlSession.selectList("selectStIndexInfo",year);
	}
	
	public StudentDTO selectStudent(String s_code ) {
		return sqlSession.selectOne("selectStudent",s_code);
	}
}
