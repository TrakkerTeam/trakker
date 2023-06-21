package com.example.trakker.utils;

import java.util.List;

public class PagingInfoVO extends BaseVO {
  private int pageNum;
  private int pageTotalCount;
  private int pageRowCount = 9;
  private int lastPageNum = 0;
  private boolean prev;
  private boolean next;
  private int startPageNum;


  public PagingInfoVO(){
    this.pageNum = 1;
    this.pageTotalCount = 0;
    this.lastPageNum = 0;
  }



  public PagingInfoVO(int pageNum, int pageTotalCount, int pageRowCount) {
    this.pageNum = pageNum;
    this.pageTotalCount = pageTotalCount;
    this.pageRowCount = pageRowCount;

    if (pageTotalCount > 0){
      if(pageTotalCount % pageRowCount > 0){
        this.lastPageNum = (pageTotalCount / pageRowCount) + 1;
      }else{
        this.lastPageNum = pageTotalCount / pageRowCount;
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

  public int getPageTotalCount() {
    return pageTotalCount;
  }

  public void setPageTotalCount(int pageTotalCount) {
    this.pageTotalCount = pageTotalCount;
//    dataCalc();
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

  public boolean getPrev() {
    return prev;
  }

  public boolean getNext() {
    return next;
  }

  public void setLastPageNum(int lastPageNum) {
    this.lastPageNum = lastPageNum;
  }

//  private void dataCalc() {
//
//    // 마지막 번호
//    lastPageNum = (int)(Math.ceil((double)pageNum / (double)pageRowCount) * pageRowCount);
//
//    // 시작 번호
//    startPageNum = lastPageNum - (pageRowCount - 1);
//
//    // 마지막 번호 재계산
//    int lastPageNum_tmp = (int)(Math.ceil((double)pageTotalCount / (double)pageRowCount));
//
//    if(lastPageNum > lastPageNum_tmp) {
//      lastPageNum = lastPageNum_tmp;
//    }
//
//    prev = startPageNum == 1 ? false : true;
//    next = lastPageNum * pageRowCount >= pageTotalCount ? false : true;
//  }
}
