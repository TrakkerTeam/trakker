package com.example.trakker.oauth.bo;

import com.example.trakker.oauth.model.KakaoLoginApi;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.UUID;

public class KakaoLoginBO {

    private final static String KAKAO_CLIENT_ID = "b85bcca84d75d6ade2ff85e419041c99";
    private final static String KAKAO_CLIENT_SECRET = "Ny8gt87juxwA6Q18Gc3rryOvCBEu0lk0";
    private final static String KAKAO_REDIRECT_URI = "http://localhost:9090/trakker/callbackKakao";
    private final static String SESSION_STATE = "kakao_oauth_state";

    private final static String PROFILE_API_URL ="https://kapi.kakao.com/v2/user/me";



    public String getAuthorizationUrl(HttpSession session) {


        String state = generateRandomString();

        setSession(session,state);


        OAuth20Service oauthService = new ServiceBuilder()
                .apiKey(KAKAO_CLIENT_ID)
                .apiSecret(KAKAO_CLIENT_SECRET)
                .callback(KAKAO_REDIRECT_URI)
                .state(state)
                .build(KakaoLoginApi.instance());

        return oauthService.getAuthorizationUrl();
    }


    public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException {


        String sessionState = getSession(session);
        if(StringUtils.pathEquals(sessionState, state)){

            OAuth20Service oauthService = new ServiceBuilder()
                    .apiKey(KAKAO_CLIENT_ID)
                    .apiSecret(KAKAO_CLIENT_SECRET)
                    .callback(KAKAO_REDIRECT_URI)
                    .state(state)
                    .build(KakaoLoginApi.instance());


            OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
            return accessToken;
        }
        return null;
    }


    private String generateRandomString() {
        return UUID.randomUUID().toString();
    }


    private void setSession(HttpSession session,String state){
        session.setAttribute(SESSION_STATE, state);
    }


    private String getSession(HttpSession session){
        return (String) session.getAttribute(SESSION_STATE);
    }


    public String getUserProfile(OAuth2AccessToken oauthToken) throws IOException{

        OAuth20Service oauthService =new ServiceBuilder()
                .apiKey(KAKAO_CLIENT_ID)
                .apiSecret(KAKAO_CLIENT_SECRET)
                .callback(KAKAO_REDIRECT_URI).build(KakaoLoginApi.instance());

        OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
        oauthService.signRequest(oauthToken, request);
        Response response = request.send();


        String responseBody = response.getBody();


        return response.getBody();
    }


}
