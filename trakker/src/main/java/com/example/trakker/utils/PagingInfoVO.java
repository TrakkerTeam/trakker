package com.example.trakker.utils;

import java.util.List;

public class PagingInfoVO extends BaseVO {
  private int pageNum;
  private int pageTotalCount;
  private int pageRowCount = 9;
  private int lastPageNum = 0;

  public PagingInfoVO(){
    this.pageNum = 1;
    this.pageTotalCount = 0;
    this.lastPageNum = 0;
  }

  public PagingInfoVO(List list, int pageRowCount) {
    if (list != null && list.size() > 0){
      PagingInfoEntity info = (PagingInfoEntity)list.get(0);
      if (info != null){
        this.pageNum = info.getPageNum();
        this.pageTotalCount = info.getPageTotalCount();

        if(info.getPageTotalCount() % pageRowCount > 0){
          this.lastPageNum = (info.getPageTotalCount() / pageRowCount) + 1;
        }else{
          this.lastPageNum = info.getPageTotalCount() / pageRowCount;
        }
      }
      this.pageRowCount = pageRowCount;
    }
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
