package com.example.trakker.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class ResponseResultList extends ResponseResult {
    private List body = null;

    private int egovExpressStartPageNum = 0;

    public int getEgovExpressStartPageNum() {
        return egovExpressStartPageNum;
    }

    public void setEgovExpressStartPageNum(int egovExpressStartPageNum) {
        this.egovExpressStartPageNum = egovExpressStartPageNum;
    }

    public List getBody() {
        List resultList = new ArrayList();
        resultList.addAll(body);
//        for (int i=0;i<body.size();i++){
//            resultList.add(body.get(i));
//        }

        return resultList;
    }

    public void setBody(List body) {
        List resultList = new ArrayList();
        if (body != null){
            resultList.addAll(body);
        }

        this.body = resultList;
    }

    public void setPagingInfo(PagingInfoVO vo) {
        if (this.getMeta() == null) {
            this.setMeta(new HashMap<String, Object>());
        }

//        if (vo.getPageNum() == null){
//            vo.setPageNum(0);
//        }
//
//        if (vo.getPageTotalCount() == null){
//            vo.setPageTotalCount(0);
//        }


        this.addMetaItem("pagingInfo", vo);
    }
}
