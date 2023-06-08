package com.example.trakker.service.admin;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.trakker.model.member.dao.MemberDAO;
import com.example.trakker.model.member.dto.MemberDTO;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {


    @Autowired
    MemberDAO memberDao;

    @Override
    public List<MemberDTO> memberList() {

        return  memberDao.memberList();
    }

    @Override
    public MemberDTO viewMember(String mem_email) {

        return memberDao.viewMember(mem_email);
    }

}