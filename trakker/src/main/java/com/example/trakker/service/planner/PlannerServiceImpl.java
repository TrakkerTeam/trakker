package com.example.trakker.service.planner;

import com.example.trakker.item.HeartDAO;
import com.example.trakker.utils.PagingInfoVO;
import com.example.trakker.utils.ResponseResultList;
import com.example.trakker.model.planner.dao.PlannerDAO;
import com.example.trakker.model.planner.dao.ScheduleDAO;
import com.example.trakker.model.planner.dto.PlannerDTO;
import com.example.trakker.model.planner.dto.ScheduleDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class PlannerServiceImpl implements PlannerService {

    @Autowired
    private PlannerDAO plannerDAO;
    @Autowired
    private ScheduleDAO scheduleDAO;
    @Autowired
    private HeartDAO heartDAO;

    //플래너 작성
    @Transactional
    @Override
    public void insert(PlannerDTO planner, List<ScheduleDTO> schedules) {
        plannerDAO.insert(planner);
        scheduleDAO.insert(schedules);
    }

    //플래너 목록
    @Override
    public ResponseResultList list(PagingInfoVO vo) {
        HashMap<String, Object> data = new HashMap<String, Object>();
        data.put("pageNum", vo.getPageNum());
        data.put("pageRowCount", vo.getPageRowCount());
        data.put("searchType", vo.getStype());
        data.put("keyword", vo.getSdata());

        Integer count = plannerDAO.count(data);
        List<PlannerDTO> list = plannerDAO.list(data);

        PagingInfoVO pagingInfoVO = new PagingInfoVO(vo.getPageNum(), count, vo.getPageRowCount());
        ResponseResultList resultList = new ResponseResultList();
        resultList.setBody(list);
        resultList.setPagingInfo(pagingInfoVO);

        return resultList;
    }

    //플래너 상세
    @Override
    public ResponseResultList detail(Integer planNum) {
        //조회수 중복 방지 - 미구현
        //plannerDAO.updateHit(planNum);

        HashMap<String, Object> planner = plannerDAO.detail(planNum);
        List<ScheduleDTO> schedules =  scheduleDAO.detail(planNum);
        ResponseResultList resultList = new ResponseResultList();
        resultList.setMeta(planner);
        resultList.setBody(schedules);

        return resultList;
    }

    //플래너 수정
    @Transactional
    @Override
    public void update(Integer planNum, PlannerDTO planner, List<ScheduleDTO> schedules) {
        plannerDAO.update(planner);
        scheduleDAO.delete(planNum);
        scheduleDAO.insert(schedules);
    }

    //플래너 삭제
    @Transactional
    @Override
    public void delete(Integer planNum) {
        plannerDAO.delete(planNum);
        scheduleDAO.delete(planNum);

        //추가 - 좋아요 테이블의 데이터도 삭제
        heartDAO.deletePlanner(planNum);
    }


    //DAO 현재 미구현, heartDAO 추가?
    @Override
    public void insertHeart(Integer memNum, Integer planNum) {
        //heartDAO.insert(Integer memNum, Integer planNum);
    }
    @Override
    public void deleteHeart(Integer memNum) {
        //heartDAO.delete(Integer memNum);
    }


}
