/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.finalproject.dao;

import com.mycompany.finalproject.entities.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
/**
 *
 * @author minha
 */
public class ProductDao {
    
    private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public boolean saveProduct(Product product){
        boolean f = false;
        try {
            
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();
            session.save(product);
            f = true;
            
        } catch (Exception e) {
            
            e.printStackTrace();
            f = false;
        }
        return f;
    }
    
    //fetch products
    public List<Product> getAllProducts()
    {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Product");
        List<Product> list = query.list();
        return list;
    
        
    }
 
    
    //fetch products by ID (filtering)
    public List<Product> getAllProductsById(int cid) {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Product as p where p.category.categoryID =: id");
        query.setParameter("id", cid);
        List<Product> list = query.list();
        return list;

    }
    
    //delete a product
//    public List<Product> update(int cid)
//    {
//        Session s = this.factory.openSession();
//        Query query = s.createQuery("update Product set age=:age where p.category.categoryID =:id");
//        query.setParameter("id", cid);
//        List<Product> list = query.list();
//        return list;
//        
//    }
//    
//    public List<Product> delete() {
//        Session s = this.factory.openSession();
//        Query query = s.createQuery("delete from Product where p.category.categoryID =:id");
//        query.setParameter("id", this);
//        List<Product> list = query.list();
//        return list;
//
//    }
}
