package com.example.trakker.config.auth;

import com.example.trakker.model.User;
import com.example.trakker.service.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class PrincipalDetailService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        System.out.println("username = " + username);
        User userEntity = userRepository.findByUsername(username);
        if (userEntity != null){
            return  new PrincipalDetails(userEntity); // 데이터가 있으면 리턴
        }
        return null;
    }
}
