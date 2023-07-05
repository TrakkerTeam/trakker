package com.example.trakker.controller;

import com.example.trakker.model.member.dto.MemberDTO;
import com.example.trakker.oauth.bo.KakaoLoginBO;
import com.example.trakker.oauth.bo.NaverLoginBO;


import com.example.trakker.oauth.service.OauthUserService;
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




    private NaverLoginBO naverLoginBO;

    private KakaoLoginBO kakaoLoginBO;

    @Autowired
    private OauthUserService oauthUserService;


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

        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

        String kakaoAuthUrl = kakaoLoginBO.getAuthorizationUrl(session);


        model.addAttribute("urlNaver", naverAuthUrl);



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


        String mem_nickname = (String)response_obj.get("nickname");
        String mem_id = (String) response_obj.get("id");
        String mem_email = (String) response_obj.get("email");
        String mem_name = (String) response_obj.get("name");



        MemberDTO userCheck =oauthUserService.userCheck(mem_nickname);


        if (userCheck != null) {


            session.setAttribute("signIn", apiResult);
            session.setAttribute("email", mem_email);
            session.setAttribute("name", mem_name);
            session.setAttribute("mem_nickname" , mem_nickname);

            return "home";


        } else {

            MemberDTO dto = new MemberDTO();

            dto.setMem_id(mem_id);
            dto.setMem_name(mem_name);
            dto.setMem_email(mem_email);
            dto.setMem_nickname(mem_nickname);

            oauthUserService.insertNaverUser(dto);

            return "home";

        }
    }
    @RequestMapping(value = "/callbackKakao" , method = {RequestMethod.GET,RequestMethod.POST})
    public String callbackKakao(Model model,@RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {

        OAuth2AccessToken oauthToken = kakaoLoginBO.getAccessToken(session, code, state);
        String apiResult = kakaoLoginBO.getUserProfile(oauthToken);

        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObj = (JSONObject) jsonParser.parse(apiResult);


        JSONObject response_obj = (JSONObject) jsonObj.get("kakao_account");
        JSONObject response_obj2 = (JSONObject) response_obj.get("profile");


        long id = (long) jsonObj.get("id");
        String mem_nickname = (String) response_obj2.get("nickname");
        String mem_email = (String) response_obj.get("email");



        MemberDTO userCheck =oauthUserService.userCheck(mem_nickname);


        if(userCheck != null){

            session.setAttribute("signIn", apiResult);
            session.setAttribute("email", id);
            session.setAttribute("mem_nickname", mem_nickname);


            return "home";

        }else {
            MemberDTO dto = new MemberDTO();

            dto.setMem_nickname(mem_nickname);
            dto.setMem_email(mem_email);

            oauthUserService.insertKakaoUser(dto);

            session.setAttribute("signIn", apiResult);
            session.setAttribute("email", id);
            session.setAttribute("mem_nickname", mem_nickname);

            return "home";

        }
    }

}
