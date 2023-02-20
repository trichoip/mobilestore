package com.mobilestore.service.dto;

import java.io.Serializable;
import java.time.Instant;
import java.util.Set;

import lombok.Data;

/**
 * A DTO for the {@link com.mobilestore.domain.Order} entity
 */
@Data
public class OrderDTO implements Serializable {
    private Long id;
    private Double totalMoney;
    private Integer totalQuantity;
    private Instant orderDate;
    private UserDTO user;
    private Set<OrderDetailDTO> orderDetails;
}