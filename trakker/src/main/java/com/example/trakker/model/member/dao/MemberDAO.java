package com.example.trakker.model.member.dao;

import java.util.List;


import com.example.trakker.model.member.dto.MemberDTO;

public interface MemberDAO {
	
	public List<MemberDTO> memberList();
	public MemberDTO viewMember(int mem_num);
}
