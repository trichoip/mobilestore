package com.mobilestore.service;

import java.util.List;
import java.util.Optional;

import com.mobilestore.service.dto.ProductDTO;

public interface ProductService {

    ProductDTO save(ProductDTO productDTO);

    List<ProductDTO> findAll();

    Optional<ProductDTO> findOne(Long id);

}
