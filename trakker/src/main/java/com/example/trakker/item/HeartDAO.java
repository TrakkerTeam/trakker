package com.example.trakker.item;

import java.util.List;

public interface HeartDAO {

    Integer getCount(Integer memNum);
    List<HeartDTO> getList(Integer memNum);

    void insert(Integer memNum, Integer planNum);

    void delete(Integer memNum, Integer planNum);


}
