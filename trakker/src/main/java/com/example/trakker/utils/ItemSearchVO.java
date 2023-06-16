package com.example.trakker.utils;

import com.example.trakker.utils.PagingInfoVO;
import lombok.Data;

@Data
public class ItemSearchVO extends PagingInfoVO {
    private long iidx = -2;
    private String faq_subject;
    private String content;
}
