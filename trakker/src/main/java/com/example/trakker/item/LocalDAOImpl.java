package com.example.trakker.item;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LocalDAOImpl implements LocalDAO {

    @Autowired
    SqlSession sqlSession;

    @Override
    public String getName(Integer lNum) {
        return sqlSession.selectOne("local.kName", lNum);
    }


}
