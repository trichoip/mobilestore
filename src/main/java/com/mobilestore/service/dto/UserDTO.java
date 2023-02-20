package com.mobilestore.service.dto;

import java.io.Serializable;
import java.util.Set;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.mobilestore.domain.User;

import lombok.Data;

/**
 * A DTO for the {@link User} entity
 */
@Data
public class UserDTO implements Serializable {
    private Long id;
    @Size(max = 255)
    @NotNull
    private String email;
    @Size(max = 255)
    @NotNull
    private String password;
    @Size(max = 255)
    private String name;
    @Size(max = 20)
    private String phoneNumber;
    @Size(max = 255)
    private String address;
    private Set<OrderDTO> orders;
    private Set<ProductDTO> products;
    private Set<RoleDTO> roles;
}