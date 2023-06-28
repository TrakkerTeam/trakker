package com.example.trakker.model.trip.dao;


import com.example.trakker.item.RatingDTO;
import com.example.trakker.model.trip.dto.TripDTO;


import java.util.List;
import java.util.Map;

public interface TripDAO {
    List<TripDTO> list() throws Exception;
    void insert(TripDTO dto) throws Exception;
    void update(TripDTO dto) throws Exception;
    void delete(long t_num) throws Exception;
    TripDTO view(long t_num) throws Exception;
    int count(Map data);
    List<TripDTO> listPage(Map data);
    void addAttach(String fullName);
    void deleteFile(String fullName);
    List<String> getAttach(long t_num);
    void updateAttach(String fullName, long t_num);
    Double ratingAvg(long t_num);
    void ratingInsert(RatingDTO dto);
}
