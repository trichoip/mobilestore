package com.mobilestore.web.rest;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.mobilestore.service.ProductService;
import com.mobilestore.service.dto.ProductDTO;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api")
public class ProductResource {

    @Autowired
    private ProductService productService;

    @PostMapping("/products")
    public ResponseEntity<ProductDTO> createProduct(@RequestBody ProductDTO productDTO) {

        if (productDTO.getId() != null) {
            throw new IllegalArgumentException("A new product cannot already have an ID  : idexists");
        }
        ProductDTO result = productService.save(productDTO);
        return ResponseEntity.ok().body(result);
    }

    @GetMapping("/products/{id}")
    public ResponseEntity<ProductDTO> getProduct(@PathVariable Long id) {

        Optional<ProductDTO> productDTO = productService.findOne(id);
        return productDTO.map(response -> ResponseEntity.ok().body(response))
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @GetMapping("/products")
    public ResponseEntity<List<ProductDTO>> getAllBrands() {
        List<ProductDTO> page = productService.findAll();
        return ResponseEntity.ok(page);
    }

}
