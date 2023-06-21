package com.example.trakker.interceptor;


import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Logininterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(
            HttpServletRequest request,
            HttpServletResponse response,
            Object handler ) throws Exception{

        HttpSession session = request.getSession();

        if (session.getAttribute("mem_email") == null){

            response.sendRedirect(request.getContextPath()+"/member/login.do");
            return false;
        }else {
            return true;
        }


    }

    @Override
    public void postHandle(
            HttpServletRequest request,
            HttpServletResponse response,
            Object handler,
            ModelAndView modelAndView) throws Exception{

        super.postHandle(request,response,handler,modelAndView);
    }

}
