package com.example.trakker.item.entity;

import com.example.trakker.common.PagingInfoEntity;
import com.example.trakker.item.bean.ItemVO;
import lombok.Getter;
import jakarta.persistence.Entity;

@Entity
@Getter
public class ItemEntity extends PagingInfoEntity {

    private long iidx = -2;

    private String title = "";
    private String content = "";
    private String author = "";


    public ItemVO toItemVO(){
        ItemVO vo = new ItemVO();
        vo.setIidx(this.getIidx());
        vo.setTitle(this.getTitle());
        vo.setContent(this.getContent());
        vo.setAuthor(this.getAuthor());

        return vo;
    }

}
