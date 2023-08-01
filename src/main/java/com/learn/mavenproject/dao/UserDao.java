package com.learn.mavenproject.dao;

import com.learn.mavenproject.entities.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
//import org.hibernate.query.Query;


public class UserDao {

    private SessionFactory factory; 

    // constructor intializing factory
    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }

    // Get user by email and password
    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;
        try {
            String query = "FROM User WHERE userEmail = :email AND userPassword = :password";
            Session session = this.factory.openSession();
            Query q = session.createQuery(query);
            q.setParameter("email", email);
            q.setParameter("password", password);

            user = (User)q.uniqueResult();

            session.close();
        } catch (Exception e) {
            // Handle the exception appropriately, e.g., log the error or throw a custom exception
            e.printStackTrace();
        }
        return user;
    }
}
