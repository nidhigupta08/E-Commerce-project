package com.learn.mavenproject.servlets;

import com.learn.mavenproject.dao.CategoryDao;
import com.learn.mavenproject.dao.ProductDao;
import com.learn.mavenproject.entities.Category;
import com.learn.mavenproject.entities.Product;
import com.learn.mavenproject.helper.FactoryProvider;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig 
@WebServlet(name = "ProductOperationServlet", urlPatterns = {"/ProductOperationServlet"})
public class ProductOperationServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
//            servlet 2:  add category and product category
              String op= request.getParameter("operation");
              if(op.trim().equals("addcategory")){
                  //add category
                              //fetching category data
            String title=request.getParameter("catTitle");
            String description =request.getParameter("description");
            
           Category category =new Category();
           category.setCategoryTitle(title) ; 
           category.setCategoryDescription(description);
           
           //saving the category into databse     categoryDao object create      FactoryProvider helper class will provide factory
             CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
           //category object pass 
             int catId=categoryDao.saveCategory(category);
             
            HttpSession httpSession=request.getSession();
            httpSession.setAttribute("message", "category addes succesfully:" +catId);
            response.sendRedirect("admin.jsp");
            return;
              }
              else if(op.trim().equals("addProduct")){
                  //add product
                  
                  
//fetching the product data form from  after submitting

                  String pName = request.getParameter("pName");
                  String pDesc=request.getParameter("pDesc");
                  
                  int pPrice=Integer.parseInt(request.getParameter("pPrice"));
                  int pDiscount=Integer.parseInt(request.getParameter("pDiscount"));
                  int pQuantity=Integer.parseInt(request.getParameter("pQuantity"));
                  int catId =Integer.parseInt(request.getParameter("catId"));
                  Part part=request.getPart(("pPic"));
              
                    
                 Product p= new Product();
                 p.setpTitle(pName);
                 p.setpDesc(pDesc);
                 p.setpPrice(pPrice);
                 p.setpDiscount(pDiscount);
                 p.setpQuantity(pQuantity);
                 p.setpPhoto(part.getSubmittedFileName());
                
                 //get category by id
 //catId tha to usko method me pass kiya wo return krdiya category ka object              
                 CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
                 Category category=cdao.getCategoryById(catId);
                  p.setCategory(category);
                  
                  //product save 
                  ProductDao pdao=new ProductDao(FactoryProvider.getFactory());
                 pdao.saveProduct(p);
//                 

//pic upload 
//find out path to upload photo
                String path=request.getRealPath("Image") + File.separator +"product" + File.separator +part.getSubmittedFileName();
                System.out.println(path);

                    // uploading code
                    try{
                        
                    
                    FileOutputStream fos= new FileOutputStream(path);
                    InputStream is=  part.getInputStream(); //read

                    // REading data
                    
                    byte[] data=new byte[is.available()];
                    
                    is.read(data);
                    
                    //writing data
                    fos.write(data);
                    fos.close();
                    
                    }catch(Exception e){
                        e.printStackTrace();
                    }
                    
             // out.println("Product save successfully");       
            HttpSession httpSession=request.getSession();
            httpSession.setAttribute("message", "Product is added succesfully:");           
            response.sendRedirect("admin.jsp");
            return;
              } 
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
