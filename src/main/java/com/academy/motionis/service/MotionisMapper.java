package com.academy.motionis.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.academy.motionis.model.LoginDTO;

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
	
}
