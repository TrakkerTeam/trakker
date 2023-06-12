package com.example.trakker.model.member.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.trakker.model.member.dto.MemberDTO;

import java.util.List;

//memberMapper 와의 상호작용을 담당합니다
@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public MemberDTO logincheck(MemberDTO dto) {
		MemberDTO name = sqlSession.selectOne("member.logincheck",dto);
		return name;
	}

	@Override
	public MemberDTO viewMember(String mem_email) {
		return sqlSession.selectOne("member.memberView", mem_email);
	}

	@Override
	public void insertMember(MemberDTO dto) {
		sqlSession.insert("member.insertMember",dto);
	}

	@Override
	public int emailCheck(String mem_email) {
		int cnt = sqlSession.selectOne("member.emailCheck",mem_email);
		return cnt;
	}

	@Override
	public void updateMember(MemberDTO dto) {
		sqlSession.update("member.updateMember",dto);
	}

	@Override
	public void memberDelete(MemberDTO dto) {
		sqlSession.delete("member.deleteMember",dto);
	}



	@Override
	public MemberDTO getupdateMember(String mem_email) {
		return sqlSession.selectOne("member.getupdateMember", mem_email);
	}


}
