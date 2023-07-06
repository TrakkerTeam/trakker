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

    public void makeRandomNumber1() {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789~!@#$%^&*()+|=";
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        int length = random.nextInt(9) + 8;

        for (int i = 0; i < length; i++) {
            int index = random.nextInt(characters.length());
            sb.append(characters.charAt(index));
        }

        String generatedPassword = sb.toString();


        authNumber = generatedPassword;

    }

    public String getAuthNumber() {
        return authNumber;
    }

    public String joinEmail(String mem_email) {
        makeRandomNumber1();
        String setFrom = ".com";
        String toMail = mem_email;
        String title = "회원 가입 인증 이메일 입니다.";
        String content =
                "홈페이지를 방문해주셔서 감사합니다." +
                        "<br><br>" +
                        "인증 번호는 " + authNumber + "입니다." +
                        "<br>" +
                        "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        mailSend(setFrom, toMail, title, content);
        return authNumber;
    }

    public String joinPassEmail(String mem_email) {

        String setFrom = ".com";
        String toMail = mem_email;
        String title = "TRAKKER 임시 비밀번호 입니다.";
        String content =
                "홈페이지를 방문해주셔서 감사합니다." +
                        "<br><br>" +
                        "임시 비밀번호는 " + authNumber + "입니다." +
                        "<br>" +
                        "로그인 후 꼭 비밀번호 변경 해주세요.!";
        mailSend(setFrom, toMail, title, content);
        return authNumber;
    }

    public void mailSend(String setFrom, String toMail, String title, String content) {
        MimeMessage message = mailSender.createMimeMessage();

        try {
            MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);

            helper.setText(content,true);
            mailSender.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

}
