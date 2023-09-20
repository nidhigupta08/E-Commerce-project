package com.learn.mavenproject.servlets;


import com.learn.mavenproject.entities.User;
import com.learn.mavenproject.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class RegisterServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try{
               String userName= request.getParameter("user_name");
              String userEmail = request.getParameter("user_email");
              String userPassword= request.getParameter("user_password");
              String userPhone=request.getParameter("phone_no");
              String userAddress=request.getParameter("user_address");
              
              if(userName.isEmpty()){
                  out.println("Name is blank");
                  return;
              }
              //creating user object to atore data
             User user= new User(userName,userEmail,userPassword,userPhone,"default.jpg",userAddress,"normal");
             
            Session hibernateSession = FactoryProvider.getFactory().openSession();
                Transaction tx= hibernateSession.beginTransaction();
            //this will understand that it has to store the data into user table 
            int userId=(int)hibernateSession.save(user);
            //session is an object which store value for tem poraly
           tx.commit();
            hibernateSession.close();
            
                HttpSession httpSession=request.getSession();
                httpSession.setAttribute("message","Registration successful!!");
                response.sendRedirect("register.jsp");
                return;
 
            
            }
            catch(Exception e){
                e.printStackTrace();
            }
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
