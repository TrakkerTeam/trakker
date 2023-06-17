package com.example.trakker.service.admin;


import com.example.trakker.model.member.dto.MemberDTO;

import java.util.List;

public interface AdminService {

     List<MemberDTO> memberList();
     MemberDTO adminViewMember(int mem_num);
     void updateMember(MemberDTO dto) throws Exception;
     int memberCount() throws Exception;

}