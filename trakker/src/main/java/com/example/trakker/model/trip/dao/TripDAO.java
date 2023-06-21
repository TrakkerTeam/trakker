package com.example.trakker.model.trip.dao;


import com.example.trakker.model.trip.dto.TripDTO;
import com.example.trakker.utils.PagingInfoVO;
import com.example.trakker.utils.ResponseResultList;

import java.util.List;
import java.util.Map;

public interface TripDAO {
    List<TripDTO> list() throws Exception;
    void insert(TripDTO dto) throws Exception;
    void update(TripDTO dto) throws Exception;
    void delete(long t_num) throws Exception;
    TripDTO view(long t_num) throws Exception;
    Integer count(Map data);
    List<TripDTO> listPage(Map data);
}
