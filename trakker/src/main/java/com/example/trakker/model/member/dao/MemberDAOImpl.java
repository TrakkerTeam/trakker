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
	public void pwUpdate(String mem_email, String new_pass){
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("mem_email", mem_email);
		map.put("new_pass", new_pass);
		sqlSession.update("member.pwUpdate", map);
	}

	@Override
	public List<MemberDTO> memberList() {
		return sqlSession.selectList("admin.adminMemberList");
	}

	@Override
	public MemberDTO adminViewMember(int mem_num) {
		return sqlSession.selectOne("admin.adminMemberView",mem_num);
	}

	@Override
	public void adminupdateMember(MemberDTO dto) {
		sqlSession.update("admin.updateMember" , dto);
	}


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