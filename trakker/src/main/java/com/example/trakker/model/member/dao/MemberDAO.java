package com.example.trakker.model.member.dao;

import java.util.List;
import java.util.Map;

import com.example.trakker.model.member.dto.MemberDTO;

//MemberDAO 인터페이스는 회원 데이터에 접근하기 위한 기능을 정의하고 있습니다.
public interface MemberDAO {
	 public MemberDTO logincheck(MemberDTO dto); //로그인 체크기능
	 public MemberDTO viewMember(String mem_email);//회원정보
	 public void insertMember(MemberDTO dto);//회원가입
	 public int emailCheck(String mem_email);
	public void updateMember(MemberDTO dto);

	public void memberDelete(String mem_email);
	public boolean checkPw(String mem_email, String mem_pass);


	public String pwCheck(String mem_email);

	public void pwUpdate(String mem_email, String new_pass);

	public MemberDTO getupdateMember(String mem_email); //안되면 지우기

	public int updateProfile(Map<String,Object> map);
}
