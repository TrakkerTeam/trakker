package com.example.trakker.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class ResponseResultList extends ResponseResult {
    private List body = null;

    public List getBody() {
        List resultList = new ArrayList();
        resultList.addAll(body);
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
        this.addMetaItem("pagingInfo", vo);
    }
}