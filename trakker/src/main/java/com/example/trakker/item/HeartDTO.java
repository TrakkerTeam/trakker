package com.example.trakker.item;

import lombok.Data;

@Data
public class HeartDTO {
    private Long planNum;
    private Long memNum;

    private Integer mh; //사용자 좋아요 여부
}
