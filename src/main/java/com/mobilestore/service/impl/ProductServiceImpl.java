package com.mobilestore.service.impl;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mobilestore.domain.Product;
import com.mobilestore.repository.ProductRepository;
import com.mobilestore.service.ProductService;
import com.mobilestore.service.dto.ProductDTO;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private ModelMapper modelMapper;

    @Override
    public ProductDTO save(ProductDTO productDTO) {

        Product product = modelMapper.map(productDTO, Product.class);
        product = productRepository.save(product);
        return modelMapper.map(product, ProductDTO.class);
    }

    @Override
    @Transactional(readOnly = true)
    public List<ProductDTO> findAll() {
        return productRepository.findAll().stream().map(p -> {
            return modelMapper.map(p, ProductDTO.class);
        }).collect(Collectors.toList());
    }

    @Override
    @Transactional(readOnly = true)
    public Optional<ProductDTO> findOne(Long id) {

        return productRepository.findById(id).map(p -> {
            return modelMapper.map(p, ProductDTO.class);
        });
    }

}
