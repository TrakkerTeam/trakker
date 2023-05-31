package com.example.trakker.service.trip;

import com.example.trakker.model.trip.dto.TripDTO;

import java.util.List;

public interface TripService {
    public List<TripDTO> list();
    public void write(TripDTO dto) throws Exception;
}
