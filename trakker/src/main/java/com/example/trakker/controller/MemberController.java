package com.example.trakker.controller;

import javax.servlet.http.HttpSession;

import com.example.trakker.service.member.MailSendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.example.trakker.model.member.dto.MemberDTO;
import com.example.trakker.service.member.MemberService;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	//아이디 중복체크
	@PostMapping("emailCheck.do")
	@ResponseBody
	public int emailCheck(@RequestParam("mem_email") String mem_email) {
		int cnt = memberService.emailCheck(mem_email);
		return cnt;
	}

	@GetMapping("mailCheck.do")
	@ResponseBody
	public String mailCheck(@RequestParam("mem_email")String mem_email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + mem_email);
		return mailService.joinEmail(mem_email);
	}

	@RequestMapping("admin_test_category.do")
	public String admin_test_category(){
		return "admin/admin_test_category";
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
		String encodingPass = passwordEncoder.encode(dto.getMem_pass()); //암호화처리
		dto.setMem_pass(encodingPass);//암호화처리
		memberService.insertMember(dto);
		return "home";
	}


@RequestMapping("login_check.do")
public ModelAndView login_check(MemberDTO dto, HttpSession session) {
	MemberDTO result = memberService.logincheck(dto, session);
	System.out.println("테스트용 : " + result);
	ModelAndView mav = new ModelAndView();
	if (result != null) { // 인증 성공 시
		boolean pwdMatch = passwordEncoder.matches(dto.getMem_pass(), result.getMem_pass());
		if (pwdMatch) {
			session.setAttribute("mem_email", dto.getMem_email());
			mav.setViewName("home");
		} else { // 비밀번호 불일치 시
			mav.setViewName("member/login");
			mav.addObject("message", "error");
		}
	} else { // 로그인 실패 시
		mav.setViewName("member/login");
		mav.addObject("message", "error");
	}
	return mav;
}

	@RequestMapping("mem_update.do")
	public String mem_update(@ModelAttribute MemberDTO dto,HttpSession session ){
		// 비밀번호 암호화
		String encodedPassword = passwordEncoder.encode(dto.getMem_pass());
		dto.setMem_pass(encodedPassword);

		memberService.updateMember(dto);

		// 세션에 업데이트된 회원 정보 반영 안되면 지우기
		MemberDTO updatedMember = memberService.getupdateMember(dto.getMem_email());
		session.setAttribute("mem_name", updatedMember);
		// 세션에 회원 이름만 저장
		session.setAttribute("mem_name", updatedMember.getMem_name());
		session.setAttribute("mem_nickname", updatedMember.getMem_nickname());
		session.setAttribute("mem_zipcode", updatedMember.getMem_zipcode());
		session.setAttribute("mem_address1", updatedMember.getMem_address1());
		session.setAttribute("mem_address2", updatedMember.getMem_address2());
		session.setAttribute("mem_phone", updatedMember.getMem_phone());

		return "redirect:/member/mypage.do";
	}

//	@RequestMapping("mem_update.do")
//	public String mem_update(MemberDTO dto){
//		memberService.updateMember(dto);
//		return "member/mypage";
//	}


	@RequestMapping("removeMember.do") //다시해야함 회원탈퇴
	public String remove(MemberDTO dto, HttpSession session, RedirectAttributes rttr) {
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String oldpass = member.getMem_pass();
		String newpass = dto.getMem_pass();
		// 기존 비밀번호와 입력한 새 비밀번호가 모두 null인 경우 처리
		if (oldpass == null && newpass == null) {
			memberService.memberDelete(dto);
			session.invalidate();
			return "redirect:/";
		}

		// 기존 비밀번호와 입력한 새 비밀번호가 모두 null이 아닌 경우 암호화하여 비교
		if (oldpass != null && newpass != null) {
			String encodedOldpass = passwordEncoder.encode(oldpass);
			String encodedNewpass = passwordEncoder.encode(newpass);

			if (!encodedOldpass.equals(encodedNewpass)) {
				rttr.addFlashAttribute("message", false);
				return "redirect:/member/memdelete";
			}
		} else {
			// 기존 비밀번호와 입력한 새 비밀번호 중 하나가 null인 경우 처리
			rttr.addFlashAttribute("message", false);
			return "redirect:/member/memdelete";
		}

		memberService.memberDelete(dto);
		session.invalidate();
		return "redirect:/";
	}


	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
	memberService.logout(session); 
	 mav.setViewName("member/login"); 
	 mav.addObject("message", "logout"); 
	  return mav;
	  }
	 
	
}
