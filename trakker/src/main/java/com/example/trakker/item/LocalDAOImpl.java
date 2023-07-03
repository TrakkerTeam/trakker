package com.example.trakker.item;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class LocalDAOImpl implements LocalDAO {

    @Autowired
    SqlSession sqlSession;

    @Override
    public String getName(Integer lNum) {
        return sqlSession.selectOne("local.selectK", lNum);
    }

    @Override
    public List<LocalDTO> getList() {
        return sqlSession.selectList("local.list");
    }
}
