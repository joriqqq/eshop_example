package com.eshop.controller;

import com.eshop.dao.BasketDao;
import com.eshop.dao.ProductDao;
import com.eshop.model.Basket;
import com.eshop.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.Map;

@Controller
@Scope("session")
@SessionAttributes("cart")
public class BasketController {
    @Autowired
    private ProductDao productDao;
    @Autowired
    private BasketDao basketDao;

    private Basket basket = new Basket();

    @RequestMapping("/getBasket")
    public String getBasket(Model model) {
        BigDecimal total = BigDecimal.ZERO;
        for (Product product : basket.getProducts().keySet()){
            Integer qty = basket.getProducts().get(product);
            BigDecimal subTotal = product.getPrice().multiply(BigDecimal.valueOf(qty));
            total = total.add(subTotal);
        }
        basket.setTotal(total);
        model.addAttribute("cart", basket);
        return "shopping_cart";
    }

    @RequestMapping(value = "/checkout", method = RequestMethod.POST)
    public String saveBasket(@ModelAttribute("cart") Basket cart) {
        basketDao.save(cart);
        basket = new Basket();
        return "redirect:products?order=saved";
    }

    @RequestMapping(value = "/addProduct/{productId}", method = RequestMethod.GET)
    @ResponseBody
    public void addProduct(@PathVariable Integer productId) {
        Product product = productDao.getById(productId);
        Map<Product, Integer> products = basket.getProducts();
        Integer qty = 1;
        if (products.containsKey(product)) {
            qty += products.get(product);
        }
        products.put(product, qty);
    }
}
