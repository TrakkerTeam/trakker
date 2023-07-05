package com.example.trakker.service.member;

import javax.servlet.http.HttpSession;

import com.example.trakker.model.item.HeartDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.trakker.model.member.dao.MemberDAO;
import com.example.trakker.model.member.dto.MemberDTO;


@Service
public class MemberServiceImpl implements MemberService{

    @Autowired
    MemberDAO memberDao;
    @Autowired
    HeartDAO heartDAO;

    @Override
    public MemberDTO logincheck(MemberDTO dto, HttpSession session) {
        MemberDTO result = memberDao.logincheck(dto);
        if(result !=null) {
            MemberDTO dto2 = viewMember(dto.getMem_email());
            session.setAttribute("mem_email", dto.getMem_email());
            session.setAttribute("mem_num", dto2.getMem_num());
            session.setAttribute("mem_name", dto2.getMem_name());
            session.setAttribute("mem_nickname",dto2.getMem_nickname());
            session.setAttribute("mem_phone",dto2.getMem_phone());
            session.setAttribute("mem_zipcode",dto2.getMem_zipcode());
            session.setAttribute("mem_address1",dto2.getMem_address1());
            session.setAttribute("mem_address2",dto2.getMem_address2());
            session.setAttribute("admin_ck",dto2.getAdmin_ck());
            session.setAttribute("mem_pass", dto2.getMem_pass());
            session.setAttribute("picture_url", dto2.getPicture_url());
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
    public int emailCheck(String mem_email) {
        int cnt =memberDao.emailCheck(mem_email);
        return cnt;
    }

    @Override
    public void updateMember(MemberDTO dto) {
        memberDao.updateMember(dto);
    }

    @Override
    public void memberDelete(String mem_email,long memNum) {
        memberDao.memberDelete(mem_email);
        heartDAO.deleteMember(memNum);
    }

    @Override
    public MemberDTO getupdateMember(String mem_email) {
        return memberDao.viewMember(mem_email);//안되면지우기
    }

    @Override
    public void logout(HttpSession session) {
        session.invalidate();
    }

    @Override
    public void pwUpdate(String mem_email, String new_pass){
        memberDao.pwUpdate(mem_email, new_pass);
    }

}
