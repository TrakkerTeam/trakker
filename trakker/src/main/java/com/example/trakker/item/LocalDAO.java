package com.example.trakker.item;

import java.util.List;

public interface LocalDAO {
    int getCount();
    String getName(Integer lNum);
    List<LocalDTO> getList();
}
