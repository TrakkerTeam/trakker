package com.example.trakker.service;

import com.example.trakker.item.HeartDTO;

import java.util.List;

public interface HeartService {

    //마이페이지 좋아요 목록
    List<HeartDTO> selectHeartList(Integer memNum);

    //좋아요 추가
    void insertHeart(Integer memNum, Integer planNum);

    //좋아요 취소
    void deleteHeart(Integer memNum, Integer planNum);

}
