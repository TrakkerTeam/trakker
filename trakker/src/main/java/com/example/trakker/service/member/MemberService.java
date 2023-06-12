package com.example.trakker.service.member;

import java.lang.reflect.Member;
import java.util.List;

import javax.servlet.http.HttpSession;


import com.example.trakker.model.member.dto.MemberDTO;

//해당 인터페이스는 회원 관련 기능을 처리하는 메서드를 선언하고 있습니다.
public interface MemberService {
	public MemberDTO logincheck(MemberDTO dto, HttpSession session);
	public void logout(HttpSession session);
	public MemberDTO viewMember(String mem_email);
	public void insertMember(MemberDTO dto);
	public int emailCheck(String mem_email); //mem_email 중복체크
	public void updateMember(MemberDTO dto);

	public void memberDelete(MemberDTO dto);


	public MemberDTO getupdateMember(String mem_email); //안되면 지우기
}
