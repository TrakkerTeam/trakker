package com.example.trakker.service.review;

import com.example.trakker.model.review.dao.R_commentDAO;
import com.example.trakker.model.review.dto.R_commentDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class R_commentServiceImpl implements R_commentService {

    @Autowired
    private R_commentDAO commentDAO;

    @Override
    public List<R_commentDTO> commentList(R_commentDTO dto) {
        return commentDAO.commentList(dto);
    }

    @Override
    public void insert(R_commentDTO dto) {
        commentDAO.insert(dto);
    }

    @Override
    public void update(long comment_num, String editContent) {
        commentDAO.update(comment_num, editContent);
    }

    @Override
    public long delete(long comment_num) {
        return commentDAO.delete(comment_num);
    }

    @Override
    public void addInsert(long mem_num, long review_num, long comment_num, Integer lnum, String addContent) {
        commentDAO.addInsert(mem_num, review_num, comment_num, lnum, addContent);
    }

}

