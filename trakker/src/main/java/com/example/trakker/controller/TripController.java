package com.example.trakker.controller;

import com.example.trakker.model.trip.dto.TripDTO;
import com.example.trakker.service.trip.TripService;
import com.example.trakker.utils.ItemSearchVO;
import com.example.trakker.utils.ResponseResultList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class TripController {

    @Autowired
    private TripService tripService;

    @GetMapping("/trip/list.do")
    public ModelAndView list(ModelAndView mav) {
        mav.setViewName("trip/trip_list");
        return mav;
    }

    @GetMapping("/trip/list_admin")
    public String list(Model model) throws Exception {
        List<TripDTO> list = tripService.list();
        model.addAttribute("lists", list);
        return "/trip/trip_list_admin?num=1";
    }

    @GetMapping("/trip/write.do")
    public String write() {
        return "/trip/trip_write";
    }

    @PostMapping("/trip/insert.do")
    public String insert(@ModelAttribute TripDTO dto)
            throws Exception{
        tripService.insert(dto);
        return "redirect:/trip/trip_list_admin?num=1";
    }

    @GetMapping("/trip/view.do")
    public ModelAndView view(int t_num, HttpSession session) throws Exception {
        tripService.increaseViewcnt(t_num, session);
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
    public String delete(int t_num) throws Exception {
        tripService.delete(t_num);
        return "redirect:/trip/trip_list_admin?num=1";
    }
    @RequestMapping(value = "/trip/trip_list_admin", method = RequestMethod.GET)
    public void getListPage(Model model, @RequestParam("num") Integer num,
                            @RequestParam(value = "searchType",required = false, defaultValue = "t_subject") String searchType,
                            @RequestParam(value = "keyword",required = false, defaultValue = "") String keyword) throws Exception {
        ItemSearchVO vo = new ItemSearchVO();
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
}
