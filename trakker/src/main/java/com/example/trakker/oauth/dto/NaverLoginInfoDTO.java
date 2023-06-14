package com.example.trakker.oauth.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NaverLoginInfoDTO {

    private Long user_num;
    private String user_id;
    private String user_email;
    private String access_token;
    private String refresh_token;
    private String expires_in;
    private String token_type;
    private Date create_date;



}
