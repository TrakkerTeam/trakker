package com.example.trakker.item;

import java.util.List;

public interface LocalDAO {
    String getName(Integer lNum);
    List<LocalDTO> getList();
}
