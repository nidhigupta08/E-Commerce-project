<%@page import="com.learn.mavenproject.helper.Helper"%>
<%@page import="com.learn.mavenproject.entities.Category"%>
<%@page import="com.learn.mavenproject.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mavenproject.entities.Product"%>
<%@page import="com.learn.mavenproject.dao.ProductDao"%>
<%@page import="com.learn.mavenproject.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyCart - Home</title>
       <%@include file="Components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file= "Components/navbar.jsp" %>
        
        <div class="container-fluid">
        <div  class="row mt-3 mx-2">
            
            <% 
               String cat= request.getParameter("category");
            ProductDao dao=new ProductDao(FactoryProvider.getFactory());
             List<Product> list= null;
            if(cat.trim().equals("all")){
                list=dao.getAllProducts();
                } else{
                 int cid=Integer.parseInt(cat.trim());
                 list=dao.getAllProductById(cid);
                }
  
            %>
            
            <%
                CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
                List<Category> clist=cdao.getCategories();
                %>
                
     <!--show categories--> 
            <div class="col-md-2">
     
                <!--List group-->
                
                <div class="list-group mt-4">
                   <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                      All Categories
                   </a>
                <% 
                for(Category category:clist){

                  %> 
                  <a href="index.jsp?category=<%= category.getCategoryId() %>" class="list-group-item list-group-item-action"><%= category.getCategoryTitle() %></a>
                <%
                 }
                %>
                    </div>
            </div>
             
  <!--show products-->
            <div class="col-md-10">
                
                <div class="row mt-4">
                    
                    <div class="col-md-12">
<!--            Card columns   bootstrap         -->
                        <div class="card-columns">
                        
                            <!--Traversing products-->
                            
                            <% 
                            for(Product p:list){
                            %>
                            
                            <div class="card">
<!--// product  image-->    
        <div class="contauner text-center">
             <img src="Image/product/<%= p.getpPhoto() %>" class="card-img-top m-1" style=" width:auto; max-height:150px;"   alt="product image">
        </div>
       
                                
                                <div class="card-body">
                                    <h5 class="card-title"><%= p.getpTitle() %></h5>
                                    <p class="card-text">
                                        <%= Helper.get10Words(p.getpDesc()) %>
                                    </p>
                                </div>
                                    
                                    <div clas="card-footer">
                                        <button class="btn custom-bg text-white-black">ADD to cart</button>
                                    </div>
                                    <div class="font-weight-bold mx-2">&#8377;<%= p.getpPrice() %></div>
                            </div>
                            
                            <% }%>
                    </div> 
                    </div> 
                </div>
            </div>
        </div>
      </div>
    </body>
</html>
