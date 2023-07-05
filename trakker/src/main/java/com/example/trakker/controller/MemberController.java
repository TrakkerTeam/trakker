package com.example.trakker.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.example.trakker.service.item.HeartService;
import com.example.trakker.service.item.LocalService;
import com.example.trakker.service.member.MailSendService;
import com.example.trakker.service.planner.PlannerService;
import com.example.trakker.service.review.ReviewService;
import com.example.trakker.utils.PagingInfoVO;
import com.example.trakker.utils.ResponseResultList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.trakker.model.member.dto.MemberDTO;
import com.example.trakker.service.member.MemberService;


import java.io.File;
import java.io.IOException;

import java.util.*;

@Controller
public class MemberController {

    @Autowired
    MemberService memberService;
    @Autowired
    MailSendService mailService;
    @Autowired
    BCryptPasswordEncoder passwordEncoder;
    @Autowired
    ReviewService reviewService;
    @Autowired
    PlannerService plannerService;
    @Autowired
    HeartService heartService;
    @Autowired
    LocalService localService;

    @Value("${upload.path}")
    private String memuploadPath;

    private MultipartFile uploadFile;



    @PostMapping("/member/emailCheck.do")
    @ResponseBody
    public int emailCheck(@RequestParam("mem_email") String mem_email) {
        int cnt = memberService.emailCheck(mem_email);
        return cnt;
    }

    @GetMapping("/member/mailCheck.do")
    @ResponseBody
    public String mailCheck(@RequestParam("mem_email") String mem_email) {
        return mailService.joinEmail(mem_email);
    }

    @RequestMapping("admin_test_category.do")
    public String admin_test_category() {
        return "admin/admin_test_category";
    }

    @RequestMapping("/member/termsofuse.do")
    public String termsofuse() {
        return "member/TermsofUse";
    }


    @RequestMapping("/member/home.do")
    public String home() {
        return "redirect:/";
    }


    @RequestMapping("member/mypagePlanner")
    public String mypagecontent2(HttpServletRequest request) {
        return "member/mypagePlanner";
    }

    @RequestMapping("/member/mypageHeart")
    public String mypagecontent(HttpServletRequest request) {
        return "member/mypageHeart";
    }

    @RequestMapping("/member/editprofile.do")
    public String editprofile() {
        return "member/editprofile";
    }

    @RequestMapping("/member/memdelete.do")
    public String memdelete() {
        return "member/memdelete";
    }

    @RequestMapping("/member/mypage.do")
    public String mypage() {
        return "member/mypage";
    }

    @RequestMapping("/member/findpassword.do")
    public String findpassword() {
        return "member/findpassword";
    }

    @RequestMapping("/member/signup.do")
    public String signup() {
        return "member/signup";
    }

    @RequestMapping("/login")
    public String login(HttpServletRequest request, Model model) {
        String uri = request.getHeader("Referer");
        if (uri != null && !uri.contains("/login")) {
            request.getSession().setAttribute("prevPage", uri);
        }
        return "login";
    }


    @RequestMapping("/member/insertMember.do")
    public String insertMember(MemberDTO dto) {
        String encodingPass = passwordEncoder.encode(dto.getMem_pass());
        dto.setMem_pass(encodingPass);
        memberService.insertMember(dto);
        return "home";
    }

    @RequestMapping("/member/login_check.do")
    public ModelAndView login_check(MemberDTO dto, HttpSession session) {
        MemberDTO result = memberService.logincheck(dto, session);

        ModelAndView mav = new ModelAndView();

        if (result != null) {
            if (result.getMem_pass() != null) {
                boolean pwdMatch = passwordEncoder.matches(dto.getMem_pass(), result.getMem_pass());
                if (pwdMatch) {
                    session.setAttribute("mem_email", dto.getMem_email());
                    mav.setViewName("redirect:/member/home.do");
                } else {
                    mav.setViewName("login");
                    mav.addObject("message", "error");
                    Enumeration<String> attributeNames = session.getAttributeNames();
                    while (attributeNames.hasMoreElements()) {
                        String attributeName = attributeNames.nextElement();
                        if (!attributeName.equals("mem_email")) {
                            session.removeAttribute(attributeName);
                        }
                    }
                }
            } else {
                mav.setViewName("login");
                mav.addObject("message", "error");
            }
        } else {
            mav.setViewName("login");
            mav.addObject("message", "error");
        }
        return mav;
    }


    @RequestMapping("/member/removeMember.do")
    public ResponseEntity<String> remove(String mem_email, String mem_pass, Model model,HttpSession session) {
        MemberDTO member = memberService.viewMember(mem_email);
        String hashedPassword = member.getMem_pass();

        boolean passwordMatches = passwordEncoder.matches(mem_pass, hashedPassword);

        if (passwordMatches) {
            memberService.memberDelete(mem_email,member.getMem_num());
            session.invalidate();
            return ResponseEntity.ok("success");
        } else {
            model.addAttribute("message", "비밀번호를 확인해주세요");
            model.addAttribute("dto", memberService.viewMember(mem_email));
            return ResponseEntity.ok("false");
        }
    }
    @PostMapping("/member/pwUpdate.do")
    public ResponseEntity<String>  pwUpdate(String mem_email, String mem_pass, String new_pass, HttpSession session, Model model){
        MemberDTO member = memberService.viewMember(mem_email);
        String hashedPassword = member.getMem_pass();

        boolean passwordMatches = passwordEncoder.matches(mem_pass, hashedPassword);
        if (passwordMatches) {
            String newHashedPassword = passwordEncoder.encode(new_pass);
            memberService.pwUpdate(mem_email,newHashedPassword);
            session.invalidate();
            return ResponseEntity.ok("success");
        } else {
            model.addAttribute("message", "비밀번호를 확인해주세요");
            model.addAttribute("dto", memberService.viewMember(mem_email));
            return ResponseEntity.ok("false");
        }
    }
    @RequestMapping("/member/pwcheck.do")
    public ResponseEntity<String> pwcheck(String mem_email, String mem_pass,HttpSession session){
        MemberDTO member = memberService.viewMember(mem_email);
        String hashedPassword = member.getMem_pass();

        boolean passwordMatches = passwordEncoder.matches(mem_pass, hashedPassword);
        if (passwordMatches) {
            return ResponseEntity.ok("success");
        }else {
            return ResponseEntity.ok("failure");
        }
    }

    @RequestMapping("/logout")
    public ModelAndView logout(HttpSession session, ModelAndView mav) {
        memberService.logout(session);
        mav.setViewName("redirect:/login");
        mav.addObject("message", "logout");
        return mav;
    }

    @RequestMapping("/member/editpass.do")
    public String editpass(){
        return "member/editpass";
    }

    @RequestMapping("/member/findpass")
    public ResponseEntity<String> findPassEmail(@RequestParam("mem_email")String mem_email) {
        if (emailCheck(mem_email) == 1) {
            mailService.makeRandomNumber1();
            String authNumber = mailService.getAuthNumber();

            String new_pass = passwordEncoder.encode(authNumber);

            memberService.pwUpdate(mem_email, new_pass);

            mailService.joinPassEmail(mem_email);
            return ResponseEntity.ok("success");
        } else {
            return ResponseEntity.ok("false");
        }
    }



    @RequestMapping("/member/mem_update.do")
    public String mem_update(@ModelAttribute MemberDTO dto, HttpSession session, @RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request) {

        String existingImageUrl = (String) session.getAttribute("picture_url");

        if (file == null || file.isEmpty()) {
            dto.setPicture_url(existingImageUrl);
        } else {

            String uploadFolder = "c:/upload";
            UUID uuid = UUID.randomUUID();
            String[] uuids = uuid.toString().split("-");
            String uniqueName = uuids[0];
            String fileExtension = "";
            int lastDotIndex = file.getOriginalFilename().lastIndexOf(".");
            if (lastDotIndex >= 0 && lastDotIndex < file.getOriginalFilename().length() - 1) {
                fileExtension = file.getOriginalFilename().substring(lastDotIndex + 1);
            }
            String imageUrl = request.getContextPath() + "/picture_url/" + uniqueName + "."+fileExtension;

            File saveFile = new File(uploadFolder + "/" + uniqueName + "."+fileExtension);
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

        memberService.updateMember(dto);

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


    @GetMapping("/member/r_list")
    public void list(Model model, @RequestParam("num") Integer num, HttpSession session, MemberDTO dto,
                     @RequestParam(value = "searchType",required = false, defaultValue = "title") String searchType,
                     @RequestParam(value = "keyword",required = false, defaultValue = "") String keyword,
                     @RequestParam(value = "area",required = false, defaultValue = "0") Integer area,
                     @RequestParam(value = "sort",required = false, defaultValue = "add") String sort){


        Long mem_num = (Long) session.getAttribute("mem_num");
        dto.setMem_num(mem_num);

        PagingInfoVO vo = new PagingInfoVO();
        vo.setPageNum(num);
        vo.setArea(area);
        vo.setSort(sort);
        vo.setStype(searchType);
        vo.setSdata(keyword);
        ResponseResultList responseResultList = reviewService.r_list(vo,mem_num);
        model.addAttribute("list", responseResultList.getBody());
        model.addAttribute("page", responseResultList.getMeta().get("pagingInfo"));
        model.addAttribute("local", localService.localList());
        model.addAttribute("select", num);
        model.addAttribute("search", searchType);
        model.addAttribute("keyword",keyword);
    }


    @GetMapping("/member/mypagePlanner")
    public String list(Model model,
                       HttpSession session,
                       HttpServletRequest request,MemberDTO dto,
                       @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                       @RequestParam(value = "area",required = false, defaultValue = "0") Integer area,
                       @RequestParam(value = "sort",required = false, defaultValue = "add") String sort,
                       @RequestParam(value = "searchType",required = false, defaultValue = "") String searchType,
                       @RequestParam(value = "keyword",required = false, defaultValue = "") String keyword) {

        Long memNum = (Long) session.getAttribute("mem_num");
        dto.setMem_num(memNum);

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

        model.addAttribute("local", localService.localList());
        model.addAttribute("area", area);
        model.addAttribute("sort", sort);

        model.addAttribute("type", searchType);
        model.addAttribute("keyword",keyword);


        return "member/mypagePlanner";
    }

    @GetMapping("/member/mypageHeart")
    public String m_list(Model model,
                         HttpSession session,
                         HttpServletRequest request,MemberDTO dto,
                         @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                         @RequestParam(value = "area",required = false, defaultValue = "0") Integer area,
                         @RequestParam(value = "sort",required = false, defaultValue = "add") String sort,
                         @RequestParam(value = "searchType",required = false, defaultValue = "") String searchType,
                         @RequestParam(value = "keyword",required = false, defaultValue = "") String keyword) {

        Long memNum = (Long) session.getAttribute("mem_num");
        dto.setMem_num(memNum);

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

        model.addAttribute("local", localService.localList());
        model.addAttribute("area", area);
        model.addAttribute("sort", sort);

        model.addAttribute("type", searchType);
        model.addAttribute("keyword",keyword);

        return "member/mypageHeart";
    }
}
