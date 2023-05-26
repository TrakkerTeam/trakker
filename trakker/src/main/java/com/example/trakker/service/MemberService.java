package com.example.trakker.service;

import java.lang.reflect.Member;
import java.util.List;

import javax.servlet.http.HttpSession;


import com.example.trakker.model.member.dto.MemberDTO;

public interface MemberService {
	public String logincheck(MemberDTO dto, HttpSession session);
	public void logout(HttpSession session);
	public MemberDTO viewMember(String mem_email);


	//기환님
//	public List<MemberDTO> memberList();


}
