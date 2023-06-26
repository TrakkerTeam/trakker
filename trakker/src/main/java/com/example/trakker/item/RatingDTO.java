package com.example.trakker.item;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class RatingDTO {
    private Long t_num; // 시퀀스
    private Integer mem_num; // 회원 번호
    private Integer review_num; // 리뷰 번호
    private Double rating; // 별점

    private Double ratingAvg; // 별점 총합


}
