package com.example.trakker.service.admin;


import com.example.trakker.model.member.dao.MemberDAO;
import com.example.trakker.model.member.dto.MemberDTO;

import com.example.trakker.utils.PagingInfoVO;
import com.example.trakker.utils.ResponseResultList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService{

    @Autowired
    MemberDAO memberDao;


    public List<MemberDTO> memberList() {

        return  memberDao.memberList();
    }


    public MemberDTO adminViewMember(int mem_num) {

        return memberDao.adminViewMember(mem_num);
    }



    public void updateMember(MemberDTO dto) {
        memberDao.adminupdateMember(dto);
    }


    public int memberCount() throws Exception {
        return memberDao.memberCount();
    }


    public ResponseResultList listPage(PagingInfoVO vo){

        return memberDao.listPage(vo);
    }

    @Override
    public MemberDTO getupdateMember(String mem_email) {
        return memberDao.viewMember(mem_email);
    }


}