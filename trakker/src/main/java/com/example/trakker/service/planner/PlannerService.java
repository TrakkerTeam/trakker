package com.example.trakker.service.planner;

import com.example.trakker.item.LocalDTO;
import com.example.trakker.utils.PagingInfoVO;
import com.example.trakker.utils.ResponseResultList;
import com.example.trakker.model.planner.dto.PlannerDTO;
import com.example.trakker.model.planner.dto.ScheduleDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public interface PlannerService {

    int localCount();

    String selectLocal(Integer lNum);
    void insert(PlannerDTO planner, List<String> sDay, List<String> sNum, List<String> sPoint, List<String> sMemo, List<String> y, List<String> x);
    List<Double> changeDoubleList(List<String> list);
    List<Integer> changeIntegerList(List<String> list);
    List<ScheduleDTO> changeList(List<Integer> sDay, List<Integer> sNum, List<String> sPoint, List<String> sMemo, List<Double> y, List<Double> x, Long planNum);

    List<LocalDTO> localList();
    ResponseResultList list(PagingInfoVO vo, Long memNum, String urlCheck);

    void updateHit(Long planNum, HttpServletRequest request, HttpServletResponse response);
    ResponseResultList detail(Long planNum, Long memNum);
    List<Integer> getDayList(Integer days);

    List<ScheduleDTO> selectEdit(Long planNum);
    void update(PlannerDTO planner, List<String> sDay, List<String> sNum, List<String> sPoint, List<String> sMemo, List<String> y, List<String> x);

    void delete(Long planNum);
}
