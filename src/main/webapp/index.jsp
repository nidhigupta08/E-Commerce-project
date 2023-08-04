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
        <div  class="row mt-3 mx-2">
            
            <% 
            ProductDao dao=new ProductDao(FactoryProvider.getFactory());
            List<Product> list=dao.getAllProducts();
            
            %>
            
            <%
                CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
                List<Category> clist=cdao.getCategories();
                %>
                
     <!--show categories--> 
            <div class="col-md-2">
     
                <!--List group-->
                
                <div class="list-group mt-4">
                   <a href="#" class="list-group-item list-group-item-action active">
                        Categories
                   </a>
                <% 
                for(Category category:clist){

                  %> 
                  <a href="#" class="list-group-item list-group-item-action"><%= category.getCategoryTitle() %></a>
                <%
                 }
                %>
                    </div>
            </div>
             
  <!--show products-->
            <div class="col-md-8">
                
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
        <img src="Image/product/<%= p.getpPhoto() %>" class="card-img-top m-1" alt="product image">
                                
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
      
    </body>
</html>
