package com.example.trakker.controller;

import com.example.trakker.model.planner.dto.PlannerDTO;
import com.example.trakker.model.planner.dto.ScheduleDTO;
import com.example.trakker.service.planner.PlannerService;

import com.example.trakker.utils.PagingInfoVO;
import com.example.trakker.utils.ResponseResultList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;


@Controller
public class PlannerController {
	private static final Logger logger = LoggerFactory.getLogger(PlannerController.class);

	@Autowired
	private PlannerService planerService;

	//플래너 작성
	@PostMapping("planner/new")
	public String write(Model model,
						@RequestParam Map<String, Object> map) {

		String kName = planerService.selectLocal(Integer.parseInt((String)map.get("planner-local")));

		model.addAttribute("days", map.get("planner-days"));
		model.addAttribute("lNum", map.get("planner-local"));
		model.addAttribute("kName", kName);
		model.addAttribute("title", map.get("planner-title"));
		model.addAttribute("memo", map.get("planner-memo"));

		logger.info("작성 페이지 이동");
		return "planner/insert";
	}
	@PostMapping("planner/insert")
	public String insert(PlannerDTO planner, ScheduleDTO schedule) {
		logger.info("작성완료 버튼");
//		model.addAttribute(PlannerDTO planner)
		//planerService.insert(planner, schedules);

		return "redirect:planner/detail";
	}

	//플래너 목록
	@GetMapping("planner")
	public String list(Model model,
					   @RequestParam(value = "page") int page,
					   @RequestParam(value = "area",required = false, defaultValue = "0") int area,
					   @RequestParam(value = "searchType",required = false, defaultValue = "") String searchType,
					   @RequestParam(value = "keyword",required = false, defaultValue = "") String keyword) {

		PagingInfoVO vo = new PagingInfoVO();
		vo.setPageNum(page);
		vo.setArea(area);
		vo.setStype(searchType);
		vo.setSdata(keyword);

		ResponseResultList responseResultList = planerService.list(vo);
		model.addAttribute(responseResultList);

		logger.info("목록 페이지 이동");

		return "planner/list";
	}

	//플래너 상세
	@GetMapping("planner/{planNum}")
	public String detail(@PathVariable("planNum") Integer planNum, Model model) {
		ResponseResultList responseResultList = planerService.detail(planNum);
		model.addAttribute(responseResultList);
		logger.info("상세 페이지 이동");

		return "planner/detail";
	}
	@PostMapping("planner/{planNum}")
	public void heart() {
		logger.info("좋아요 버튼 클릭");

	}

	//플래너 수정
	@GetMapping("planner/edit")
	public void edit(Model model) {
		logger.info("수정 페이지 이동");
	}
	@PostMapping("planner/edit")
	public String update(Model model) {
		logger.info("수정완료 버튼");

		return "redirect:planner/detail";
	}

	//플래너 삭제
	@PostMapping("planner/delete/{planNum}")
	public String delete(Model model, Integer planNum) {
		planerService.delete(planNum);

		logger.info("삭제 버튼");
		return "redirect:planner/list";
	}




	@RequestMapping("planner/modal")
		public void modal(Model model) {
			logger.info("modal 호출");
		}

	//테스트 페이지
	@GetMapping("planner/test/mapTest")
	public String mapTest(Model model) {
		logger.info("상세테스트 호출");
		return "planner/test/mapTest";
	}
	@RequestMapping("planner/test/simpleTest")
	public void simpleTest(Model model) {
		logger.info("심플 호출");
	}
	@RequestMapping("planner/test/mapSearchTest")
	public void mapSearchTest(Model model) {
		logger.info("검색테스트 호출");
	}

}
