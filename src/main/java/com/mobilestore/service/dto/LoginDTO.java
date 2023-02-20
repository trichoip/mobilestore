package com.mobilestore.service.dto;

import lombok.Data;

@Data
public class LoginDTO {

    private String usernameOrEmail;
    private String password;
}
