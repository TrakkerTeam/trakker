package com.example.trakker.service.heart;

import com.example.trakker.item.HeartDAO;
import com.example.trakker.item.HeartDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class HeartServiceImpl implements HeartService {

    @Autowired
    HeartDAO heartDAO;

    //마이페이지 좋아요 목록
    @Override
    public List<HeartDTO> selectHeartList(Map param) {
        heartDAO.getCount(param);
        heartDAO.getList(param);
        return null;
    }

    //좋아요 추가
    @Override
    public void insertHeart(Integer memNum, Integer planNum) {
        heartDAO.insert(memNum, planNum);
    }

    //좋아요 취소
    @Override
    public void deleteHeart(Integer memNum, Integer planNum) {
        heartDAO.delete(memNum, planNum);
    }
}
