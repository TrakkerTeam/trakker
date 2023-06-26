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

    // 수정 기능 추가

    public void updateMember(MemberDTO dto) {
        memberDao.updateMember(dto);
    }
    // 관리자 메인 페이지 ajax 박스 데이터 개수 정하는 메서드

    public int memberCount() throws Exception {
        return memberDao.memberCount();
    }

    //유저 목록 페이징
    public ResponseResultList listPage(PagingInfoVO vo){

        return memberDao.listPage(vo);
    }


}