package com.example.trakker.model.trip.dto;


import com.example.trakker.item.AttachDTO;
import com.example.trakker.item.RatingDTO;
import lombok.Data;


import java.util.Date;

@Data
public class TripDTO{
    private long t_num;
    private String t_subject;
    private String content;
    private Date t_regdate;
    private String[] files;
    private String fullName;
    private AttachDTO attach;
    private RatingDTO rating;
    private Integer prev;
    private Integer next;
}
