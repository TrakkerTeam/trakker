package com.example.trakker.service.trip;

import com.example.trakker.item.RatingDTO;
import com.example.trakker.model.trip.dto.TripDTO;
import com.example.trakker.utils.PagingInfoVO;
import com.example.trakker.utils.ResponseResultList;

import java.util.List;


public interface TripService {

    List<TripDTO> list() throws Exception;
    void update(TripDTO dto) throws Exception;
    void delete(long t_num) throws Exception;
    TripDTO view(long t_num) throws Exception;
    ResponseResultList listPage(PagingInfoVO vo);
    Double ratingAvg(long t_num);
    void ratingInsert(RatingDTO dto);
}
