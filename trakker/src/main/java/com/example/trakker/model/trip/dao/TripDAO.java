package com.example.trakker.model.trip.dao;


import com.example.trakker.model.faq.dto.FaqDTO;
import com.example.trakker.model.trip.dto.TripDTO;
import com.example.trakker.utils.ItemSearchVO;
import com.example.trakker.utils.PagingInfoVO;
import com.example.trakker.utils.ResponseResultList;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

public interface TripDAO {
    List<TripDTO> list() throws Exception;
    void insert(TripDTO dto) throws Exception;
    void update(TripDTO dto) throws Exception;
    void delete(int t_num) throws Exception;
    TripDTO view(int t_num) throws Exception;
    Integer count(Map data);
    List<TripDTO> listPage(Map data);
}
