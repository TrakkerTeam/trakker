package com.example.trakker.service.admin;


import com.example.trakker.model.member.dto.MemberDTO;

import java.util.List;

public interface AdminService {

    public List<MemberDTO> memberList();
    public MemberDTO viewMember(String mem_email);

}