package com.example.trakker.model.trip.dto;


import com.example.trakker.item.RatingDTO;
import com.example.trakker.model.item.AttachDTO;
import com.example.trakker.model.item.RatingDTO;
import lombok.Data;


import java.util.Date;

@Data
public class TripDTO{
    private long t_num;
    private String t_subject;
    private String content;
    private Date t_regdate;
    private RatingDTO rating;
    private Integer prev;
    private Integer next;
}
