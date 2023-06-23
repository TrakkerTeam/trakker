package com.example.trakker.model.review.dao;

import com.example.trakker.model.review.dto.R_commentDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class R_commentDAOImpl implements R_commentDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<R_commentDTO> commentList(R_commentDTO dto) {
        return sqlSession.selectList("r_comment.commentList", dto);
    }

    @Override
    public void insert(R_commentDTO dto) {
        sqlSession.insert("r_comment.c_insert", dto);
    }

    @Override
    public void update(long comment_num, String editContent) {
        Map<String, Object> map = new HashMap<>();
        map.put("editContent",editContent);
        map.put("comment_num",comment_num);
        sqlSession.update("r_comment.c_update",map);
    }

    @Override
    public long delete(long comment_num) {
        return sqlSession.update("r_comment.c_delete",comment_num);
    }

    @Override
    public void addInsert(long mem_num, long review_num, long comment_num, Integer l_num, String addContent) {
        Map<String, Object> map = new HashMap<>();
        map.put("review_num",review_num);
        map.put("comment_num",comment_num);
        map.put("l_num",l_num);
        map.put("addContent",addContent);
        map.put("mem_num",mem_num);
        sqlSession.insert("r_comment.c_addInsert",map);
    }
}
