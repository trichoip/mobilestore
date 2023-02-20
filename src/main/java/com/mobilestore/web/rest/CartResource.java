package com.mobilestore.web.rest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.mobilestore.service.ProductService;
import com.mobilestore.service.dto.Cart;
import com.mobilestore.service.dto.ProductDTO;

@RestController
@RequestMapping("/api")
public class CartResource {

    @Autowired
    private HttpSession httpSession;

    @Autowired
    private ProductService productService;

    @PostMapping("/cart/addToCart")
    public ResponseEntity<String> addToCart(@RequestParam Long productId, @RequestParam Integer quantity,
            HttpSession session) {
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
        }
        ProductDTO product = productService.findOne(productId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
        product.setQuantity(quantity);
        cart.add(product);
        session.setAttribute("cart", cart);
        return ResponseEntity.ok().body("Product added to cart successfully");
    }

    @DeleteMapping("/cart/clear-cart")
    public ResponseEntity<?> clearCart(HttpSession session) {
        session.invalidate();
        return ResponseEntity.ok(HttpStatus.OK);
    }

    @GetMapping("/cart")
    public ResponseEntity<Cart> getCart(HttpSession session) {
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        return ResponseEntity.ok(cart);
    }

    @DeleteMapping("/cart")
    public ResponseEntity<String> removeFromCart(HttpSession session, @RequestParam Long productId) {
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart != null) {
            if (!cart.checkProduct(productId)) {
                return ResponseEntity.badRequest().body("cart does not contain product");
            }
            cart.remove(productId);
            session.setAttribute("cart", cart);
        } else {
            return ResponseEntity.badRequest().body("cart is empty");
        }
        return ResponseEntity.ok("OK");
    }

}
