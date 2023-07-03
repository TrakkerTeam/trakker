package com.example.trakker.utils;

import com.fasterxml.jackson.annotation.JsonRootName;

import java.util.HashMap;

@JsonRootName(value="responseResult")
public class ResponseResult {

    public static final String RESULT_SUCCESS = "success";
    public static final String RESULT_FAIL = "fail";
    public static final String RESULT_FAIL_VALIDATION = "failValidation";
    public static final String RESULT_FAIL_DUPLICATE = "failDuplicate";
    public static final String RESULT_FAIL_CONSTRAINT_VIOLATION = "failConstraintViolation";

    private String status = ResponseResult.RESULT_SUCCESS;
    private String msg;
    private HashMap<String, Object> meta;

    //상세페이지 이전,다음 값
    private Long prev;
    private Long next;
    public Long getPrev() {
        return prev;
    }
    public void setPrev(Long prev) {
        this.prev = prev;
    }
    public Long getNext() {
        return next;
    }
    public void setNext(Long next) {
        this.next = next;
    }

    public void addMetaItem(String key, Object value){
        if (meta == null){
            meta = new HashMap<String, Object>();
        }
        meta.put(key, value);
    }

    public HashMap<String, Object> getMeta() {
        HashMap<String, Object> returnMap = new HashMap<String, Object>();
        if (meta != null){
            for( String key : meta.keySet() ){
                returnMap.put(key, meta.get(key));
            }
        }

        return returnMap;
    }

    public void setMeta(HashMap<String, Object> meta) {
        HashMap<String, Object> returnMap = new HashMap<String, Object>();
        if (meta != null){
            for( String key : meta.keySet() ){
                returnMap.put(key, meta.get(key));
            }
        }

        this.meta = returnMap;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;

        if (this.status.equals(RESULT_FAIL_DUPLICATE)){
            this.msg = "Duplicated data.";
        }else if(this.status.equals(RESULT_FAIL_CONSTRAINT_VIOLATION)){
            this.msg = "constraint violation data";
        }



    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

}