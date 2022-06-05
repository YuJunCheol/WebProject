package com.academy.motionis.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.academy.motionis.model.ClassDTO;
import com.academy.motionis.model.ClassTimeTableDTO;

@Service
public class ClassMapper {

	@Autowired
	private SqlSession sqlSession;
	
	public int insertClass( ClassDTO dto) {
		
		return sqlSession.insert("insertClass", dto);
	}
	
	public List<ClassDTO> selectClassCateAll() {
		return sqlSession.selectList("selectClassCateAll");
	}
	
	public ClassDTO selectClassCate(String c_code) {
		return sqlSession.selectOne("selectClassCate", c_code);
	}
	
	public int updateClass(ClassDTO dto) {
		return sqlSession.update("updateClass", dto);
	}
	
	public int deleteClass(String c_code) {
		return sqlSession.delete("deleteClass", c_code);
	}
	
	public List<ClassDTO> selectStClass(String s_code) {
		return sqlSession.selectList("selectStClass", s_code);
	}
	
	public int insertClassTimeTable(ClassTimeTableDTO ctt) {
		int res=0;
		for(int i=0; i < ctt.getC_list().size(); i++) {
			ctt.getC_list().get(i).setCt_code(ctt.getC_code() + i);
			ctt.getC_list().get(i).setC_code(ctt.getC_code());
			ctt.getC_list().get(i).setC_day(ctt.getC_day());
			ctt.getC_list().get(i).setC_limit(ctt.getC_limit());
			res = sqlSession.insert("insertClassTimeTable", ctt.getC_list().get(i));
			if (res < 0 ) {
				return -1;
			}
		}				
		return res;
	}
	
	public List<ClassTimeTableDTO> selectCTTAll() {
		return sqlSession.selectList("selectCttAll");
	}
	
	public boolean checkClassTimeTable(String c_code) {
		List<ClassTimeTableDTO> ctlist = sqlSession.selectList("checkClassTimeTable", c_code);
		if(!ctlist.isEmpty()) {
			return true;			
		}
		return false;
	}
	
	
	public int updateClassTimeTable(ClassTimeTableDTO ctt) {		 
		int res=0;
		for(int i=0; i < ctt.getC_list().size(); i++) {
			ctt.getC_list().get(i).setCt_code(ctt.getC_code() + i);
			ctt.getC_list().get(i).setC_code(ctt.getC_code());
			ctt.getC_list().get(i).setC_day(ctt.getC_day());
			ctt.getC_list().get(i).setC_limit(ctt.getC_limit());
			res = sqlSession.update("updateClassTimeTable",ctt.getC_list().get(i));
			if(res < 0) {
				return -1;
			}
		}
		return res;
	}
	
	public int deleteClassTimeTable(String code) {
		return sqlSession.delete("deleteClassTimeTable", code);
	}
	
	public int updateClassCate(ClassDTO dto) {
		return sqlSession.update("updateClassCate", dto);
	}
	
	public List<ClassTimeTableDTO> selectCtt(String c_code) {
		return sqlSession.selectList("selectCtt", c_code);
	}
	
	public List<ClassDTO> selectClassNmae() {
		return sqlSession.selectList("selectClassName");
	}
}
