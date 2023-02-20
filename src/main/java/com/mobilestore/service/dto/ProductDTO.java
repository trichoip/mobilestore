package com.mobilestore.service.dto;

import java.io.Serializable;

import javax.validation.constraints.Size;

import lombok.Data;

/**
 * A DTO for the {@link com.mobilestore.domain.Product} entity
 */
@Data
public class ProductDTO implements Serializable {
    private Long id;
    @Size(max = 255)
    private String name;
    @Size(max = 255)
    private String manufacturer;
    @Size(max = 255)
    private String description;
    @Size(max = 255)
    private String imageUrl;
    @Size(max = 255)
    private String condition;
    private Double price;
    private Integer stock;
    private Integer quantity;
    private String category;

}