package com.example.trakker.item;

import lombok.AccessLevel;
import lombok.Data;
import lombok.Setter;

@Data
@Setter(AccessLevel.NONE)
public class LocalDTO {
    private Integer L_NUM;
    private String K_NAME;
    private String E_NAME;

}