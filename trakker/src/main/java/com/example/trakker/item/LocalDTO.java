package com.example.trakker.item;

import lombok.AccessLevel;
import lombok.Data;
import lombok.Setter;

@Data
@Setter(AccessLevel.NONE)
public class LocalDTO {
    private Integer lnum;
    private String kname;
    private String ename;


}