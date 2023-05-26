package com.example.trakker.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.trakker.model.member.dao.MemberDAO;
import com.example.trakker.model.member.dto.MemberDTO;


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
//			System.out.println(session.getAttribute("admin_ck"));
//			System.out.println(session.getAttribute("mem_email"));
//			System.out.println(session.getAttribute("mem_name"));
//			System.out.println(session.getAttribute("mem_nickname"));
//			System.out.println(session.getAttribute("mem_phone"));
//			System.out.println(session.getAttribute("mem_zipcode"));
//			System.out.println(session.getAttribute("mem_address1"));
//			System.out.println(session.getAttribute("mem_address2"));
		}
		return result;
	}

	public MemberDTO viewMember(String mem_email) {
		return memberDao.viewMember(mem_email);
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}

}
