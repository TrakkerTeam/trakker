//package com.example.trakker.config.aop;
//
//
//import org.aspectj.lang.ProceedingJoinPoint;
//import org.aspectj.lang.annotation.Around;
//import org.aspectj.lang.annotation.Aspect;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.stereotype.Component;
//
//import java.util.Arrays;
//
//@Aspect
//@Component
//public class TimeTraceAop {
//
//    private static final Logger logger = LoggerFactory.getLogger(TimeTraceAop.class);
//
//    @Around("execution(* com.example.trakker.controller..*Controller.*(..))"
//            + " || execution(* com.example.trakker.service..*Impl.*(..))"
//            + " || execution(* com.example.trakker.model..dao.*Impl.*(..))")
//    public Object logPrint(ProceedingJoinPoint joinPoint) throws Throwable {
//        //핵심업무가 실행되는 시점에 수행할 메소드
//        long start = System.currentTimeMillis();//시스템의 밀리세컨드값
//        Object result = joinPoint.proceed();
//        String type = joinPoint.getSignature().getDeclaringTypeName();
//        String name = "";
//        if (type.indexOf("Controller") > -1) {
//            name = "Controller : "; //콘솔창에 Controller : 표시됨
//        } else if (type.indexOf("Service") > -1) {
//            name = "ServiceImpl : ";
//        } else if (type.indexOf("DAO") > -1) {
//            name = "DAOImpl : ";
//        }
//        //호출한 클래스, method 정보를 로거에 저장
//        logger.info(name + type + "." + joinPoint.getSignature().getName() + "()");
//        //메소드에 전달되는 매개변수들을 로거에 저장
//        logger.info(Arrays.toString(joinPoint.getArgs()));
//        long end = System.currentTimeMillis();
//        long time = end - start;
//        logger.info("실행시간 : " + time);
//
//        return result;
//    }
//}
//
