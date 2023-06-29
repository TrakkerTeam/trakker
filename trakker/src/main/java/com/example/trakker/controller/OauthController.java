package com.example.trakker.controller;

import com.example.trakker.model.member.dto.MemberDTO;
import com.example.trakker.oauth.bo.KakaoLoginBO;
import com.example.trakker.oauth.bo.NaverLoginBO;


import com.example.trakker.oauth.service.OauthUserService;
import com.github.scribejava.core.model.OAuth2AccessToken;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class OauthController {

    private static final Logger logger = LoggerFactory.getLogger(AdminController.class);


    /* NaverLoginBO */
    private NaverLoginBO naverLoginBO;

    private KakaoLoginBO kakaoLoginBO;

    @Autowired
    private OauthUserService oauthUserService;

    /* NaverLoginBO */
    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO){
        this.naverLoginBO = naverLoginBO;
    }
    /* KakaoLoginBO */
    @Autowired
    private void setKakaoLoginBO(KakaoLoginBO kakaoLoginBO){
        this.kakaoLoginBO = kakaoLoginBO;
    }

    @RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST})
    public String login(HttpSession session , Model model) {

        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

        String kakaoAuthUrl = kakaoLoginBO.getAuthorizationUrl(session);

        System.out.println("naverAuthUrl = " + naverAuthUrl);
        model.addAttribute("urlNaver", naverAuthUrl);


        System.out.println("kakaoAuthUrl = " + kakaoAuthUrl);
        model.addAttribute("urlKakao", kakaoAuthUrl);

        return "login";
    }

    @RequestMapping(value = "/callbackNaver" , method = {RequestMethod.GET,RequestMethod.POST})
    public String callbackNaver(Model model,@RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {

        OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
        String apiResult = naverLoginBO.getUserProfile(oauthToken);

        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObj;

        jsonObj = (JSONObject) jsonParser.parse(apiResult);
        JSONObject response_obj = (JSONObject) jsonObj.get("response");

        //프로필 조회
        String nickname = (String)response_obj.get("nickname");
        String id = (String) response_obj.get("id");
        String email = (String) response_obj.get("email");
        String name = (String) response_obj.get("name");


         // 회원 체크
        MemberDTO userCheck =oauthUserService.userCheck(nickname);

        // 디비 체크
        if (userCheck != null) {


            session.setAttribute("signIn", apiResult);
            session.setAttribute("email", email);
            session.setAttribute("name", name);
            session.setAttribute("nickname" , nickname);

            return "home";


        } else {

            MemberDTO dto = new MemberDTO();

            dto.setMem_id(id);
            dto.setMem_name(name);
            dto.setMem_email(email);
            dto.setMem_nickname(nickname);

            oauthUserService.insertNaverUser(dto);

            return "redirect:/loginSuccess.do";

        }
    }
    @RequestMapping(value = "/callbackKakao" , method = {RequestMethod.GET,RequestMethod.POST})
    public String callbackKakao(Model model,@RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {

        OAuth2AccessToken oauthToken = kakaoLoginBO.getAccessToken(session, code, state);
        String apiResult = kakaoLoginBO.getUserProfile(oauthToken);

        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObj = (JSONObject) jsonParser.parse(apiResult);

        // JSON 객체에서 필요한 정보를 추출합니다.
        JSONObject response_obj = (JSONObject) jsonObj.get("kakao_account");
        JSONObject response_obj2 = (JSONObject) response_obj.get("profile");


        long id = (long) jsonObj.get("id");
        String nickname = (String) response_obj2.get("nickname");
        String email = (String) response_obj.get("email");



        MemberDTO userCheck =oauthUserService.userCheck(nickname);


        if(userCheck != null){

            session.setAttribute("signIn", apiResult);
            session.setAttribute("email", id);
            session.setAttribute("name", nickname);


            return "home";

        }else {
            MemberDTO dto = new MemberDTO();

            dto.setMem_nickname(nickname);
            dto.setMem_email(email);

            oauthUserService.insertKakaoUser(dto);

            session.setAttribute("signIn", apiResult);
            session.setAttribute("email", id);
            session.setAttribute("name", nickname);

            return "redirect:/loginSuccess.do";

        }





    }

    @RequestMapping("/loginSuccess.do")
    public String loginSuccess(){
        return "loginSuccess";
    }
}
