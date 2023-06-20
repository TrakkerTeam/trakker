package com.example.trakker.service.trip;

import com.example.trakker.model.trip.dao.TripDAO;
import com.example.trakker.model.trip.dto.TripDTO;
import com.example.trakker.utils.ItemSearchVO;
import com.example.trakker.utils.PagingInfoVO;
import com.example.trakker.utils.ResponseResultList;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;


public interface TripService {

    public List<TripDTO> list() throws Exception;
    public void insert(TripDTO dto) throws Exception;
    public void update(TripDTO dto) throws Exception;
    public void delete(int t_num) throws Exception;
    public TripDTO view(int t_num) throws Exception;
    public ResponseResultList listPage(PagingInfoVO vo);
}
