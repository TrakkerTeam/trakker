package com.example.trakker.service.trip;

import com.example.trakker.model.trip.dao.TripDAO;
import com.example.trakker.model.trip.dto.TripDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class TripServiceImpl implements TripService{

    @Autowired
    TripDAO tripDao;

    @Override
    public List<TripDTO> list(){
        return tripDao.list();
    }

    @Transactional
    @Override
    public void write(TripDTO dto) throws Exception{
        tripDao.write(dto);

    }
}
