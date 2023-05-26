package com.example.trakker.model.member.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.trakker.model.member.dto.MemberDTO;

import java.util.List;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public String logincheck(MemberDTO dto) {
		String name = sqlSession.selectOne("member.logincheck",dto);
		return name;
	}

	@Override
	public MemberDTO viewMember(String mem_email) {
		return sqlSession.selectOne("member.memberView", mem_email);
	}
	
//	//기환님
//	@Override
//	public List<MemberDTO> memberList() {
//		return sqlSession.selectList("member.memberList");
//	}
	
//	//기환님
//	@Override
//	public MemberDTO viewMember(int mem_num) {
//		return sqlSession.selectOne("member.memberView", mem_num);
//	}

}
