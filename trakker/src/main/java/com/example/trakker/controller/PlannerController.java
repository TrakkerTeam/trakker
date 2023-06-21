package com.example.trakker.controller;

import com.example.trakker.model.planner.dto.PlannerDTO;
import com.example.trakker.service.planner.PlannerService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
public class PlannerController {
	private static final Logger logger = LoggerFactory.getLogger(PlannerController.class);

	@Autowired
	private PlannerService planerService;

	//플래너 작성
	@GetMapping("planner/new")
	public String write(Model model) {
		logger.info("작성 페이지 이동");
		return "planner/insert";
	}
	@PostMapping("planner/new")
	public String insert(@PathVariable("planNum") int planNum) {
		logger.info("작성완료 버튼");
//		model.addAttribute(PlannerDTO planner)
		//planerService.insert(planner, schedules);
//Q. 리다이렉트 시 detail 페이지의 planNum값을 어떻게 넘기지? - model로 넘기나?
		return "redirect:planner/detail";
	}

	//플래너 목록
	@GetMapping("planner")
	public String list(Model model) {
		logger.info("목록 페이지 이동");
//Q. 검색 url 처리 어떻게 하지?
//Q. 페이지네이션 AJAX 처리 어떻게 하지?
//Q. 페이지 내에서 좋아요 추가/삭제 어떻게 처리하지?
		return "planner/list";
	}

	//플래너 상세
	@GetMapping("planner/{planNum}")
	public String detail(@PathVariable("planNum") int planNum, Model model) {
		logger.info("상세 페이지 이동");
//Q. 잘못된 url을 어떻게 판별하지?
//Q. 사용자가 마음대로 번호 넣어서 넘겼을 때 에러 페이지 어떻게 대처하지?
		return "planner/detail";
	}
	@PostMapping("planner/{planNum}")
	public void heart() {
		logger.info("좋아요 버튼 클릭");
//Q. 페이지 내에서 좋아요 추가/삭제 어떻게 처리하지?
	}

	//플래너 수정
	@GetMapping("planner/edit")
	public void edit(Model model) {
		logger.info("수정 페이지 이동");
	}
	@PostMapping("planner/edit")
	public String update(Model model) {
		logger.info("수정완료 버튼");
//Q. 리다이렉트 시 detail 페이지의 planNum값을 어떻게 넘기지? - model로 넘기나?
		return "redirect:planner/detail";
	}

	//플래너 삭제
	@PostMapping("planner/delete/{planNum}")
	public String delete(Model model) {
		logger.info("삭제 버튼");
		return "redirect:planner/list";
	}

	//



	@RequestMapping("planner/modal")
		public void modal(Model model) {
			logger.info("modal 호출");
		}


		//페이지 이동 정리
//		1. 메인 페이지 -> 모달창 -> insert 페이지 이동
//		2. insert 페이지 -> 작성완료 버튼 -> 제출 후 detail 페이지 리다이렉트? 이동

//		1. list 페이지 이동 (검색 포함, 페이지네이션 json처리)
//		2. detail 페이지 이동 (no 이외에 url 추가 X)

//		1. 상세 페이지 -> 수정버튼 -> 모달창 -> edit 페이지 이동
//		2. edit 페이지 -> 수정완료 버튼 -> 제출 후 detail 페이지 리다이렉트? 이동

//		1. 상세 페이지 -> 삭제버튼 -> 확인창 -> list 페이지 리다이렉트 이동

		//추가 ( json 방식 )
//		1. 목록 페이지 -> 하트버튼 -> 좋아요 추가/삭제
//		2. 상세 페이지 -> 하트버튼 -> 좋아요 추가/삭제




	//테스트 페이지
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
