package com.example.trakker.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.example.trakker.service.member.MailSendService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.ImportResource;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.trakker.model.member.dto.MemberDTO;
import com.example.trakker.service.member.MemberService;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.io.IOException;
import java.util.*;

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

	@Value("${upload.path}") // properties 파일에서 설정된 경로를 가져옵니다
	private String memuploadPath;


	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	private MultipartFile uploadFile; // 멀티파일 객체



	//아이디 중복체크
	@PostMapping("emailCheck.do")
	@ResponseBody
	public int emailCheck(@RequestParam("mem_email") String mem_email) {
		int cnt = memberService.emailCheck(mem_email);
		return cnt;
	}

	@GetMapping("mailCheck.do")
	@ResponseBody
	public String mailCheck(@RequestParam("mem_email") String mem_email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + mem_email);
		return mailService.joinEmail(mem_email);
	}

	@RequestMapping("admin_test_category.do")
	public String admin_test_category() {
		return "admin/admin_test_category";
	}

	@RequestMapping("termsofuse.do")
	public String termsofuse() {
		return "member/TermsofUse";
	}


	@RequestMapping("home.do")
	public String home() {
		return "home";
	}

	@RequestMapping("mypagecontent3.do")
	public String mypagecontent3() {
		return "member/mypagecontent3";
	}

	@RequestMapping("mypagecontent2.do")
	public String mypagecontent2() {
		return "member/mypagecontent2";
	}

	@RequestMapping("mypagecontent.do")
	public String mypagecontent() {
		return "member/mypagecontent";
	}

	@RequestMapping("editprofile.do")
	public String editprofile() {
		return "member/editprofile";
	}

	@RequestMapping("memdelete.do")
	public String memdelete() {
		return "member/memdelete";
	}

	@RequestMapping("mypage.do")
	public String mypage() {
		return "member/mypage";
	}

	@RequestMapping("findpassword.do")
	public String findpassword() {
		return "member/findpassword";
	}

	@RequestMapping("signup.do")
	public String signup() {
		return "member/signup";
	}

	//로그인
	@RequestMapping("login.do")
	public String login() {
		return "member/login";
	}

	//회원가입
	@RequestMapping("insertMember.do")
	public String insertMember(MemberDTO dto) {
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

		System.out.println("dto.getMem_pass: " + dto.getMem_pass());
		if (result != null) { // 인증 성공 시
			if (result.getMem_pass() != null) {
				boolean pwdMatch = passwordEncoder.matches(dto.getMem_pass(), result.getMem_pass());
				if (pwdMatch) {
					session.setAttribute("mem_email", dto.getMem_email());
					mav.setViewName("home");
				} else { // 비밀번호 불일치 시
					mav.setViewName("member/login");
					mav.addObject("message", "error");
					// Remove all other session attributes
					Enumeration<String> attributeNames = session.getAttributeNames();
					while (attributeNames.hasMoreElements()) {
						String attributeName = attributeNames.nextElement();
						if (!attributeName.equals("mem_email")) {
							session.removeAttribute(attributeName);
						}
					}
				}
			} else { // result.getMem_pass()가 null인 경우
				mav.setViewName("member/login");
				mav.addObject("message", "error");
			}
		} else { // 로그인 실패 시
			mav.setViewName("member/login");
			mav.addObject("message", "error");
		}
		return mav;
	}


//	@RequestMapping("login_check.do")
//	public ModelAndView login_check(MemberDTO dto, HttpSession session) {
//		MemberDTO result = memberService.logincheck(dto, session);
//		System.out.println("테스트용 : " + result);
//		ModelAndView mav = new ModelAndView();
//
//		System.out.println("dto.getMem_pass"+dto.getMem_pass());
//		System.out.println("result.getMem_pass"+result.getMem_pass());
//
//		if (result != null) { // 인증 성공 시
//			boolean pwdMatch = passwordEncoder.matches(dto.getMem_pass(), result.getMem_pass());
//			if (pwdMatch) {
//				session.setAttribute("mem_email", dto.getMem_email());
//				mav.setViewName("home");
//			} else { // 비밀번호 불일치 시
//				mav.setViewName("member/login");
//				mav.addObject("message", "error");
//				// Remove all other session attributes
//				Enumeration<String> attributeNames = session.getAttributeNames();
//				while (attributeNames.hasMoreElements()) {
//					String attributeName = attributeNames.nextElement();
//					if (!attributeName.equals("mem_email")) {
//						session.removeAttribute(attributeName);
//					}
//				}
//			}
//		} else { // 로그인 실패 시
//			mav.setViewName("member/login");
//			mav.addObject("message", "error");
//		}
//		return mav;
//	}







	@RequestMapping("removeMember.do")
	public ResponseEntity<String> remove(String mem_email, String mem_pass, Model model,HttpSession session) {
		MemberDTO member = memberService.viewMember(mem_email);
		String hashedPassword = member.getMem_pass(); // 데이터베이스에 저장된 암호화된 비밀번호

		boolean passwordMatches = passwordEncoder.matches(mem_pass, hashedPassword); // 입력한 비밀번호와 암호화된 비밀번호 비교

		if (passwordMatches) {
			memberService.memberDelete(mem_email);
			session.invalidate(); // 세션 초기화
			return ResponseEntity.ok("success");
		} else {
			model.addAttribute("message", "비밀번호를 확인해주세요");
			model.addAttribute("dto", memberService.viewMember(mem_email));
			return ResponseEntity.ok("false");
		}
	}
	@PostMapping("pwUpdate.do")
	public ResponseEntity<String>  pwUpdate(String mem_email, String mem_pass, String new_pass, HttpSession session, Model model){
		MemberDTO member = memberService.viewMember(mem_email);
		String hashedPassword = member.getMem_pass(); // 데이터베이스에 저장된 암호화된 비밀번호

		boolean passwordMatches = passwordEncoder.matches(mem_pass, hashedPassword); // 입력한 비밀번호와 암호화된 비밀번호 비교
		if (passwordMatches) {
			String newHashedPassword = passwordEncoder.encode(new_pass);
			memberService.pwUpdate(mem_email,newHashedPassword);
			session.invalidate(); // 세션 초기화
			return ResponseEntity.ok("success");
		} else {
			model.addAttribute("message", "비밀번호를 확인해주세요");
			model.addAttribute("dto", memberService.viewMember(mem_email));
			return ResponseEntity.ok("false");
		}
	}
	@RequestMapping("pwcheck.do")
	public ResponseEntity<String> pwcheck(String mem_email, String mem_pass,HttpSession session){
		MemberDTO member = memberService.viewMember(mem_email);
		String hashedPassword = member.getMem_pass(); // 데이터베이스에 저장된 암호화된 비밀번호

		boolean passwordMatches = passwordEncoder.matches(mem_pass, hashedPassword); // 입력한 비밀번호와 암호화된 비밀번호 비교
		if (passwordMatches) {
			return ResponseEntity.ok("success");
		}else {
			return ResponseEntity.ok("failure");
		}
	}

	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
	memberService.logout(session); 
	 mav.setViewName("member/login");
	 mav.addObject("message", "logout"); 
	  return mav;
	  }

	@RequestMapping("editpass.do")
	public String editpass(){
		return "member/editpass";
	}

	@RequestMapping("findpass")
	public ResponseEntity<String> findPassEmail(@RequestParam("mem_email")String mem_email) {
		// Check if the mem_email exists in the database
		if (emailCheck(mem_email) == 1) {
			mailService.makeRandomNumber1();
			String authNumber = mailService.getAuthNumber(); //새로운 비밀번호 받기

			String new_pass = passwordEncoder.encode(authNumber); //새로받은 비밀번호 암호화

			memberService.pwUpdate(mem_email, new_pass); //새롭게 받은 비밀번호 업데이트

			mailService.joinPassEmail(mem_email); //이메일 보내기
			return ResponseEntity.ok("success");
		} else {
			return ResponseEntity.ok("false");
		}
	}



	@RequestMapping("mem_update.do")
	public String mem_update(@ModelAttribute MemberDTO dto, HttpSession session, @RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request) {
		// 기존 이미지 URL 가져오기
		String existingImageUrl = (String) session.getAttribute("picture_url");

		// 이미지가 선택되지 않았을 때 기존 파일 유지
		if (file == null || file.isEmpty()) {
			dto.setPicture_url(existingImageUrl);
		} else {
			// 이미지가 선택되었을 때의 로직은 여기에 작성

			// 파일 저장 경로 및 URL 설정
			String uploadFolder = "/Users/youjaejun/upload/";
			UUID uuid = UUID.randomUUID();
			String[] uuids = uuid.toString().split("-");
			String uniqueName = uuids[0];
			String fileExtension = "";
			int lastDotIndex = file.getOriginalFilename().lastIndexOf(".");
			if (lastDotIndex >= 0 && lastDotIndex < file.getOriginalFilename().length() - 1) {
				fileExtension = file.getOriginalFilename().substring(lastDotIndex + 1);
			}
			String imageUrl = request.getContextPath() + "/picture_url/" + uniqueName + "."+fileExtension;

			// 파일 저장
			File saveFile = new File(uploadFolder + "/" + uniqueName + "."+fileExtension);
			try {
				file.transferTo(saveFile);
			} catch (IOException e) {
				e.printStackTrace();
			}

			// 업데이트된 이미지 URL 설정
			dto.setPicture_url(imageUrl);

			// 이전 파일 삭제 (선택적으로 진행)
			if (existingImageUrl != null && !existingImageUrl.isEmpty()) {
				String existingFileName = existingImageUrl.substring(existingImageUrl.lastIndexOf("/") + 1);
				File existingFile = new File(uploadFolder + "/" + existingFileName);
				existingFile.delete();
			}
		}

		// 나머지 로직은 동일하게 유지

		// 비밀번호 암호화
		String encodedPassword = passwordEncoder.encode(dto.getMem_pass());
		dto.setMem_pass(encodedPassword);

		memberService.updateMember(dto);

		// 세션에 업데이트된 회원 정보 반영
		MemberDTO updatedMember = memberService.getupdateMember(dto.getMem_email());
		session.setAttribute("mem_name", updatedMember.getMem_name());
		session.setAttribute("mem_nickname", updatedMember.getMem_nickname());
		session.setAttribute("mem_zipcode", updatedMember.getMem_zipcode());
		session.setAttribute("mem_address1", updatedMember.getMem_address1());
		session.setAttribute("mem_address2", updatedMember.getMem_address2());
		session.setAttribute("mem_phone", updatedMember.getMem_phone());
		session.setAttribute("picture_url", updatedMember.getPicture_url());

		return "redirect:/member/mypage.do";
	}


//	@RequestMapping("mem_update.do")
//	public String mem_update(@ModelAttribute MemberDTO dto, HttpSession session,@RequestParam("file") MultipartFile file, HttpServletRequest request){
//		long size = file.getSize(); //파일 사이즈
//		String fileRealName = file.getOriginalFilename(); //파일명을 얻어낼 수 있는 메서드!
////		System.out.println("파일명 : "  + fileRealName);
////		System.out.println("용량크기(byte) : " + size);
//		//서버에 저장할 파일이름 fileextension으로 .jsp이런식의  확장자 명을 구함
//		String fileExtension = "";
//		int lastDotIndex = fileRealName.lastIndexOf(".");
//		if (lastDotIndex >= 0 && lastDotIndex < fileRealName.length() - 1) {
//			fileExtension = fileRealName.substring(lastDotIndex + 1);
//		}
//		String uploadFolder = "/Users/youjaejun/upload/";
//
//
//		UUID uuid = UUID.randomUUID();
//		System.out.println(uuid.toString());
//		String[] uuids = uuid.toString().split("-");
//
//		String uniqueName = uuids[0];
//		System.out.println("생성된 고유문자열" + uniqueName);
//		System.out.println("확장자명" + fileExtension);
//
//
//
//		String baseUrl = request.getRequestURL().toString();
//		String imageUrl = request.getContextPath() + "/picture_url/" + uniqueName + fileExtension;
//		session.setAttribute("baseUrl", baseUrl);
//		session.setAttribute("picture_url", imageUrl);
//
//		System.out.println("imageUrl : "+imageUrl);
//		System.out.println("imageUrl : "+imageUrl);
//		System.out.println("imageUrl : "+imageUrl);
//		System.out.println("imageUrl : "+imageUrl);
//
//
//		File saveFile = new File(uploadFolder+"/"+uniqueName + fileExtension);  // 적용 후
//		System.out.println("saveFile : "+saveFile);
//		try {
//			file.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
//		} catch (IllegalStateException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		System.out.println("fileRealName : " + fileRealName);
//		dto.setPicture_url(imageUrl);
//
//				// 비밀번호 암호화
//		String encodedPassword = passwordEncoder.encode(dto.getMem_pass());
//		dto.setMem_pass(encodedPassword);
//
//		memberService.updateMember(dto);
//
//		// 세션에 업데이트된 회원 정보 반영
//		MemberDTO updatedMember = memberService.getupdateMember(dto.getMem_email());
//		session.setAttribute("mem_name", updatedMember.getMem_name());
//		session.setAttribute("mem_nickname", updatedMember.getMem_nickname());
//		session.setAttribute("mem_zipcode", updatedMember.getMem_zipcode());
//		session.setAttribute("mem_address1", updatedMember.getMem_address1());
//		session.setAttribute("mem_address2", updatedMember.getMem_address2());
//		session.setAttribute("mem_phone", updatedMember.getMem_phone());
//		session.setAttribute("picture_url", updatedMember.getPicture_url());
//
//
//		return "redirect:/member/mypage.do";
//	}

}
