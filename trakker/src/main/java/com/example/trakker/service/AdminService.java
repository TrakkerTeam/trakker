package com.example.trakker.service;

import java.util.List;


import com.example.trakker.model.member.dto.MemberDTO;

public interface AdminService {
	
	public List<MemberDTO> memberList();
	public MemberDTO viewMember(int mem_num);

}
