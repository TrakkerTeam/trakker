package com.example.trakker.item.dao;

import com.example.trakker.item.entity.ItemEntity;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface ItemDAO {


    Integer getItemListTotalCount(Map<String, Object> param); // 게시물 토탈 개수

    List<ItemEntity> getItemList(Map<String, Object> param); // 게시물 목록
}
