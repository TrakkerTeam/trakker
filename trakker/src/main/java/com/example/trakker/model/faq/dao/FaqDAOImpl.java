package com.example.trakker.model.faq.dao;

import com.example.trakker.model.faq.dto.FaqDTO;
import com.example.trakker.utils.ItemSearchVO;
import com.example.trakker.utils.PagingInfoVO;
import com.example.trakker.utils.ResponseResultList;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
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
    public void delete(int faq_num) throws Exception {
        sqlSession.delete("faq.delete", faq_num);
    }

    @Override
    public void increaseViewcnt(int faq_num, HttpSession session) throws Exception {
        sqlSession.update("faq.increaseViewcnt", faq_num);
    }

    @Override
    public FaqDTO view(int faq_num) throws Exception {
        return sqlSession.selectOne("faq.view", faq_num);
    }

    @Override
    public Integer count(Map data) {
        return sqlSession.selectOne("faq.listPageCount", data);
    }

    @Override
    public List<FaqDTO> listPage(Map data) {
        return sqlSession.selectList("faq.listPage", data);
    }
}
