
package com.learn.mavenproject.dao;

import com.learn.mavenproject.entities.Category;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class CategoryDao {
//    instance varaible sessionfactory
    private SessionFactory factory;
    
    //  Constructor
    public CategoryDao(SessionFactory factory){
    this.factory=factory;
}
    //save category to db
    public int saveCategory(Category cat){
        Session session=this.factory.openSession();
        //transaction to save
      Transaction tx = session.beginTransaction();
      int catId=(int) session.save(cat);
      tx.commit();
        session.close();
        return catId;
    }
//  Return  List of catgoeries 
    
    public List<Category> getCategories(){
        Session s=this.factory.openSession();
       Query query= s.createQuery("from Category");
        List<Category> list=query.list();
//         s.close();
         return list;

    }
    
    // category id (cid)
    public Category getCategoryById(int cid){
        Category cat=null;
         try{
           Session session=  this.factory.openSession();
           //Category fetch hua database se
          cat = session.get(Category.class, cid);
          session.close();
         }
         catch(Exception e){
             e.printStackTrace();
         }
         return cat;
    }
    
}
