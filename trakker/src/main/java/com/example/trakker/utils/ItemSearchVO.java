package com.example.trakker.utils;

import com.example.trakker.utils.PagingInfoVO;
import lombok.Data;

@Data
public class ItemSearchVO extends PagingInfoVO {
    private long mem_num = -2;
    private String mem_name;
    private String mem_email;
}
