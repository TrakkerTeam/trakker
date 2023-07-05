package com.example.trakker.model.item;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class LocalDAOImpl implements LocalDAO {

    @Autowired
    SqlSession sqlSession;

    @Override
    public int getCount() { return sqlSession.selectOne("local.count");}
    @Override
    public LocalDTO getLocal(Integer lNum) {
        return sqlSession.selectOne("local.select", lNum);
    }

    @Override
    public List<LocalDTO> getList() {
        return sqlSession.selectList("local.list");
    }
}
