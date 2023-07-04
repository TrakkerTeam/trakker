package com.example.trakker.item;

import lombok.Data;

@Data
public class RatingDTO {
    private long mem_num;
    private long t_num;
    private long review_num;
    private Double rating;
    private Double ratingAvg;
}
