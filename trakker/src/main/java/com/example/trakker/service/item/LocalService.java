package com.example.trakker.service.item;

import com.example.trakker.item.LocalDTO;

import java.util.List;

public interface LocalService {
    int localCount();

    String selectLocal(Integer lNum);

    List<LocalDTO> localList();
}