package com.example.trakker.service.item;

import com.example.trakker.common.ResponseResultList;
import com.example.trakker.item.bean.ItemSearchVO;
import com.example.trakker.item.dao.ItemDAO;
import com.example.trakker.item.entity.ItemEntity;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ItemServiceImpl implements ItemService{


    @Autowired
    private ItemDAO itemDAO;

    @Override
    public ResponseResultList getItemList(ItemSearchVO vo) {
        Map<String, Object> param = new HashMap<>();

        Integer itemListTotalCount = itemDAO.getItemListTotalCount(param);
        List<ItemEntity> itemList = itemDAO.getItemList(param);
        return null;
    }
}
