package com.example.trakker.controller;

import com.example.trakker.oauth.bo.NaverLoginBO;
import com.github.scribejava.core.model.OAuth2AccessToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class NaverLoginTutorial {


    /* NaverLoginBO */
    private NaverLoginBO naverLoginBO;

    /* NaverLoginBO */
    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO){
        this.naverLoginBO = naverLoginBO;
    }

    @RequestMapping("/login")
    public ModelAndView login(HttpSession session) {
        /* 네아로 인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

        /* 생성한 인증 URL을 View로 전달 */
        return new ModelAndView("login", "url", naverAuthUrl);
    }

    @RequestMapping("/callback")
    public ModelAndView callback(@RequestParam String code, @RequestParam String state, HttpSession session) throws IOException {
        OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
        String apiResult = naverLoginBO.getUserProfile(oauthToken);
        return new ModelAndView("callback", "result", apiResult);
    }
}
