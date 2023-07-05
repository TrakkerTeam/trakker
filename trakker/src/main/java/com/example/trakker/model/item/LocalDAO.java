package com.example.trakker.model.item;

import java.util.List;

public interface LocalDAO {
    int getCount();
    LocalDTO getLocal(Integer lNum);
    List<LocalDTO> getList();
}
