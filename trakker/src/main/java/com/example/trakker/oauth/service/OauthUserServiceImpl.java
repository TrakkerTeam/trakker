package com.example.trakker.oauth.service;

import com.example.trakker.model.member.dto.MemberDTO;
import com.example.trakker.oauth.dao.OauthUserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OauthUserServiceImpl implements OauthUserService {

    @Autowired
    OauthUserDAO oauthUserDAO;

    @Override
    public void insertNaverUser(MemberDTO dto) {

        oauthUserDAO.insertNaverUser(dto);

    }

    @Override
    public void insertKakaoUser(MemberDTO dto) {
        oauthUserDAO.insertKakaoUser(dto);
    }

    @Override
    public MemberDTO userCheck(String nickname) {
        return oauthUserDAO.userCheck(nickname);
    }
}
