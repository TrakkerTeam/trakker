<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>


<style>
  #sidebar {
    width: 230px;
  }

  #sidebar ul.nav-pills {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    height: 100%;
  }

   /* Cardlist */
   #cardlist {
     flex: 1;
     display: flex;
     justify-content: center;
     align-items: center;
     overflow-y: auto;
   }

   #div1 {
     display: flex;
     justify-content: center;
     align-items: center;
   }
  #containerall {
    align-items: center;
  }
  #li1,#li2,#li3{
  padding-top:20px;
   padding-bottom:20px;
  }
    #search1 {
      margin-left: auto;
    }

</style>

<html>
<head>
<meta charset="UTF-8">

<div class="d-flex" style="display: flex;" id="containerall">
  <div class="d-flex flex-column flex-shrink-0 p-3 bg-light" style="width: 230px;" id="sidebar">
      <!-- Sidebar content -->
      <ul class="nav nav-pills flex-column mb-auto ">
        <li class="nav-item" id="li1">
          <a href="#" class="nav-link active" aria-current="page">
            <svg class="bi me-2" width="16" height="16"><use xlink:href="#home"></use></svg>
            좋아요한 플래너
          </a>
        </li>
        <li class="nav-item"  id="li2">
          <a href="#" class="nav-link link-dark">
            <svg class="bi me-2" width="16" height="16"><use xlink:href="#speedometer2"></use></svg>
            좋아요한 게시글
          </a>
        </li>
        <li class="nav-item"  id="li3">
          <a href="#" class="nav-link link-dark">
            <svg class="bi me-2" width="16" height="16"><use xlink:href="#table"></use></svg>
            내가 단 댓글
          </a>
        </li>
      </ul>
    </div>
  <div class="album py-5 bg-light" id="cardlist" style="flex: 1; overflow-y: auto;">
    <!-- Cardlist content -->
    <div class="container">

    <div id="search1">

      <div class="col-sm-3" >
        <form class="d-flex" role="search">
          <select>
            <option>제목</option>
            <option>내용</option>
            <option>작성자</option>
          </select>
          <input class="form-control ms-2 me-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
      </div>

      </div>

      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" id="div1">
        <div class="col">
          <div class="card shadow-sm">
            <!-- Card content -->
            <img src="${pageContext.request.contextPath}/resources/images/logo.png" class="card-img-top" style="width: 100%; height: 225px;">
            <div class="card-body">
              <small class="text-muted">닉네임</small>
              <p class="card-text text-truncate">레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">리뷰보기</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">글수정</button>
                </div>
                <small class="text-muted">평점@@@@@</small>
              </div>
            </div>
          </div>
          <div class="card shadow-sm">
            <!-- Card content -->
            <img src="${pageContext.request.contextPath}/resources/images/logo.png" class="card-img-top" style="width: 100%; height: 225px;">
            <div class="card-body">
              <small class="text-muted">닉네임</small>
              <p class="card-text text-truncate">레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">리뷰보기</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">글수정</button>
                </div>
                <small class="text-muted">평점@@@@@</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
            <!-- Card content -->
            <img src="${pageContext.request.contextPath}/resources/images/logo.png" class="card-img-top" style="width: 100%; height: 225px;">
            <div class="card-body">
              <small class="text-muted">닉네임</small>
              <p class="card-text text-truncate">레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">리뷰보기</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">글수정</button>
                </div>
                <small class="text-muted">평점@@@@@</small>
              </div>
            </div>
          </div>
          <div class="card shadow-sm">
            <!-- Card content -->
            <img src="${pageContext.request.contextPath}/resources/images/logo.png" class="card-img-top" style="width: 100%; height: 225px;">
            <div class="card-body">
              <small class="text-muted">닉네임</small>
              <p class="card-text text-truncate">레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">리뷰보기</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">글수정</button>
                </div>
                <small class="text-muted">평점@@@@@</small>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
