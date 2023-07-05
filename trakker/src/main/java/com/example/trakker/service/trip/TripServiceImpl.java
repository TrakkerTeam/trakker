package com.example.trakker.service.trip;

import com.example.trakker.model.item.RatingDTO;
import com.example.trakker.model.trip.dao.TripDAO;
import com.example.trakker.model.trip.dto.TripDTO;
import com.example.trakker.utils.PagingInfoVO;
import com.example.trakker.utils.ResponseResultList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.HashMap;
import java.util.List;


@Service
public class TripServiceImpl implements TripService {

    @Autowired
    private TripDAO tripDao;

    @Override
    public List<TripDTO> list() throws Exception{
        return tripDao.list();
    }

    @Transactional
    @Override
    public void insert(TripDTO dto) throws Exception {
        tripDao.insert(dto);
        String[] files=dto.getFiles();
        if(files==null) return;
        for(String name : files) {
            tripDao.addAttach(name);
        }
    }
    @Override
    public void update(TripDTO dto) throws Exception {
        tripDao.update(dto);
        String[] files=dto.getFiles();
        if(files==null) return;
        for(String name : files) {
            System.out.println("첨부파일 이름 : "+name);
            tripDao.updateAttach(name, dto.getT_num());
        }
    }
    @Override
    public void delete(long t_num) throws Exception {
        tripDao.delete(t_num);
    }
    @Override
    public TripDTO view(long t_num) throws Exception {
        return tripDao.view(t_num);
    }
    @Override
    public ResponseResultList listPage(PagingInfoVO vo){
        HashMap<String, Object> data = new HashMap<>();
        data.put("pageNum", vo.getPageNum());
        data.put("pageRowCount", vo.getPageRowCount());
        data.put("searchType", vo.getStype());
        data.put("keyword", vo.getSdata());
        data.put("sort", vo.getSort());
        int count = tripDao.count(data);
        List<TripDTO>  list = tripDao.listPage(data);

        PagingInfoVO pagingInfoVO = new PagingInfoVO(vo.getPageNum(), count, vo.getPageRowCount());
        ResponseResultList resultList = new ResponseResultList();
        resultList.setBody(list);
        resultList.setPagingInfo(pagingInfoVO);
        return resultList;
    }

    @Override
    public void addAttach(String fullName) {

    }
    @Override
    public void deleteFile(String fullName) {
        tripDao.deleteFile(fullName);
    }
    @Override
    public List<String> getAttach(long t_num) {
        return tripDao.getAttach(t_num);
    }

    @Override
    public void updateAttach(String fullName, long t_num) {

    }

    @Override
    public Double ratingAvg(long t_num) {
        return tripDao.ratingAvg(t_num);
    }

    @Override
    public void ratingInsert(RatingDTO dto) {
        tripDao.ratingInsert(dto);
    }
}
