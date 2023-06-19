package com.example.trakker.model.trip.dao;


import com.example.trakker.model.trip.dto.TripDTO;
import com.example.trakker.utils.ItemSearchVO;
import com.example.trakker.utils.ResponseResultList;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface TripDAO {
    List<TripDTO> list() throws Exception;
    void insert(TripDTO dto) throws Exception;
    void update(TripDTO dto) throws Exception;
    void delete(int t_num) throws Exception;
    void increaseViewcnt(int t_num, HttpSession session) throws Exception;
    TripDTO view(int t_num) throws Exception;
    ResponseResultList listPage(ItemSearchVO vo);
}
