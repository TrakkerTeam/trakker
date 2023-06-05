package com.example.trakker.controller;

import java.util.List;

import com.example.trakker.model.trip.dto.TripDTO;
import com.example.trakker.service.trip.TripService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class TripController {

    @Autowired
    private TripService tripService;

    @GetMapping("/trip/list.do")
    public ModelAndView list(ModelAndView mav) {
        mav.setViewName("trip/trip_list");
        return mav;
    }

    @GetMapping("/trip/write.do")
    public String write() {
        return "/trip/trip_write";
    }

    @PostMapping("/trip/insert.do")
    public String insert(@ModelAttribute TripDTO dto, HttpSession session)
            throws Exception{
        tripService.write(dto);
        return "redirect:/admin/adminPage.do";
    }

    @GetMapping("/trip/view.do")
    public ModelAndView view(int faq_num) throws Exception {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("trip/trip_modify");
        return mav;
    }
}
