package com.example.trakker.aop;


import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class TimeTraceAop {

    @Around("execution(* com.example.trakker.*(..))")
    public Object execute(ProceedingJoinPoint joinPoint) throws Throwable{

        long start = System.currentTimeMillis();
        System.out.println("START : " + joinPoint.toString());
        try{
            // 다음 메서드로 진행
            return joinPoint.proceed();
        }finally {
            long finish = System.currentTimeMillis();
            long timeMs = finish - start;
            System.out.println("END : " + joinPoint.toString() + " "+ timeMs+ "ms");
        }

    }
}

// 문제
// 회원가입, 회원 조회에 시간을 측정하는 기능은 핵심 관심 사항이 아니다.
// 시간을 측정하는 로직은 공통 관심 사항이다.
// 시간을 측정하는 로직과 핵심 비즈니스의 로직이 섞여서 유지보수가 어렵다
// 시간을 측정하는 로직을 별도의 공통 로직으로 만들기 매우 어렵다.
// 시간을 측정하는 로직을 변경할 때 모든 로직을 찾아가면서 변경해야 한다.


//해결
// 회원가입, 회원 조회등 핵심 관심사항과 시간을 측정하는 공통 관심 사항을 분리한다.
// 시간을 측정하는 로직을 별도의 공통 로직으로 만들었다.
// 핵심 관심 사항을 깔끔하게 유지할 수 있다.
// 변경이 필요하면 이 로직만 변경하면 된다.
// 원하는 적용 대상을 선택할 수 있다.

