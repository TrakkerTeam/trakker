package com.example.trakker.service.trip;

import com.example.trakker.model.faq.dto.FaqDTO;
import com.example.trakker.model.trip.dao.TripDAO;
import com.example.trakker.model.trip.dto.TripDTO;
import com.example.trakker.utils.ItemSearchVO;
import com.example.trakker.utils.PagingInfoVO;
import com.example.trakker.utils.ResponseResultList;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class TripServiceImpl implements TripService {

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

    public TripDTO view(int t_num) throws Exception {
        return tripDao.view(t_num);
    }

    public ResponseResultList listPage(PagingInfoVO vo){
        HashMap<String, Object> data = new HashMap<>();
        data.put("pageNum", vo.getPageNum());
        data.put("pageRowCount", vo.getPageRowCount());
        data.put("searchType", vo.getStype());
        data.put("keyword", vo.getSdata());
        Integer count = tripDao.count(data);
        List<TripDTO>  list = tripDao.listPage(data);

        PagingInfoVO pagingInfoVO = new PagingInfoVO(vo.getPageNum(), count, vo.getPageRowCount());
        ResponseResultList resultList = new ResponseResultList();
        resultList.setBody(list);
        resultList.setPagingInfo(pagingInfoVO);
        return resultList;
    }
}
