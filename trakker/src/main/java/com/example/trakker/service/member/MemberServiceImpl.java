package com.example.trakker.service.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.trakker.model.member.dao.MemberDAO;
import com.example.trakker.model.member.dto.MemberDTO;

//MemberServiceImpl 는 회원 관련 비즈니스 로직을 구현하고, MemberDAO를 사용하여 데이터 액세스 작업을 수행합니다
//MemberServiceImpl 는 MemberService 인터페이스를 구현하여 회원 관련 비즈니스 로직을 처리합니다
@Service
public class MemberServiceImpl implements MemberService{

    @Autowired
    MemberDAO memberDao;

    @Override
    public String logincheck(MemberDTO dto, HttpSession session) {
        String result = memberDao.logincheck(dto);
        if(result !=null) {
            MemberDTO dto2 = viewMember(dto.getMem_email());
            session.setAttribute("mem_email", dto.getMem_email());
            session.setAttribute("mem_name", dto2.getMem_name());
            session.setAttribute("mem_nickname",dto2.getMem_nickname());
            session.setAttribute("mem_phone",dto2.getMem_phone());
            session.setAttribute("mem_zipcode",dto2.getMem_zipcode());
            session.setAttribute("mem_address1",dto2.getMem_address1());
            session.setAttribute("mem_address2",dto2.getMem_address2());
            session.setAttribute("admin_ck",dto2.getAdmin_ck());
        }
        return result;
    }

    public MemberDTO viewMember(String mem_email) {
        return memberDao.viewMember(mem_email);
    }

    @Override
    public void insertMember(MemberDTO dto) {
        memberDao.insertMember(dto);
    }

    @Override
    public void logout(HttpSession session) {
        session.invalidate();
    }

}
