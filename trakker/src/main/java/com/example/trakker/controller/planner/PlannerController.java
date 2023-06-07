package com.example.trakker.controller.planner;

import com.example.trakker.service.impl.PlannerServiceImpl;
import com.example.trakker.service.impl.ScheduleServiceImpl;
import com.example.trakker.service.planner.PlannerService;
import com.example.trakker.service.planner.ScheduleService;
import com.example.trakker.model.planner.dto.PlannerDTO;
import com.example.trakker.model.planner.dto.ScheduleDTO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class PlannerController {
	private static final Logger logger = LoggerFactory.getLogger(PlannerController.class);

	@Autowired
	private PlannerService planerService;

	@Autowired
	private ScheduleService scheduleService;

	
	
	
	
	
	//기존에 간단하게 페이지 로딩용으로 사용하던 코드
	
	@RequestMapping("/")
	// Model에 자료 저장(서블릿의 request객체에 해당됨)
	public String test(Model model) {
		// WEB-INF/views/test.jsp 포워딩
		return "test";
	}
	@RequestMapping("home")
	public void home(Model model) {
		logger.info("home 호출");
	}


	@RequestMapping("planner/insert")
	public void insert() {
		logger.info("insert 호출");
	}
	@RequestMapping("planner/detail")
	public void detail(Model model) {
		logger.info("detail 호출");
	}
	@RequestMapping("planner/list")
	public void list(Model model) {
		logger.info("list 호출");
	}
	@RequestMapping("planner/modal")
		public void modal(Model model) {
			logger.info("modal 호출");
		}
	@RequestMapping("planner/mapTest")
		public void mapTest(Model model) {
			logger.info("mapTest 호출");
		}
	@RequestMapping("planner/imageMapTest")
		public void imageMapTest(Model model) {
			logger.info("imageMapTest 호출");
		}

	@RequestMapping("planner/test/mapTest")
	public void mapITest(Model model) {
		logger.info("mapTest 호출");
	}

	@RequestMapping("planner/test/simpleTest")
	public void simpleTest(Model model) {
		logger.info("simpleTest 호출");
	}

	@RequestMapping("planner/test/mapSearchTest")
	public void mapSearchTest(Model model) {
		logger.info("mapSearchTest 호출");
	}

}
