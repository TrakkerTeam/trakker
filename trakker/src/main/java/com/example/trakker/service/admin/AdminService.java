package com.example.trakker.service.admin;

import com.example.trakker.model.member.dto.MemberDTO;

import com.example.trakker.utils.PagingInfoVO;
import com.example.trakker.utils.ResponseResultList;

import java.util.List;

public interface AdminService {

     List<MemberDTO> memberList();
     MemberDTO adminViewMember(int mem_num);
     void updateMember(MemberDTO dto);
     int memberCount() throws Exception;
     ResponseResultList listPage(PagingInfoVO vo);
     MemberDTO getupdateMember(String mem_email);
}
