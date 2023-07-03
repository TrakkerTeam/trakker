package com.example.trakker.service.heart;

import com.example.trakker.item.HeartDAO;
import com.example.trakker.item.HeartDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class HeartServiceImpl implements HeartService {

    @Autowired
    HeartDAO heartDAO;

    //좋아요
    @Transactional
    @Override
    public void heartCheck(HeartDTO dto) {
        if(dto.getMh()==0) {
            heartDAO.insert(dto);
        }else if(dto.getMh()==1) {
            heartDAO.delete(dto);
        }
    }

    //회원 탈퇴 - memberService로 이동해야하지 않나??
    @Override
    public void deleteMember(Long memNum) {
        heartDAO.deleteMember(memNum);
    }

}