package com.example.trakker.item;

import lombok.AccessLevel;
import lombok.Data;
import lombok.Setter;

@Data
@Setter(AccessLevel.NONE)
public class LocalDTO {
    private final Integer L_NUM;
    private final String K_NAME;
    private final String E_NAME;

}