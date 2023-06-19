package com.example.trakker.service.trip;

import com.example.trakker.model.trip.dao.TripDAO;
import com.example.trakker.model.trip.dto.TripDTO;
import com.example.trakker.utils.ItemSearchVO;
import com.example.trakker.utils.ResponseResultList;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
@RequiredArgsConstructor
public class TripService {

    @Autowired
    private TripDAO tripDao;


    public List<TripDTO> list() throws Exception{
        return tripDao.list();
    }


    public void insert(TripDTO dto) throws Exception {
        tripDao.insert(dto);
    }

    public void update(TripDTO dto) throws Exception {
        tripDao.update(dto);
    }

    public void delete(int t_num) throws Exception {
        tripDao.delete(t_num);
    }

    public void increaseViewcnt(int t_num, HttpSession session) throws Exception {
        tripDao.increaseViewcnt(t_num, session);
        long update_time=0;
        if(session.getAttribute("update_time_"+t_num)!=null) {
            update_time=(long)session.getAttribute("update_time_"+t_num);
        }
        long current_time=System.currentTimeMillis();
        if(current_time - update_time > 5*1000) {
            tripDao.increaseViewcnt(t_num, session);
            session.setAttribute("update_time_"+t_num, current_time);
        }
    }

    public TripDTO view(int t_num) throws Exception {
        return tripDao.view(t_num);
    }

    public ResponseResultList listPage(ItemSearchVO vo){
        return tripDao.listPage(vo);
    }
}
