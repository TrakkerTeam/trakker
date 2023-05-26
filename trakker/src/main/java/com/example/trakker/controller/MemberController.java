package com.example.trakker.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.trakker.model.member.dto.MemberDTO;
import com.example.trakker.service.MemberService;

import java.util.List;

@Controller
@RequestMapping("member/*")
public class MemberController {

	@Autowired
	MemberService memberService;


	@RequestMapping("editprofile.do")
	public String editprofile(){
		return "member/editprofile";
	}

	@RequestMapping("memdelete.do")
	public String memdelete(){
		return "member/memdelete";
	}

	@RequestMapping("mypage.do")
	public String mypage(){
		return "member/mypage";
	}

	@RequestMapping("findpassword.do")
	public String findpassword(){
		return "member/findpassword";
	}
	@RequestMapping("signup.do")
	public String signup(){
		return "member/signup";
	}

	@RequestMapping("login.do")
	 public String login() {
	  return "member/login";
	}
	
	@RequestMapping("login_check.do")
	public ModelAndView login_check(MemberDTO dto, HttpSession session) {
		String result = memberService.logincheck(dto, session);
	 ModelAndView mav = new ModelAndView();
	  if (result !=null) { // 로그인 성공 시
//		  if (result.equals("1")) { // If admin_ck is 1
//			  mav.setViewName("admin/admin"); // Redirect to admin.jsp
//		  } else { // If admin_ck is not 1
//			  mav.setViewName("home"); // Redirect to home
//		  }
		 mav.setViewName("home"); // 뷰의 이름
	   } else { // 로그인 실패 시
	     mav.setViewName("member/login"); 		
	     mav.addObject("message", "error");
	     }
	     return mav;
	   }

	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
	memberService.logout(session); 
	 mav.setViewName("member/login"); 
	 mav.addObject("message", "logout"); 
	  return mav;
	  }
	 
	
}
