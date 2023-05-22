package com.example.trakker.model.faq.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.trakker.model.faq.dto.FaqDTO;

@Repository
public class FaqDAOImpl implements FaqDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<FaqDTO> list(){
		return sqlSession.selectList("faq.list");
	}

	@Override
	public void write(FaqDTO dto) throws Exception {
		sqlSession.insert("faq.insert",dto);
		
	}

}
