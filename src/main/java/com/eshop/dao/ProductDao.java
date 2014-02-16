package com.eshop.dao;

import com.eshop.model.Product;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class ProductDao {

    @Autowired
    private SessionFactory eshopSessionFactory;

    @Transactional(readOnly = true)
    public List<Product> findAll() {
        return eshopSessionFactory.getCurrentSession().createQuery("from Product ").list();
    }

    @Transactional(readOnly = true)
    public Product getById(Integer productId){
       return (Product) eshopSessionFactory.getCurrentSession().get(Product.class, productId);
    }
}
