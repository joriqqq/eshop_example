package com.eshop.dao;

import com.eshop.model.Basket;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class BasketDao {

    @Autowired
    private SessionFactory eshopSessionFactory;

    @Transactional
    public void save(Basket basket) {
        eshopSessionFactory.getCurrentSession().persist(basket);
    }
}
