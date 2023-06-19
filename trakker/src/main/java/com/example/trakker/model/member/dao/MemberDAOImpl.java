package com.example.trakker.model.member.dao;


import com.example.trakker.utils.ItemSearchVO;
import com.example.trakker.utils.PagingInfoVO;
import com.example.trakker.utils.ResponseResultList;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.trakker.model.member.dto.MemberDTO;

import java.util.HashMap;
import java.util.List;

//memberMapper 와의 상호작용을 담당합니다
@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public String logincheck(MemberDTO dto) {
		String name = sqlSession.selectOne("member.logincheck",dto);
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
	public void updateMember(MemberDTO dto) {
		sqlSession.update("admin.updateMember" , dto);
	}

	// admin 메인 페이지 회원 레코드 조회
	@Override
	public int memberCount() throws Exception {
		return sqlSession.selectOne("admin.memberCount");
	}

	@Override
	public ResponseResultList listPage(ItemSearchVO vo) {
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