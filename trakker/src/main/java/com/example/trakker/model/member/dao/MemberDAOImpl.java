package com.example.trakker.model.member.dao;



import com.example.trakker.utils.PagingInfoVO;
import com.example.trakker.utils.ResponseResultList;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.trakker.model.member.dto.MemberDTO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

//memberMapper 와의 상호작용을 담당합니다
@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public MemberDTO logincheck(MemberDTO dto) {
		MemberDTO name = sqlSession.selectOne("member.logincheck",dto);
		return name;
	}

	@Override
	public MemberDTO viewMember(String mem_email) {
		return sqlSession.selectOne("member.memberView", mem_email);
	}

	@Override
	public void insertMember(MemberDTO dto) {
		sqlSession.insert("member.insertMember",dto);
	}

	@Override
	public int emailCheck(String mem_email) {
		int cnt = sqlSession.selectOne("member.emailCheck",mem_email);
		return cnt;
	}

	@Override
	public void updateMember(MemberDTO dto) {
		sqlSession.update("member.updateMember",dto);
	}

	@Override
	public void memberDelete(String mem_email) {
		sqlSession.delete("member.deleteMember",mem_email);
	}

	@Override
	public boolean checkPw(String mem_email, String mem_pass) {
		boolean result = false;
		Map<String,String> map =new HashMap<>();
		map.put("mem_email", mem_email);
		map.put("mem_pass",mem_pass);
		int count =sqlSession.selectOne("member.checkPw",map);
		//비번이 맞으면(1), 틀리면 (0)리턴
		if(count ==1) result =true;
		return result;
	}

	@Override
	public MemberDTO getupdateMember(String mem_email) {
		return sqlSession.selectOne("member.getupdateMember", mem_email);
	}

	@Override
	public String pwCheck(String mem_email){
		return sqlSession.selectOne("member.pwCheck", mem_email);
	}

	@Override
	public void pwUpdate(String mem_email, String new_pass){
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("mem_email", mem_email);
		map.put("new_pass", new_pass);
		sqlSession.update("member.pwUpdate", map);
	}
	/* 관리자 회원관리 로직 */


	// admin 회원 조회
	@Override
	public List<MemberDTO> memberList() {
		return sqlSession.selectList("admin.adminMemberList");
	}
	// admin 회원 상세 정보 조회
	@Override
	public MemberDTO adminViewMember(int mem_num) {
		return sqlSession.selectOne("admin.adminMemberView",mem_num);
	}
	// admin 회원 정보 업데이트
	@Override
	public void adminupdateMember(MemberDTO dto) {
		sqlSession.update("admin.updateMember" , dto);
	}

	// admin 메인 페이지 회원 레코드 조회
	@Override
	public int memberCount() throws Exception {
		return sqlSession.selectOne("admin.memberCount");
	}

	@Override
	public ResponseResultList listPage(PagingInfoVO vo) {
		HashMap<String, Object> data = new HashMap<>();

		data.put("pageNum", vo.getPageNum());
		data.put("pageRowCount", vo.getPageRowCount());
		data.put("searchType", vo.getStype());
		data.put("keyword", vo.getSdata());

		List<MemberDTO> resultdata = sqlSession.selectList("admin.listPage",data);
		Integer cnt =(Integer) sqlSession.selectOne("admin.listPageCount", data);

		PagingInfoVO pagingInfoVO = new PagingInfoVO(vo.getPageNum(),cnt,vo.getPageRowCount());

		ResponseResultList responseResultList = new ResponseResultList();
		responseResultList.setPagingInfo(pagingInfoVO);
		responseResultList.setBody(resultdata);


		return responseResultList;
	}


}