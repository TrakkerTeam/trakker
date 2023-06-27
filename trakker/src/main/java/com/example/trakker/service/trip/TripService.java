package com.example.trakker.service.trip;

import com.example.trakker.item.RatingDTO;
import com.example.trakker.model.trip.dto.TripDTO;
import com.example.trakker.utils.PagingInfoVO;
import com.example.trakker.utils.ResponseResultList;

import java.util.List;


public interface TripService {

    List<TripDTO> list() throws Exception;
    void insert(TripDTO dto) throws Exception;
    void update(TripDTO dto) throws Exception;
    void delete(long t_num) throws Exception;
    TripDTO view(long t_num) throws Exception;
    ResponseResultList listPage(PagingInfoVO vo);
    void deleteFile(String fullName); //첨부파일 삭제
    List<String> getAttach(long t_num); //첨부파일 정보
    void addAttach(String fullName); //첨부파일 저장
    void updateAttach(String fullName, long t_num);//첨부파일 수정

    //리뷰 총점
    Double ratingAvg(long t_num);

    void ratingInsert(RatingDTO dto);
}
