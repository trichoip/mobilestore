package com.mobilestore.service.dto;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Cart {

    // private Map<Long, ProductDTO> cart;
    // private Collection<ProductDTO> cartList;

    // public Cart() {
    // this.totalMoney = getTotalMoney();
    // this.totalQuantity = getTotalQuantity();
    // this.cartList = getCartList();
    // }

    // public Collection<ProductDTO> getCartList() {
    // if (cart != null) {
    // return cart.values();
    // }
    // return cartList;
    // }

    // public void setCartList(Collection<ProductDTO> cartList) {
    // this.cartList = cartList;
    // }

    // private Double totalMoney;
    // private Integer totalQuantity;

    // public Integer getTotalQuantity() {
    // Integer total = 0;
    // if (this.cart != null) {
    // for (ProductDTO item : cart.values()) {
    // total += item.getQuantity();
    // }
    // }
    // return total;
    // }

    // public void setTotalMoney(Double totalMoney) {
    // this.totalMoney = totalMoney;
    // }

    // public Cart(Map<Long, ProductDTO> cart) {
    // this.cart = cart;
    // }

    // public Map<Long, ProductDTO> getCart() {
    // return cart;
    // }

    // public void setCart(Map<Long, ProductDTO> cart) {
    // this.cart = cart;
    // }

    // public boolean add(ProductDTO product) {
    // boolean result = false;
    // if (this.cart == null) {
    // this.cart = new HashMap<>();
    // }
    // if (this.cart.containsKey(product.getId())) {
    // int currentQuantity = this.cart.get(product.getId()).getQuantity();
    // product.setQuantity(currentQuantity + product.getQuantity());

    // }
    // this.cart.put(product.getId(), product);
    // result = true;
    // return result;
    // }

    // public boolean update(Long id, ProductDTO product) {
    // boolean result = false;
    // if (this.cart != null) {
    // if (this.cart.containsKey(id)) {
    // this.cart.replace(id, product);
    // result = true;
    // }
    // }

    // return result;
    // }

    // public boolean remove(Long id) {
    // boolean result = false;
    // if (this.cart != null) {
    // if (this.cart.containsKey(id)) {
    // this.cart.remove(id);
    // result = true;
    // }
    // }

    // return result;
    // }

    // public boolean checkProduct(Long id) {
    // boolean result = false;
    // if (this.cart != null) {
    // if (this.cart.containsKey(id)) {
    // result = true;
    // }
    // }

    // return result;
    // }

    // public Double getTotalMoney() {
    // Double total = 0.0;
    // if (this.cart != null) {
    // for (ProductDTO item : cart.values()) {
    // total += item.getPrice() * item.getQuantity();
    // }
    // }
    // return total;
    // }

    // public void setTotalQuantity(Integer totalQuantity) {
    // this.totalQuantity = totalQuantity;
    // }

}
