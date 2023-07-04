package com.example.trakker.service.planner;

import com.example.trakker.item.HeartDAO;
import com.example.trakker.item.LocalDAO;
import com.example.trakker.item.LocalDTO;
import com.example.trakker.utils.PagingInfoVO;
import com.example.trakker.utils.ResponseResultList;
import com.example.trakker.model.planner.dao.PlannerDAO;
import com.example.trakker.model.planner.dao.ScheduleDAO;
import com.example.trakker.model.planner.dto.PlannerDTO;
import com.example.trakker.model.planner.dto.ScheduleDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class PlannerServiceImpl implements PlannerService {
    @Autowired
    private PlannerDAO plannerDAO;
    @Autowired
    private ScheduleDAO scheduleDAO;
    @Autowired
    private HeartDAO heartDAO;
    @Autowired
    private LocalDAO localDAO;

    @Transactional(readOnly = true)
    @Override
    public int localCount() {return localDAO.getCount();}

    @Transactional(readOnly=true)
    @Override
    public String selectLocal(Integer lNum) {
        return localDAO.getName(lNum);
    }
    @Transactional
    @Override
    public void insert(PlannerDTO planner, List<String> sDay, List<String> sNum, List<String> sPoint, List<String> sMemo, List<String> y, List<String> x) {
        plannerDAO.insert(planner);
        Long planNum = plannerDAO.getNum();

        List<Double> doubleY = changeDoubleList(y);
        List<Double> doubleX = changeDoubleList(x);
        List<Integer> intSday = changeIntegerList(sDay);
        List<Integer> intSnum = changeIntegerList(sNum);

        List<ScheduleDTO> schedules = changeList(intSday, intSnum, sPoint, sMemo, doubleY, doubleX, planNum);
        for(ScheduleDTO dto : schedules) {
            scheduleDAO.insert(dto);
        }
    }
    @Override
    public List<Double> changeDoubleList(List<String> list) {
        List<Double> result = new ArrayList<>();
        for(int i=0;i<list.size();i++){
            Double doubleNum = Double.parseDouble(list.get(i));
            result.add(doubleNum);
        }
        return result;
    }
    @Override
    public List<Integer> changeIntegerList(List<String> list) {
        List<Integer> result = new ArrayList<>();
        for(int i=0;i<list.size();i++){
            Integer num = Integer.parseInt(list.get(i));
            result.add(num);
        }
        return result;
    }
    @Override
    public List<ScheduleDTO> changeList(List<Integer> sDay, List<Integer> sNum, List<String> sPoint, List<String> sMemo, List<Double> y, List<Double> x, Long planNum) {
        List<ScheduleDTO> schedules = new ArrayList<>();
        if(sMemo.size()==0) {
            for (int i=0; i<sDay.size(); i++) {
                ScheduleDTO schedule = new ScheduleDTO();
                schedule.setPlanNum(planNum);
                schedule.setSday(sDay.get(i));
                schedule.setSnum(sNum.get(i));
                schedule.setSpoint(sPoint.get(i));
                schedule.setY(y.get(i));
                schedule.setX(x.get(i));

                schedules.add(schedule);
            }
        }else {
            for (int i=0; i<sDay.size(); i++) {
                ScheduleDTO schedule = new ScheduleDTO();
                schedule.setPlanNum(planNum);
                schedule.setSday(sDay.get(i));
                schedule.setSnum(sNum.get(i));
                schedule.setSpoint(sPoint.get(i));
                schedule.setSmemo(sMemo.get(i));
                schedule.setY(y.get(i));
                schedule.setX(x.get(i));

                schedules.add(schedule);
            }
        }
        return schedules;
    }

    @Transactional(readOnly=true)
    @Override
    public List<LocalDTO> localList() {
        return localDAO.getList();
    }
    @Transactional(readOnly=true)
    @Override
    public ResponseResultList list(PagingInfoVO vo, Long memNum, String urlCheck) {
        HashMap<String, Object> data = new HashMap<String, Object>();
        data.put("pageNum", vo.getPageNum());
        data.put("pageRowCount", vo.getPageRowCount());
        data.put("area", vo.getArea());
        data.put("sort", vo.getSort());
        data.put("searchType", vo.getStype());
        data.put("keyword", vo.getSdata());

        if(memNum != 0) {
            data.put("memNum", memNum);

            if(urlCheck.equals("/member/mypagePlanner")) {
                data.put("myPage", true);
            }else if(urlCheck.equals("/member/mypageHeart")) {
                data.put("myHeart", true);
            }
        }

        Long count = plannerDAO.count(data);
        List<PlannerDTO> planner = plannerDAO.list(data);

        PagingInfoVO pagingInfoVO = new PagingInfoVO(vo.getPageNum(), count, vo.getPageRowCount());
        ResponseResultList resultList = new ResponseResultList();
        resultList.setBody(planner);
        resultList.setPagingInfo(pagingInfoVO);

        return resultList;
    }

    @Transactional
    @Override
    public void updateHit(Long planNum, HttpServletRequest request, HttpServletResponse response) {
        Cookie[] cookies = request.getCookies();
        boolean visited = false;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("visit_cookie")) {
                    if (cookie.getValue().contains("_" + request.getParameter("planNum") + "_")) {
                        visited = true;
                        break;
                    } else {
                        cookie.setValue(cookie.getValue() + "_" + request.getParameter("planNum") + "_");
                        cookie.setMaxAge(60 * 60);
                        response.addCookie(cookie);
                        visited = true;
                        plannerDAO.updateHit(planNum);
                        break;
                    }
                }
            }
        }
        if (!visited) {
            Cookie newCookie = new Cookie("visit_cookie", "_" + request.getParameter("planNum") + "_");
            newCookie.setMaxAge(60 * 60);
            response.addCookie(newCookie);
            plannerDAO.updateHit(planNum);
        }
    }
    @Transactional(readOnly=true)
    @Override
    public ResponseResultList detail(Long planNum, Long memNum) {
        HashMap<String, Object> data = new HashMap<String, Object>();
        data.put("planNum", planNum);
        data.put("memNum", memNum);

        HashMap<String, Object> planner = plannerDAO.detail(data);
        List<ScheduleDTO> schedules =  scheduleDAO.detail(planNum);
        Long prev = plannerDAO.prevNum(planNum);
        Long next = plannerDAO.nextNum(planNum);

        ResponseResultList resultList = new ResponseResultList();
        resultList.setMeta(planner);
        resultList.setBody(schedules);
        if(prev!=null){
            resultList.setPrev(prev);
        }
        if(next!=null){
            resultList.setNext(next);
        }

        return resultList;
    }
    @Override
    public List<Integer> getDayList(Integer days) {
        List<Integer> day = new ArrayList<>();
        for(int i = 1; i <= days; i++) {
            day.add(i);
        }
        return day;
    }

    @Transactional(readOnly=true)
    @Override
    public List<ScheduleDTO> selectEdit(Long planNum) {
        return scheduleDAO.detail(planNum);
    }
    @Transactional
    @Override
    public void update(PlannerDTO planner, List<String> sday, List<String> snum, List<String> spoint, List<String> smemo, List<String> y, List<String> x) {
        plannerDAO.update(planner);
        scheduleDAO.delete(planner.getPlanNum());

        List<Double> doubleY = changeDoubleList(y);
        List<Double> doubleX = changeDoubleList(x);
        List<Integer> intSday = changeIntegerList(sday);
        List<Integer> intSnum = changeIntegerList(snum);

        List<ScheduleDTO> schedules = changeList(intSday, intSnum, spoint, smemo, doubleY, doubleX, planner.getPlanNum());
        for(ScheduleDTO dto : schedules) {
            scheduleDAO.insert(dto);
        }
    }

    @Transactional
    @Override
    public void delete(Long planNum) {
        plannerDAO.delete(planNum);
        scheduleDAO.delete(planNum);
        heartDAO.deletePlanner(planNum);
    }

}
