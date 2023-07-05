package com.example.trakker.controller;

import com.example.trakker.item.RatingDTO;
import com.example.trakker.model.trip.dto.TripDTO;
import com.example.trakker.service.trip.TripService;
import com.example.trakker.utils.PagingInfoVO;
import com.example.trakker.utils.ResponseResultList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpSession;


@Controller
public class TripController {
    @Autowired
    private TripService tripService;

    @RequestMapping(value = "/trip/trip_list", method = RequestMethod.GET)
    public void list_member(Model model, @RequestParam("num") Integer num,
                            @RequestParam(value = "searchType",required = false, defaultValue = "t_subject") String searchType,
                            @RequestParam(value = "keyword",required = false, defaultValue = "") String keyword,
                            @RequestParam(value = "sort",required = false, defaultValue = "add") String sort) throws Exception {
        PagingInfoVO vo = new PagingInfoVO();
        vo.setPageNum(num);
        vo.setStype(searchType);
        vo.setSdata(keyword);
        vo.setSort(sort);
        ResponseResultList responseResultList = tripService.listPage(vo);
        model.addAttribute("triplist", responseResultList.getBody());
        model.addAttribute("page", responseResultList.getMeta().get("pagingInfo"));
        model.addAttribute("select", num);
        model.addAttribute("search", searchType);
        model.addAttribute("keyword",keyword);
    }

    @GetMapping("/trip/view.do")
    public ModelAndView view(long t_num) throws Exception {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("trip/trip_modify");
        mav.addObject("trip",tripService.view(t_num));
        return mav;
    }
    @RequestMapping("/trip/update.do")
    public String update(TripDTO dto) throws Exception {
        if (dto != null) {
            tripService.update(dto);
        }
        return "redirect:/trip/trip_list_admin?num=1";
    }

    @RequestMapping("/trip/delete.do")
    public String delete(long t_num) throws Exception {
        tripService.delete(t_num);
        return "redirect:/trip/trip_list_admin?num=1";
    }

    @RequestMapping(value = "/trip/trip_list_admin", method = RequestMethod.GET)
    public void getListPage(Model model, @RequestParam("num") Integer num,
                            @RequestParam(value = "searchType",required = false, defaultValue = "t_subject") String searchType,
                            @RequestParam(value = "keyword",required = false, defaultValue = "") String keyword) throws Exception {
        PagingInfoVO vo = new PagingInfoVO();
        vo.setPageNum(num);
        vo.setStype(searchType);
        vo.setSdata(keyword);
        ResponseResultList responseResultList = tripService.listPage(vo);
        model.addAttribute("lists", responseResultList.getBody());
        model.addAttribute("page", responseResultList.getMeta().get("pagingInfo"));
        model.addAttribute("select", num);
        model.addAttribute("search", searchType);
        model.addAttribute("keyword",keyword);
    }


    @PostMapping("/trip/ratinginsert")
    public String ratingInsert(long t_num,  Double rating , Model model, HttpSession session){
        long mem_num =(long)session.getAttribute("mem_num");
        RatingDTO dto = new RatingDTO();
        dto.setMem_num(mem_num);
        dto.setT_num(t_num);
        dto.setRating(rating);
        tripService.ratingInsert(dto);

        Double ratingavg = tripService.ratingAvg(t_num);
        model.addAttribute("dto", ratingavg);

        return "/trip/trip_rating";
    }
}
