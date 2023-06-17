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
	public String logincheck(MemberDTO dto) {
		String name = sqlSession.selectOne("member.logincheck",dto);
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

	// admin 회원 조회
	@Override
	public List<MemberDTO> memberList() {
		return sqlSession.selectList("admin.adminMemberList");
	}
	// admin 회원 상세 정보 조회
	@Override
	public MemberDTO adminViewMember(int mem_num) {
		return sqlSession.selectOne("admin.adminMemberView",mem_num);
	}
	// admin 회원 정보 업데이트
	@Override
	public void updateMember(MemberDTO dto) {
		sqlSession.update("admin.updateMember" , dto);
	}

	// admin 메인 페이지 회원 레코드 조회
	@Override
	public int memberCount() throws Exception {
		return sqlSession.selectOne("admin.memberCount");
	}


}