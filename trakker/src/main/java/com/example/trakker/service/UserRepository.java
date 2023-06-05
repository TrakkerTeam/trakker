package com.example.trakker.service;

import com.example.trakker.model.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository {

    User getUserId(Long id);
    User findByUsername(String username);
    void insert(User user);
    void updateUser(User user);
    void deleteUser(Long id);


}
