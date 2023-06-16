package com.example.trakker.controller;

import com.example.trakker.oauth.bo.KakaoLoginBO;
import com.example.trakker.oauth.bo.NaverLoginBO;

import com.github.scribejava.core.model.OAuth2AccessToken;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

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


    /* NaverLoginBO */
    private NaverLoginBO naverLoginBO;

    private KakaoLoginBO kakaoLoginBO;

    /* NaverLoginBO */
    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO){
        this.naverLoginBO = naverLoginBO;
    }
    @Autowired
    private void setKakaoLoginBO(KakaoLoginBO kakaoLoginBO){
        this.kakaoLoginBO = kakaoLoginBO;
    }

    @RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST})
    public String login(HttpSession session , Model model) {
        /* 네아로 인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

        String kakaoAuthUrl = kakaoLoginBO.getAuthorizationUrl(session);

        System.out.println("naverAuthUrl = " + naverAuthUrl);
        model.addAttribute("urlNaver", naverAuthUrl);
        System.out.println("kakaoAuthUrl = " + kakaoAuthUrl);
        model.addAttribute("urlKakao", kakaoAuthUrl);

        /* 생성한 인증 URL을 View로 전달 */
        return "login";
    }

    @RequestMapping(value = "/callbackNaver" , method = {RequestMethod.GET,RequestMethod.POST})
    public String callbackNaver(Model model,@RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
        System.out.println("로그인 성공 callbackNaver");
        OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
        String apiResult = naverLoginBO.getUserProfile(oauthToken);

        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObj;

        jsonObj= (JSONObject) jsonParser.parse(apiResult);
        JSONObject response_obj = (JSONObject) jsonObj.get("response");

        //프로필 조회
        String email = (String) response_obj.get("email");
        String name = (String) response_obj.get("name");



        //세션에 사용자 정보 등록

        session.setAttribute("signIn",apiResult);
        session.setAttribute("email",email);
        session.setAttribute("name",name);

        return "redirect:/loginSuccess.do";
    }

    @RequestMapping(value = "/callbackKakao" , method = {RequestMethod.GET,RequestMethod.POST})
    public String callbackKakao(Model model,@RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
        System.out.println("로그인 성공 callbackKakao");

        OAuth2AccessToken oauthToken = kakaoLoginBO.getAccessToken(session, code, state);
        String apiResult = kakaoLoginBO.getUserProfile(oauthToken);

        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObj = (JSONObject) jsonParser.parse(apiResult);

        // JSON 객체에서 필요한 정보를 추출합니다.
        JSONObject response_obj = (JSONObject) jsonObj.get("kakao_account");
        JSONObject response_obj2 = (JSONObject) response_obj.get("profile");

        // 프로필 조회
        String email = (String) response_obj.get("email");
        String name = (String) response_obj2.get("nickname");

        // 세션에 사용자 정보 등록
        session.setAttribute("signIn", apiResult);
        session.setAttribute("email", email);
        session.setAttribute("name", name);

        System.out.println("카카오email = " + response_obj.get("email"));
        System.out.println("카카오email = " + (JSONObject) jsonObj.get("kakao_account"));
        System.out.println("카카오name = " + name);

        return "redirect:/loginSuccess.do";
    }

    @RequestMapping("/loginSuccess.do")
    public String loginSuccess(){
        return "loginSuccess";
    }
}
