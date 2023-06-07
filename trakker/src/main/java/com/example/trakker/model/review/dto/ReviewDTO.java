//DB의 review용 ReviewDTO

package com.example.trakker.model.review.dto;

import com.example.trakker.model.local.dto.LocalDTO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter
@Setter
@ToString
public class ReviewDTO {
    private Integer review_num;
    private Integer MEM_NUM;
    private Integer L_NUM;
    private String title;
    private String content;
    private Date review_date;
    private int readcount;
    private Date edit_date;
    private LocalDTO local;

}
