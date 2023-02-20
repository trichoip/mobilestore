package com.mobilestore.service.dto;

import java.io.Serializable;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Data;

/**
 * A DTO for the {@link com.mobilestore.domain.Role} entity
 */
@Data
public class RoleDTO implements Serializable {
    private Long id;
    @Size(max = 50)
    @NotNull
    private String name;
}