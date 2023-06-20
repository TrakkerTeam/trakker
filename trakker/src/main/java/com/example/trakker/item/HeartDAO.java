package com.example.trakker.item;

import java.util.List;
import java.util.Map;

public interface HeartDAO {

    Integer getCount(Map param);
    List<HeartDTO> getList(Map param);

    void insert(Integer memNum, Integer planNum);

    void delete(Integer memNum, Integer planNum);

    void deletePlanner(Integer planNum);

}
