package com.example.trakker.utils;

import java.util.List;

public class PagingInfoVO extends BaseVO {
  private int pageNum;
  private long pageTotalCount;
  private int pageRowCount = 9;
  private int lastPageNum = 0;

  public PagingInfoVO(){
    this.pageNum = 1;
    this.pageTotalCount = 0;
    this.lastPageNum = 0;
  }


  public PagingInfoVO(int pageNum, long pageTotalCount, int pageRowCount) {
    this.pageNum = pageNum;
    this.pageTotalCount = pageTotalCount;
    this.pageRowCount = pageRowCount;

    if (pageTotalCount > 0){
      if(pageTotalCount % pageRowCount > 0){
        this.lastPageNum = Math.toIntExact((pageTotalCount / pageRowCount) + 1);
      }else{
        this.lastPageNum = Math.toIntExact(pageTotalCount / pageRowCount);
      }
      this.pageRowCount = pageRowCount;
    }

  }

  public int getPageNum() {
    return pageNum;
  }

  public void setPageNum(int pageNum) {
    this.pageNum = pageNum;
  }

  public long getPageTotalCount() {
    return pageTotalCount;
  }

  public void setPageTotalCount(long pageTotalCount) {
    this.pageTotalCount = pageTotalCount;
  }

  public int getPageRowCount() {
    return pageRowCount;
  }

  public void setPageRowCount(int pageRowCount) {
    this.pageRowCount = pageRowCount;
  }

  public int getLastPageNum() {
    return lastPageNum;
  }

  public void setLastPageNum(int lastPageNum) {
    this.lastPageNum = lastPageNum;
  }

}
