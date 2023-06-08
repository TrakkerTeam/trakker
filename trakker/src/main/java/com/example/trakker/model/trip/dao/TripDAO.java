package com.example.trakker.model.trip.dao;

import com.example.trakker.model.trip.dto.TripDTO;

import java.util.List;

public interface TripDAO {
    public List<TripDTO> list();
    public void write(TripDTO dto) throws Exception;
}
