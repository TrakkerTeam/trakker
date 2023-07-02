package com.example.trakker.oauth.dao;

import com.example.trakker.model.member.dto.MemberDTO;

public interface OauthUserDAO {

    public void insertNaverUser(MemberDTO dto);

    void insertKakaoUser(MemberDTO dto);

    MemberDTO userCheck(String nickname);
}
