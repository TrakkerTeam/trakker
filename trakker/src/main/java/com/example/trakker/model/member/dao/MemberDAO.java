package com.example.trakker.model.member.dao;

import java.util.List;

import com.example.trakker.model.member.dto.MemberDTO;
import com.example.trakker.utils.PagingInfoVO;
import com.example.trakker.utils.ResponseResultList;


public interface MemberDAO {
	public MemberDTO logincheck(MemberDTO dto);
	public MemberDTO viewMember(String mem_email);
	public void insertMember(MemberDTO dto);
	public int emailCheck(String mem_email);
	public void updateMember(MemberDTO dto);

	public void memberDelete(String mem_email);

	public void pwUpdate(String mem_email, String new_pass);



	List<MemberDTO> memberList();
    MemberDTO adminViewMember(int mem_num);
	void adminupdateMember(MemberDTO dto);
    int memberCount() throws Exception;
    ResponseResultList listPage(PagingInfoVO vo);


}