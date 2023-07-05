package com.example.trakker.model.item;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HeartDAOImpl implements HeartDAO {

    @Autowired
    SqlSession sqlSession;

    //좋아요 클릭
    @Override
    public void insert(HeartDTO dto) {
        sqlSession.insert("heart.insert", dto);
    }
    @Override
    public void delete(HeartDTO dto) {
        sqlSession.delete("heart.delete", dto);
    }

    //플래너 삭제
    public void deletePlanner(Long planNum) {
        sqlSession.delete("heart.deletePlanner", planNum);
    }

    //회원 탈퇴
    public void deleteMember(Long memNum){
        sqlSession.delete("heart.deleteMember", memNum);
    }
}
