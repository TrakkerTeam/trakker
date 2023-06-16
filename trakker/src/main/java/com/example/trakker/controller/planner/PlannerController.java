package com.example.trakker.controller.planner;

import com.example.trakker.service.planner.PlannerService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class PlannerController {
	private static final Logger logger = LoggerFactory.getLogger(PlannerController.class);

	@Autowired
	private PlannerService planerService;


	
	//기존에 간단하게 페이지 로딩용으로 사용하던 코드

	@RequestMapping("planner/insert")
	public void insert() {
		logger.info("insert 호출");
	}
	@GetMapping("planner/detail")
	public void detail() {
		logger.info("detail 호출");
	}
	@GetMapping("planner/list")
	public void list(Model model) {
		logger.info("list 호출");
	}


	@RequestMapping("planner/modal")
		public void modal(Model model) {
			logger.info("modal 호출");
		}


	@GetMapping("planner/test/mapTest")
	public String mapTest(Integer plan_num, Model model) {
		logger.info("플래너 번호: "+plan_num);
		logger.info("모델?: "+model);

		planerService.detail(plan_num);

//		model.addAttribute("list",planner);

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
