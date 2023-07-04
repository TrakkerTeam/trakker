package com.example.trakker.model.faq.dao;

import com.example.trakker.model.faq.dto.FaqDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Map;

@Repository
public class FaqDAOImpl implements FaqDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<FaqDTO> list() throws Exception {
        return sqlSession.selectList("faq.list");
    }

    @Override
    public void insert(FaqDTO dto) throws Exception {
        sqlSession.insert("faq.insert", dto);
    }

    @Override
    public void update(FaqDTO dto) throws Exception {
        sqlSession.update("faq.update", dto);
    }

    @Override
    public void delete(long faq_num) throws Exception {
        sqlSession.delete("faq.delete", faq_num);
    }

    @Override
    public void increaseViewcnt(long faq_num) throws Exception {
        sqlSession.update("faq.increaseViewcnt", faq_num);
    }

    @Override
    public FaqDTO view(long faq_num) throws Exception {
        return sqlSession.selectOne("faq.view", faq_num);
    }

    @Override
    public int count(Map data) {
        return sqlSession.selectOne("faq.listPageCount", data);
    }

    @Override
    public List<FaqDTO> listPage(Map data) {
        return sqlSession.selectList("faq.listPage", data);
    }
}
