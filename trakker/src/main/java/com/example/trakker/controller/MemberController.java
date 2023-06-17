package com.example.trakker.controller;

import javax.servlet.http.HttpSession;

import com.example.trakker.service.member.MailSendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.trakker.model.member.dto.MemberDTO;
import com.example.trakker.service.member.MemberService;

//이 멤버 컨트롤러는 회원 관련 기능을 처리하기 위한 역할을 담당합니다.
//멤버 컨트롤러는 회원 관련 기능의 처리와 관련된 메서드들을 정의하고,
//각 요청에 따라 적절한 응답을 반환하거나 다른 페이지로 리다이렉트합니다.
@Controller
@RequestMapping("member/*")
public class MemberController {

    @Autowired
    MemberService memberService;
    @Autowired
    MailSendService mailService;

    @GetMapping("mailCheck.do")
    @ResponseBody
    public String mailCheck(@RequestParam("mem_email")String mem_email) {
        System.out.println("이메일 인증 요청이 들어옴!");
        System.out.println("이메일 인증 이메일 : " + mem_email);
        return mailService.joinEmail(mem_email);
    }

    @RequestMapping("admin_test_category.do")
    public String admin_test_category(){
        return "admin/admin_main";
    }
    @RequestMapping("termsofuse.do")
    public String termsofuse(){
        return "member/TermsofUse";
    }


    @RequestMapping("mypagecontent3.do")
    public String mypagecontent3(){
        return "member/mypagecontent3";
    }
    @RequestMapping("mypagecontent2.do")
    public String mypagecontent2(){
        return "member/mypagecontent2";
    }

    @RequestMapping("mypagecontent.do")
    public String mypagecontent(){
        return "member/mypagecontent";
    }
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

    //로그인
    @RequestMapping("login.do")
    public String login() {
        return "member/login";
    }

    //회원가입
    @RequestMapping ("insertMember.do")
    public String insertMember(MemberDTO dto){
        memberService.insertMember(dto);
        return "home";
    }

    //회원의 이메일과 비밀번호체크기능
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
            mav.setViewName("home");
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
