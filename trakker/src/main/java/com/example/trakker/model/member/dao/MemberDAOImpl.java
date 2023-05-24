package com.example.trakker.model.member.dao;

import java.util.List;



import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.trakker.model.member.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<MemberDTO> memberList() {
		
		return sqlSession.selectList("member.memberList");
	}

	@Override
	public MemberDTO viewMember(int mem_num) {
		
		return sqlSession.selectOne("member.memberView", mem_num);
	}

}
