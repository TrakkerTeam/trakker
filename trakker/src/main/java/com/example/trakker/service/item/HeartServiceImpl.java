package com.example.trakker.service.item;

import com.example.trakker.item.HeartDAO;
import com.example.trakker.item.HeartDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class HeartServiceImpl implements HeartService {
    @Autowired
    HeartDAO heartDAO;

    @Transactional
    @Override
    public void heartCheck(HeartDTO dto) {
        if(dto.getMh()==0) {
            heartDAO.insert(dto);
        }else if(dto.getMh()==1) {
            heartDAO.delete(dto);
        }
    }
}