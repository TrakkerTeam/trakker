package com.example.trakker.model.member.dao;

import java.util.List;

import com.example.trakker.model.member.dto.MemberDTO;

public interface MemberDAO {
	 public String logincheck(MemberDTO dto);
	 public MemberDTO viewMember(String mem_email);


}
