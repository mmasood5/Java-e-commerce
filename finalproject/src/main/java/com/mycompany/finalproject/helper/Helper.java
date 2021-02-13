/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.finalproject.helper;

import java.util.HashMap;
import java.util.Map;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

/**
 *
 * @author minha
 */
public class Helper {
    
    public static String skimDesc(String desc)
    {
        String[] strs = desc.split(" ");
        if(strs.length>10)
        {
            String result="";
            for(int i = 0; i < 10; i++)
            {
                result = result + strs[i] + " ";
            }
            return (result + "...");
        }
        else 
        {
            return desc + "...";
        }
    }

public static Map<String,Long> getCounts(SessionFactory factory)
{
    Session session = factory.openSession();
    String query1 = "Select count(*) from User";
    String query2 = "Select count(*) from Product";
    
    Query q1 = session.createQuery(query1);
    Query q2 = session.createQuery(query2);
    
    Long userCount = (Long)q1.list().get(0);
    Long productCount = (Long) q2.list().get(0);
    
    Map <String, Long> map = new HashMap<>();
    map.put("userCount", userCount);
    map.put("productCount", productCount);
    
    
    session.close();
    return map;
}

}

