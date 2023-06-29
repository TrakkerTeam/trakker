package com.example.trakker.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
@PropertySource("classpath:upload.properties")
public class WebMvcConfig implements WebMvcConfigurer {

    @Value("${upload.path}") // properties 파일에서 설정된 경로를 가져옵니다
    private String uploadPath;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/summernoteImage/**")
                .addResourceLocations("file:" + uploadPath + "/");
    }

}