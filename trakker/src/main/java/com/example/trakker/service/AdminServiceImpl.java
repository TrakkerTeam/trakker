package com.example.trakker.service;

import java.util.List;


import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.trakker.model.member.dao.MemberDAO;
import com.example.trakker.model.member.dto.MemberDTO;

@Service
public class AdminServiceImpl implements AdminService {
	
	
	@Autowired
	MemberDAO memberDao;

	@Override
	public List<MemberDTO> memberList() {
		
		return  memberDao.memberList();
	}

	@Override
	public MemberDTO viewMember(int mem_num) {
		
		return memberDao.viewMember(mem_num);
	}

}
