package com.example.trakker.service.admin;


import com.example.trakker.model.member.dao.MemberDAO;
import com.example.trakker.model.member.dto.MemberDTO;

import com.example.trakker.model.review.dao.ReviewDAO;
import com.example.trakker.model.review.dto.ReviewDTO;
import com.example.trakker.utils.PagingInfoVO;
import com.example.trakker.utils.ResponseResultList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class AdminServiceImpl implements AdminService{

    @Autowired
    MemberDAO memberDao;

    @Autowired
    ReviewDAO reviewDAO;


    public List<MemberDTO> memberList() {

        return  memberDao.memberList();
    }


    public MemberDTO adminViewMember(int mem_num) {

        return memberDao.adminViewMember(mem_num);
    }



    public void updateMember(MemberDTO dto) {
        memberDao.adminupdateMember(dto);
    }


    public int memberCount() throws Exception {
        return memberDao.memberCount();
    }


    public ResponseResultList listPage(PagingInfoVO vo){

        return memberDao.listPage(vo);
    }

    @Override
    public MemberDTO getupdateMember(String mem_email) {
        return memberDao.viewMember(mem_email);
    }

    @Override
    public ResponseResultList ReviewlistPage(PagingInfoVO vo) {
        HashMap<String, Object> data = new HashMap<String, Object>();
        data.put("pageNum", vo.getPageNum());
        data.put("pageRowCount", vo.getPageRowCount());
        data.put("searchType", vo.getStype());
        data.put("keyword", vo.getSdata());
        data.put("area", vo.getArea());
        data.put("sort", vo.getSort());
        int total = reviewDAO.total(data);
        List<ReviewDTO> list = reviewDAO.list(data);
        PagingInfoVO pagingInfoVO = new PagingInfoVO(vo.getPageNum(), total, vo.getPageRowCount());
        ResponseResultList resultList = new ResponseResultList();
        resultList.setBody(list);
        resultList.setPagingInfo(pagingInfoVO);
        return resultList;
    }


}