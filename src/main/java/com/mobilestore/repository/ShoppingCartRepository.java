package com.mobilestore.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mobilestore.domain.ShoppingCart;

public interface ShoppingCartRepository extends JpaRepository<ShoppingCart, Long> {

    List<ShoppingCart> findByUser_Id(Long id);

    ShoppingCart findByProduct_Id(Long id);

}
