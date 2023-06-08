package com.example.trakker.model.member.dao;

import java.util.List;

import com.example.trakker.model.member.dto.MemberDTO;

//MemberDAO 인터페이스는 회원 데이터에 접근하기 위한 기능을 정의하고 있습니다.
public interface MemberDAO {
	public String logincheck(MemberDTO dto); //로그인 체크기능
	public MemberDTO viewMember(String mem_email);//회원정보
	public void insertMember(MemberDTO dto);//회원가입


	// admin member view
	List<MemberDTO> memberList();
}