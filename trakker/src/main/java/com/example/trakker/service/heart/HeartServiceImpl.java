package com.example.trakker.service.heart;

import com.example.trakker.item.HeartDAO;
import com.example.trakker.item.HeartDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HeartServiceImpl implements HeartService {

    @Autowired
    HeartDAO heartDAO;

    @Override
    public List<HeartDTO> selectHeartList(Integer memNum) {
        heartDAO.getCount(memNum);
        heartDAO.getList(memNum);
        return null;
    }

    @Override
    public void insertHeart(Integer memNum, Integer planNum) {
        heartDAO.insert(memNum, planNum);
    }

    @Override
    public void deleteHeart(Integer memNum, Integer planNum) {
        heartDAO.delete(memNum, planNum);
    }
}
