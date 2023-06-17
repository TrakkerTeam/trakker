package com.example.trakker.item.bean;

import lombok.Data;

@Data
public class ItemVO {
    private long iidx = -2;
    private String title = ""; // 제목
    private String content = ""; // 내용
    private String author = ""; // 글쓴이
}

// VO란?
// Value Object ) 값 오브젝트로써 값을 위해 쓰인다.
// read-Only 특징(사용하는 도중에 변경 불가능하며 오직 읽기만 가능)을 가집니다.
// DTO와 유사하지만 DTO는 setter를 가지고 있어 값이 변할 수 있다.
