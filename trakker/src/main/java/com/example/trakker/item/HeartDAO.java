package com.example.trakker.item;

public interface HeartDAO {

    void insert(HeartDTO dto);
    void delete(HeartDTO dto);

    void deletePlanner(Long planNum);

    void deleteMember(Long memNum);
}
