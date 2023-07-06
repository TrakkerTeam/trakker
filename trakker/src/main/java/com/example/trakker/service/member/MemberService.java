package com.example.trakker.service.member;


import javax.servlet.http.HttpSession;


import com.example.trakker.model.member.dto.MemberDTO;

public interface MemberService {
    public MemberDTO logincheck(MemberDTO dto, HttpSession session);
    public void logout(HttpSession session);
    public MemberDTO viewMember(String mem_email);
    public void insertMember(MemberDTO dto);
    public int emailCheck(String mem_email);
    public void updateMember(MemberDTO dto);

    public void memberDelete(String mem_email,long memNum);

    public MemberDTO getupdateMember(String mem_email);

    public void pwUpdate(String mem_email, String new_pass);

}
