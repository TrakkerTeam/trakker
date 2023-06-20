package com.example.trakker.service.heart;

import com.example.trakker.item.HeartDTO;

import java.util.List;
import java.util.Map;

public interface HeartService {

    List<HeartDTO> selectHeartList(Map param);

    void insertHeart(Integer memNum, Integer planNum);

    void deleteHeart(Integer memNum, Integer planNum);

}
