package com.example.trakker.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import com.example.trakker.model.faq.dto.FaqDTO;
import com.example.trakker.model.member.dto.MemberDTO;

import com.example.trakker.model.review.dto.ReviewDTO;
import com.example.trakker.model.trip.dto.TripDTO;
import com.example.trakker.service.admin.AdminService;
import com.example.trakker.service.faq.FaqService;
import com.example.trakker.service.item.LocalService;
import com.example.trakker.service.trip.TripService;
import com.example.trakker.service.review.ReviewService;
import com.example.trakker.utils.PagingInfoVO;
import com.example.trakker.utils.ResponseResultList;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {

	@Autowired
	private AdminService adminService;

	@Autowired
	private FaqService faqService;

	@Autowired
	private TripService tripService;

	@Autowired
	private ReviewService reviewService;

	@Autowired
	LocalService localService;


	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Value("${upload.path}")
	private String uploadPath;

	private MultipartFile uploadFile;

	@RequestMapping("/memberList")
	public String memberList(Model model) {
		List<MemberDTO> list = adminService.memberList();
		model.addAttribute("list", list);
		long result = System.currentTimeMillis();

		return "admin/admin_listPage?num=1";
	}
	@RequestMapping("/adminPage.do")
	public ModelAndView adminPage(ModelAndView mav) throws Exception{


		List<FaqDTO> faqList = faqService.list();
		List<MemberDTO> memberList = adminService.memberList();
		List<TripDTO> tripList = tripService.list();
		List<ReviewDTO> reviewList = reviewService.main_list();
		int memberCount = adminService.memberCount();

		mav.setViewName("admin/admin_main");
		mav.addObject("memberList", memberList);
		mav.addObject("faqList", faqList);
		mav.addObject("tripList",tripList);
		mav.addObject("reviewList",reviewList);
		mav.addObject("memberCount", memberCount);
		return mav;
	}
	@RequestMapping("/view.do")
	public String view(Model model, @RequestParam int mem_num) {
		model.addAttribute("dto", adminService.adminViewMember(mem_num));

		return "admin/admin_memberView";

	}
	@RequestMapping("/userUpdate")
	public String UpdateUser(
			@ModelAttribute MemberDTO dto,
			HttpSession session,
			@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request) throws Exception {

		String existingImageUrl = (String) session.getAttribute("picture_url");

		if (file == null || file.isEmpty()) {
			dto.setPicture_url(existingImageUrl);
		} else {
			String uploadFolder = "c:\\\\upload\\\\";
			UUID uuid = UUID.randomUUID();
			String[] uuids = uuid.toString().split("-");
			String uniqueName = uuids[0];
			String fileExtension = "";
			int lastDotIndex = file.getOriginalFilename().lastIndexOf(".");
			if (lastDotIndex >= 0 && lastDotIndex < file.getOriginalFilename().length() - 1) {
				fileExtension = file.getOriginalFilename().substring(lastDotIndex + 1);
			}
			String imageUrl = request.getContextPath() + "/picture_url/" + uniqueName +"."+ fileExtension;

			File saveFile = new File(uploadFolder + "/" + uniqueName +"." + fileExtension);
			try {
				file.transferTo(saveFile);
			} catch (IOException e) {
				e.printStackTrace();
			}

			dto.setPicture_url(imageUrl);

			if (existingImageUrl != null && !existingImageUrl.isEmpty()) {
				String existingFileName = existingImageUrl.substring(existingImageUrl.lastIndexOf("/") + 1);
				File existingFile = new File(uploadFolder + "/" + existingFileName);
				existingFile.delete();
			}
		}

		String encodedPassword = passwordEncoder.encode(dto.getMem_pass());
		dto.setMem_pass(encodedPassword);

		adminService.updateMember(dto);

		MemberDTO updatedMember = adminService.getupdateMember(dto.getMem_email());
		session.setAttribute("mem_name", updatedMember.getMem_name());
		session.setAttribute("mem_nickname", updatedMember.getMem_nickname());
		session.setAttribute("mem_zipcode", updatedMember.getMem_zipcode());
		session.setAttribute("mem_address1", updatedMember.getMem_address1());
		session.setAttribute("mem_address2", updatedMember.getMem_address2());
		session.setAttribute("mem_phone", updatedMember.getMem_phone());
		session.setAttribute("picture_url", updatedMember.getPicture_url());

		return "redirect:/admin/admin_listPage?num=1";
	}
	@RequestMapping(value = "/admin_listPage", method = RequestMethod.GET)
	public void getListPage(Model model, @RequestParam("num") Integer num,
							@RequestParam(value = "searchType",required = false, defaultValue = "mem_name") String searchType,
							@RequestParam(value = "keyword",required = false, defaultValue = "") String keyword) throws Exception {
		PagingInfoVO vo = new PagingInfoVO();
		vo.setPageNum(num);
		vo.setStype(searchType);
		vo.setSdata(keyword);
		ResponseResultList responseResultList = adminService.listPage(vo);
		model.addAttribute("list", responseResultList.getBody());
		model.addAttribute("page", responseResultList.getMeta().get("pagingInfo"));
		model.addAttribute("select", num);
		model.addAttribute("search", searchType);
		model.addAttribute("keyword",keyword);
	}

	@RequestMapping(value = "/Review_listPage", method = RequestMethod.GET)
	public void list(Model model, @RequestParam("num") Integer num,
					 @RequestParam(value = "searchType", required = false, defaultValue = "title") String searchType,
					 @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
					 @RequestParam(value = "area", required = false, defaultValue = "0") Integer area,
					 @RequestParam(value = "sort", required = false, defaultValue = "add") String sort) {
		PagingInfoVO vo = new PagingInfoVO();
		vo.setPageNum(num);
		vo.setArea(area);
		vo.setSort(sort);
		vo.setStype(searchType);
		vo.setSdata(keyword);
		ResponseResultList responseResultList = adminService.ReviewlistPage(vo);
		model.addAttribute("list", responseResultList.getBody());
		model.addAttribute("page", responseResultList.getMeta().get("pagingInfo"));
		model.addAttribute("local", localService.localList());
		model.addAttribute("select", num);
		model.addAttribute("search", searchType);
		model.addAttribute("keyword", keyword);
	}





}