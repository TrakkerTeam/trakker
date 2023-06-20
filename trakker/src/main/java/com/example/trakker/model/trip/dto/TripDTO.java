package com.example.trakker.model.trip.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TripDTO {
    private int t_num;
    private String t_subject;
    private String content;
    private int readcount;
    private Date t_regdate;

}
