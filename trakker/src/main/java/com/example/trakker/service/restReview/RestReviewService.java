package com.example.trakker.service.restReview;

import com.example.trakker.utils.PagingInfoVO;
import com.example.trakker.utils.ResponseResultList;

public interface RestReviewService {

    ResponseResultList list(PagingInfoVO vo, Long memNum, String urlCheck);
}
