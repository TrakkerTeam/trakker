package com.example.trakker.item;

import lombok.AccessLevel;
import lombok.Data;
import lombok.Setter;

@Data
@Setter(AccessLevel.NONE)
public class LocalDTO {
    private  Integer l_num;
    private  String k_name;
    private  String e_name;

}