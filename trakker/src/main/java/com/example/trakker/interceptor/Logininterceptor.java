package com.example.trakker.interceptor;


import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Logininterceptor extends HandlerInterceptorAdapter {

    @Override // 선처리
    public boolean preHandle(
            HttpServletRequest request,
            HttpServletResponse response,
            Object handler ) throws Exception{

        HttpSession session = request.getSession();

        if (session.getAttribute("mem_email") == null){ // Main Action 페이지로 이동 안됨
            //로그인 페이지로 이동
            response.sendRedirect(request.getContextPath()+"/member/login.do");
            return false;
        }else {
            return true;
        }


    }

    @Override // 후처리
    public void postHandle(
            HttpServletRequest request,
            HttpServletResponse response,
            Object handler,
            ModelAndView modelAndView) throws Exception{

        super.postHandle(request,response,handler,modelAndView);
    }

}
