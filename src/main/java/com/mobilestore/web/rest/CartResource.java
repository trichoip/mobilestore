package com.mobilestore.web.rest;

import java.time.Instant;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.mobilestore.domain.Product;
import com.mobilestore.domain.ShoppingCart;
import com.mobilestore.repository.OrderRepository;
import com.mobilestore.repository.ProductRepository;
import com.mobilestore.repository.ShoppingCartRepository;
import com.mobilestore.service.OrderService;
import com.mobilestore.service.ProductService;
import com.mobilestore.service.dto.Cart;
import com.mobilestore.service.dto.OrderDTO;
import com.mobilestore.service.dto.OrderDetailDTO;
import com.mobilestore.service.dto.ProductDTO;
import com.mobilestore.service.dto.ShoppingCartDTO;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api")
public class CartResource {

    @Autowired
    HttpSession session;

    @Autowired
    private ProductService productService;

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private ShoppingCartRepository shoppingCartRepository;

    @Autowired
    private OrderService orderService;

    @Autowired
    private ModelMapper modelMapper;

    @PostMapping("/cart/addToCart")
    public ResponseEntity<String> addToCart(@RequestParam Long productId, @RequestParam Integer quantity,
            HttpSession session) {

        Product p = productRepository.findById(productId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
        ShoppingCart sp = shoppingCartRepository.findByProduct_Id(productId);
        if (sp != null) {
            sp.setQuantity(quantity + sp.getQuantity());
            shoppingCartRepository.save(sp);
            return ResponseEntity.ok().body("Product added to cart successfully");
        } else {
            sp = new ShoppingCart();
            sp.setProduct(p);
            sp.setPrice(p.getPrice());
            sp.setQuantity(quantity);
            shoppingCartRepository.save(sp);
        }

        // Cart cart = (Cart) session.getAttribute("cart");
        // if (cart == null) {
        // cart = new Cart();
        // }
        // ProductDTO product = productService.findOne(productId)
        // .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
        // product.setQuantity(quantity);
        // cart.add(product);
        // session.setAttribute("cart", cart);
        // if (session.getAttribute("cart") == null) {
        // throw new IllegalAccessError("session not have");
        // }
        return ResponseEntity.ok().body("Product added to cart successfully");
    }

    @DeleteMapping("/cart/clear-cart")
    public ResponseEntity<?> clearCart(HttpSession session) {
        // session.invalidate();
        shoppingCartRepository.deleteAll();
        return ResponseEntity.ok(HttpStatus.OK);
    }

    @GetMapping("/cart")
    public ResponseEntity<?> getCart(HttpSession session) {
        List<ShoppingCart> list = shoppingCartRepository.findAll();
        // if (session.getAttribute("cart") == null) {
        // throw new IllegalAccessError("session not have");
        // }
        // Cart cart = (Cart) session.getAttribute("cart");
        // if (cart == null) {
        // cart = new Cart();
        // session.setAttribute("cart", cart);
        // }
        return ResponseEntity.ok(modelMapper.map(list, new TypeToken<List<ShoppingCartDTO>>() {
        }.getType()));
    }

    @PutMapping("/cart")
    public ResponseEntity<String> updateCart(@RequestParam Long productId, @RequestParam Integer quantity,
            HttpSession session) {
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart != null) {
            if (!cart.checkProduct(productId)) {
                return ResponseEntity.badRequest().body("cart does not contain product");
            }

            ProductDTO product = productService.findOne(productId)
                    .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
            product.setQuantity(quantity);
            cart.update(productId, product);
            session.setAttribute("cart", cart);
        } else {
            return ResponseEntity.badRequest().body("cart is empty");
        }
        return ResponseEntity.ok("OK");
    }

    @DeleteMapping("/cart")
    public ResponseEntity<String> removeFromCart(HttpSession session, @RequestParam Long productId) {
        // Cart cart = (Cart) session.getAttribute("cart");
        List<ShoppingCart> list = shoppingCartRepository.findAll();
        ShoppingCart sp = shoppingCartRepository.findByProduct_Id(productId);
        if (sp == null) {
            throw new IllegalArgumentException("this product not in cart");
        }
        if (!list.isEmpty()) {
            for (ShoppingCart shoppingCart : list) {
                if (shoppingCart.getProduct().getId().equals(productId)) {
                    shoppingCartRepository.delete(shoppingCart);
                }
            }
        } else {
            return ResponseEntity.badRequest().body("cart is empty");
        }
        // if (cart != null) {
        // if (!cart.checkProduct(productId)) {
        // return ResponseEntity.badRequest().body("cart does not contain product");
        // }
        // cart.remove(productId);
        // session.setAttribute("cart", cart);
        // } else {
        // return ResponseEntity.badRequest().body("cart is empty");
        // }
        return ResponseEntity.ok("OK");
    }

    @PostMapping("/checkout")
    public ResponseEntity<?> checkout(HttpSession session) {
        // Long userId = (Long) session.getAttribute("userId");
        // if (userId == null) {
        // return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("User not logged
        // in.");
        // }
        // User user = userService.getUserById(userId);

        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null || cart.getCart().isEmpty()) {
            return ResponseEntity.badRequest().body("Cart is empty.");
        }

        OrderDTO order = new OrderDTO();
        order.setOrderDate(Instant.now());
        // order.setUser(user);
        for (ProductDTO cartItem : cart.getCart().values()) {
            ProductDTO product = productService.findOne(cartItem.getId())
                    .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
            if (product.getStock() < cartItem.getQuantity()) {
                return ResponseEntity.badRequest().body("Product " + product.getName() + " is out of stock.");
            }
            product.setStock(product.getStock() - cartItem.getQuantity());
            productService.save(product);
            OrderDetailDTO orderDetail = new OrderDetailDTO();
            orderDetail.setOrder(order);
            orderDetail.setProduct(product);
            orderDetail.setPrice(product.getPrice());
            orderDetail.setQuantity(cartItem.getQuantity());
            order.getOrderDetails().add(orderDetail);

        }

        order.setTotalMoney(cart.getTotalMoney());
        order.setTotalQuantity(cart.getTotalQuantity());
        orderService.save(order);
        cart.getCart().clear();
        session.setAttribute("cart", cart);
        return ResponseEntity.ok("Order created.");
    }

}
