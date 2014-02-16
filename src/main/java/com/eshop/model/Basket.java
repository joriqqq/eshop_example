package com.eshop.model;


import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.LinkedHashMap;
import java.util.Map;

@Entity
public class Basket implements Serializable{
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id;

    @OneToOne(cascade = CascadeType.PERSIST)
    @JoinColumn(name = "CLIENT_ID")
    private Client client  = new Client();
    @ElementCollection
    @CollectionTable(name = "ORDERED_PRODUCT", joinColumns = @JoinColumn(name = "BASKET"))
    @Column(name = "QUANTITY")
    @MapKeyJoinColumn(name = "PRODUCT", referencedColumnName = "ID")
    private Map<Product,Integer> products = new LinkedHashMap<>();
    private BigDecimal total;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Map<Product, Integer> getProducts() {
        return products;
    }

    public void setProducts(Map<Product, Integer> products) {
        this.products = products;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }
}
