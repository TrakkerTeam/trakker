package com.example.trakker.controller;

import com.example.trakker.common.ResponseResultList;
import com.example.trakker.item.bean.ItemSearchVO;
import com.example.trakker.service.item.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

//@Controller
public class ItemController {

    @Autowired
    private ItemService itemService;



    @RequestMapping(value = "/item/list",method = RequestMethod.GET)
    public String ItemList(
            HttpServletRequest request,
            Model model,
            ItemSearchVO vo
    ){
        ResponseResultList resultList = itemService.getItemList(vo);

        return null;
    }
}
