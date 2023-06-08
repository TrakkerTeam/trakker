package com.example.trakker.model.faq.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.example.trakker.model.faq.dto.FaqDTO;

import javax.servlet.http.HttpSession;


@Repository
public class FaqDAOImpl implements FaqDAO {

    @Autowired
    SqlSession sqlSession;

    @Override
    public List<FaqDTO> list() throws Exception{
        return sqlSession.selectList("faq.list");
    }

    @Override
    public void insert(FaqDTO dto) throws Exception {

    }

    @Override
    public void create(FaqDTO dto) throws Exception {
        sqlSession.insert("faq.insert",dto);

    }

    @Override
    public void update(FaqDTO dto) throws Exception {
        sqlSession.update("faq.update", dto);
    }

    @Override
    public void delete(int faq_num) throws Exception {
        sqlSession.delete("faq.delete", faq_num);
    }

    @Override
    public void increaseViewcnt(int faq_num) throws Exception {
        sqlSession.update("faq.increaseViewcnt", faq_num);
    }

    @Override
    public FaqDTO view(int faq_num) throws Exception {
        return null;
    }

}