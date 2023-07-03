package com.example.trakker.controller;

import com.example.trakker.item.HeartDTO;
import com.example.trakker.model.planner.dto.PlannerDTO;
import com.example.trakker.model.planner.dto.ScheduleDTO;
import com.example.trakker.service.heart.HeartService;
import com.example.trakker.service.planner.PlannerService;

import com.example.trakker.utils.PagingInfoVO;
import com.example.trakker.utils.ResponseResultList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class PlannerController {
	private static final Logger logger = LoggerFactory.getLogger(PlannerController.class);

	@Autowired
	private PlannerService plannerService;
	@Autowired
	private HeartService heartService;


	//임시 모달페이지 - 메인페이지 구현 후 삭제
	@RequestMapping("planner/modal")
	public void modal(Model model) {
		logger.info("modal 호출");
	}
//--임시 모달페이지 - 메인페이지 구현 후 삭제


	//플래너 작성 - 플래너 작성 화면은 비로그인시에도 접근 가능
	@PostMapping("planner/new")
	public String write(Model model,
						@RequestParam Map<String, Object> map) {
		String kName = plannerService.selectLocal(Integer.parseInt((String)map.get("planner-local")));

		model.addAttribute("days", map.get("planner-days"));
		model.addAttribute("lNum", map.get("planner-local"));
		model.addAttribute("kName", kName);
		model.addAttribute("title", map.get("planner-title"));
		model.addAttribute("memo", map.get("planner-memo"));

		logger.info("작성 페이지 이동");
		return "planner/insert";
	}
	@PostMapping("planner/insert")
	public void insert(PlannerDTO planner,
					   @RequestParam(value = "sday[]") List<String> sday,
					   @RequestParam(value = "snum[]") List<String> snum,
					   @RequestParam(value = "spoint[]") List<String> spoint,
					   @RequestParam(value = "smemo[]") List<String> smemo,
					   @RequestParam(value = "y[]") List<String> y,
					   @RequestParam(value = "x[]") List<String> x
	) {
		plannerService.insert(planner, sday, snum, spoint, smemo, y, x);

		logger.info("작성완료 버튼");
	}

	//플래너 목록 - 좋아요 이미지 선택을 위해 세션검증
	@GetMapping("planner")
	public String list(Model model,
					   HttpSession session,
					   HttpServletRequest request,
					   @RequestParam(value = "page", required = false, defaultValue = "1") int page,
					   @RequestParam(value = "area",required = false, defaultValue = "0") Integer area,
					   @RequestParam(value = "sort",required = false, defaultValue = "add") String sort,
					   @RequestParam(value = "searchType",required = false, defaultValue = "") String searchType,
					   @RequestParam(value = "keyword",required = false, defaultValue = "") String keyword) {

		Long memNum = (Long) session.getAttribute("mem_num");
		//MemNum 임시부여
		if(memNum==null){
			logger.info("로그인 값이 없습니다. 비회원 값을 부여합니다.");
			memNum = 0L;
		}
		//--MemNum 임시부여

		PagingInfoVO vo = new PagingInfoVO();
		vo.setPageNum(page);
		vo.setArea(area);
		vo.setSort(sort);
		vo.setStype(searchType);
		vo.setSdata(keyword);

		String urlCheck = request.getServletPath();

		ResponseResultList responseResultList = plannerService.list(vo, memNum, urlCheck);
		model.addAttribute("list", responseResultList.getBody());
		model.addAttribute("page", responseResultList.getMeta().get("pagingInfo"));
		model.addAttribute("select", page);

		model.addAttribute("local", plannerService.localList());
		model.addAttribute("area", area);
		model.addAttribute("sort", sort);

		model.addAttribute("type", searchType);
		model.addAttribute("keyword",keyword);

		logger.info("목록 페이지 이동");

		return "planner/list";
	}

	//플래너 상세 - 좋아요 버튼 출력을 위해 세션체크
	@GetMapping("planner/{planNum}")
	public String detail(Model model,
						 HttpSession session,
						 @PathVariable("planNum") Long planNum) {

		Long memNum = (Long)session.getAttribute("mem_num");
		//MemNum 임시부여
		if(memNum==null){
			logger.info("memNum값이 null이므로 값을 임시로 부여합니다.");
			memNum = 1L;
		}
		//--MemNum 임시부여

		ResponseResultList responseResultList = plannerService.detail(planNum, memNum);
		List<Integer> days = plannerService.getDayList((Integer)responseResultList.getMeta().get("days"));

		model.addAttribute("planner", responseResultList.getMeta());
		model.addAttribute("days", days);
		model.addAttribute("schedules", responseResultList.getBody());
		model.addAttribute("prev", responseResultList.getPrev());
		model.addAttribute("next", responseResultList.getNext());

//to do - hashmap에 들어간 regdate값 (결함) 수정할 것
//to do - hashmap에 들어간 regdate값 (결함) 수정할 것
//to do - hashmap에 들어간 regdate값 (결함) 수정할 것
//to do - hashmap에 들어간 regdate값 (결함) 수정할 것
//to do - hashmap에 들어간 regdate값 (결함) 수정할 것

		logger.info("상세 페이지 이동");

		return "planner/detail";
	}
	//좋아요 클릭
	@ResponseBody
	@PostMapping("planner/{planNum}")
	public void heart(HeartDTO heart) {

		logger.info("heartDTO" + heart);

		if(heart.getMh()==0 || heart.getMh()==1){
			heartService.heartCheck(heart);
		}else {
			logger.info("올바르지 않은 값입니다.");
		}

		logger.info("좋아요 버튼 클릭");
	}

	//플래너 수정 - 뷰에서 로그인검증
	@PostMapping("planner/edit/{planNum}")
	public String edit(Model model,
					   @PathVariable("planNum") Long planNum,
					   @RequestParam Map<String, Object> map) {

		List<ScheduleDTO> schedules = plannerService.selectEdit(planNum);

		model.addAttribute("listDays", map.get("listDays"));
		model.addAttribute("planNum", planNum);
		model.addAttribute("kname", map.get("planner-local"));
		model.addAttribute("days", map.get("planner-days"));
		model.addAttribute("title", map.get("planner-title"));
		model.addAttribute("memo", map.get("planner-memo"));
		model.addAttribute("schedules", schedules);

		logger.info("수정 페이지 이동");
		return "planner/edit";
	}
	@ResponseBody
	@PostMapping("planner/rewrite")
	public void update(PlannerDTO planner,
					   @RequestParam(value = "sday[]") List<String> sday,
					   @RequestParam(value = "snum[]") List<String> snum,
					   @RequestParam(value = "spoint[]") List<String> spoint,
					   @RequestParam(value = "smemo[]") List<String> smemo,
					   @RequestParam(value = "y[]") List<String> y,
					   @RequestParam(value = "x[]") List<String> x) {
		if(planner.getPlanNum() != null) {
			plannerService.update(planner, sday, snum, spoint, smemo, y, x);
		} else {
			logger.info("플래너 번호가 입력되지 않았습니다.");
		}

		logger.info("수정완료 버튼");
	}

	//플래너 삭제 - 뷰에서 로그인검증
	@ResponseBody
	@PostMapping("planner/delete/{planNum}")
	public void delete(@PathVariable Long planNum) {
		plannerService.delete(planNum);

		logger.info("삭제 버튼");
	}
}
