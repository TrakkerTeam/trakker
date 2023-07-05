package com.example.trakker.oauth.dao;


import com.example.trakker.model.member.dto.MemberDTO;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OauthUserDAOImpl implements OauthUserDAO{

    @Autowired
    SqlSession session;

    @Override
    public void insertNaverUser(MemberDTO dto) {

        session.insert("oauth.naverInsert",dto);

    }

    @Override
    public void insertKakaoUser(MemberDTO dto) {

        session.insert("oauth.kakaoInsert",dto);
    }

    @Override
    public MemberDTO userCheck(String nickname) {

        return session.selectOne("oauth.userCehck",nickname);
    }
}
