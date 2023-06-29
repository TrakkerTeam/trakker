package com.example.trakker.oauth.service;


import com.example.trakker.model.member.dto.MemberDTO;


public interface OauthUserService {

    void insertNaverUser(MemberDTO dto);

    void insertKakaoUser(MemberDTO dto);

    MemberDTO userCheck(String nickname);
}
