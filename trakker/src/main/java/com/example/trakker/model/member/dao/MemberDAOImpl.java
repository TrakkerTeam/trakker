package com.example.trakker.model.member.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.trakker.model.member.dto.MemberDTO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public void memberDelete(String mem_email) {
		sqlSession.delete("member.deleteMember",mem_email);
	}

	@Override
	public boolean checkPw(String mem_email, String mem_pass) {
		boolean result = false;
		Map<String,String> map =new HashMap<>();
		map.put("mem_email", mem_email);
		map.put("mem_pass",mem_pass);
		int count =sqlSession.selectOne("member.checkPw",map);
		//비번이 맞으면(1), 틀리면 (0)리턴
		if(count ==1) result =true;
		return result;
	}




	@Override
	public MemberDTO getupdateMember(String mem_email) {
		return sqlSession.selectOne("member.getupdateMember", mem_email);
	}



	@Override
	public String pwCheck(String mem_email){
		return sqlSession.selectOne("member.pwCheck", mem_email);
	}

	@Override
	public void pwUpdate(String mem_email, String new_pass){
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("mem_email", mem_email);
		map.put("new_pass", new_pass);
		sqlSession.update("member.pwUpdate", map);
	}

}
