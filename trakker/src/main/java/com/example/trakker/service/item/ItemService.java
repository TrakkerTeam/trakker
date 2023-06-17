package com.example.trakker.service.item;

import com.example.trakker.common.ResponseResultList;
import com.example.trakker.item.bean.ItemSearchVO;

public interface ItemService {

    ResponseResultList getItemList(ItemSearchVO vo);

}
