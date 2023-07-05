package com.example.trakker.model.member.dao;

import java.util.List;
import java.util.Map;

import com.example.trakker.model.member.dto.MemberDTO;
import com.example.trakker.utils.PagingInfoVO;
import com.example.trakker.utils.ResponseResultList;

//MemberDAO 인터페이스는 회원 데이터에 접근하기 위한 기능을 정의하고 있습니다.
public interface MemberDAO {
	public MemberDTO logincheck(MemberDTO dto);
	public MemberDTO viewMember(String mem_email);
	public void insertMember(MemberDTO dto);
	public int emailCheck(String mem_email);
	public void updateMember(MemberDTO dto);

	public void memberDelete(String mem_email);

	public void pwUpdate(String mem_email, String new_pass);


	// admin member view
	List<MemberDTO> memberList();
    MemberDTO adminViewMember(int mem_num);
	void adminupdateMember(MemberDTO dto);
    int memberCount() throws Exception;
    ResponseResultList listPage(PagingInfoVO vo);


}