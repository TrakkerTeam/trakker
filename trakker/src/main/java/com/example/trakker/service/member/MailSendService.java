package com.example.trakker.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.util.Random;

@Component
public class MailSendService {
    @Autowired
     JavaMailSenderImpl mailSender;
    private String authNumber;

//    public void makeRandomNumber() {
//        // 난수의 범위 111111 ~ 999999 (6자리 난수)
//        Random r = new Random();
//        int checkNum = r.nextInt(888888) + 111111;
//        System.out.println("인증번호 : " + checkNum);
//        authNumber = checkNum;
//    }
    public void makeRandomNumber1() {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789~!@#$%^&*()+|=";
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        int length = random.nextInt(9) + 8; // 8에서 16 사이의 랜덤 길이

        for (int i = 0; i < length; i++) {
            int index = random.nextInt(characters.length());
            sb.append(characters.charAt(index));
        }

        String generatedPassword = sb.toString();
        System.out.println("임시비밀번호 genera:" + generatedPassword);
        // 생성된 비밀번호를 다른 곳에서 사용하거나 반환할 수 있도록 필요한 작업을 수행합니다.
        authNumber = generatedPassword;
        System.out.println("임시비밀번호 auth:" + authNumber);
    }

    public String getAuthNumber() {
        return authNumber;
    }

    //이메일 보낼 양식!
    public String joinEmail(String mem_email) {
        makeRandomNumber1();
        String setFrom = ".com"; // email-config에 설정한 자신의 이메일 주소를 입력
        String toMail = mem_email;
        String title = "회원 가입 인증 이메일 입니다."; // 이메일 제목
        String content =
                "홈페이지를 방문해주셔서 감사합니다." + 	//html 형식으로 작성 !
                        "<br><br>" +
                        "인증 번호는 " + authNumber + "입니다." +
                        "<br>" +
                        "해당 인증번호를 인증번호 확인란에 기입하여 주세요."; //이메일 내용 삽입
        mailSend(setFrom, toMail, title, content);
        return authNumber;
    }

    public String joinPassEmail(String mem_email) {
        //makeRandomNumber1();
        String setFrom = ".com"; // email-config에 설정한 자신의 이메일 주소를 입력
        String toMail = mem_email;
        String title = "TRAKKER 임시 비밀번호 입니다."; // 이메일 제목
        String content =
                "홈페이지를 방문해주셔서 감사합니다." + 	//html 형식으로 작성 !
                        "<br><br>" +
                        "임시 비밀번호는 " + authNumber + "입니다." +
                        "<br>" +
                        "로그인 후 꼭 비밀번호 변경 해주세요.!"; //이메일 내용 삽입
        mailSend(setFrom, toMail, title, content);
        return authNumber;
    }

    //이메일 전송 메소드
    public void mailSend(String setFrom, String toMail, String title, String content) {
        MimeMessage message = mailSender.createMimeMessage();
        // true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능.문자 인코딩 설정도 가능하다.
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            // true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
            helper.setText(content,true);
            mailSender.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }


}
