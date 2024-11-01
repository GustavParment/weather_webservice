package com.gustav.weather_app_javaee.service;

import com.gustav.weather_app_javaee.dto.UserDTO;
import com.gustav.weather_app_javaee.model.UserEntity;

public interface UserService {
    UserEntity addUser(UserDTO user);
    UserEntity updateUser(UserDTO user);
    UserEntity getUserById(Long id);
    UserEntity convertToEntity(UserDTO userDTO);

}
