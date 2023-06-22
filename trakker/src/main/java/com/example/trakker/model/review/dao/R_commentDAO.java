package com.example.trakker.model.review.dao;

import com.example.trakker.model.review.dto.R_commentDTO;

import java.util.List;
import java.util.Map;

public interface R_commentDAO {
    List<R_commentDTO> commentList(long review_num);
    void insert(R_commentDTO dto);
    void update(long comment_num, String editContent);
    long delete(long comment_num);
    void addInsert(long mem_num, long review_num, long comment_num, Integer l_num, String addContent);
}
