package com.learn.mavenproject.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
    private static SessionFactory factory;
    public static SessionFactory getFactory()
    {
        try{
            if(factory==null){
           factory= new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return factory;
    }

//    public static SessionFactory getFactory() {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }
}
