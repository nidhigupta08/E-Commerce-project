<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
           <%@include file="Components/common_css_js.jsp" %>
    </head>
    <body>
          <%@include file= "Components/navbar.jsp" %>
          <div class="container-fluid">
                   <div class="row mt-5">
               <!--col-md-4 is for breadth -->
              <div class="col-md-4 offset-md-4">
              
                  <div class="card">
                          <%@include file="Components/message.jsp" %>
                      <div class="card-body px-6">
                          
                           <h3 class="text-center my-3">Sign Up </h3>
<!--                           data will be submitted to the register servlet.-->
                           <form action="RegisterServlet" method="Post" >
                      
                   <div class="form-group">
                        <label for="name">User Name</label>
                         <input type="text" name="user_name" class="form-control" id="name" placeholder="Enter name">   
                   </div>
                    <div class="form-group">
                          <label for="email" >Email</label>
                          <input type="email" name="user_email" class="form-control" id="email" placeholder="enter email"/>
                     </div> 
                       <div class="form-group">
                           <label for="password" >Password</label>
                           <input type="password" name="user_password" class="form-control" id="password" />
                      </div >
                      <div class="form-group">
                          <label for="userphone">User phone no</label>
                          <input type="number" name="phone_no" class="form-control" id="userphone" placeholder="enter phone number"/>
                      </div> 
                      <div class="form-group">
                          <label for="userAddress" >User Address</label>
                          <textarea style="height:100px;" name="user_address" class="form-control"  placeholder="Enter address"></textarea>
                      </div>
                        <a href="login.jsp" class=" text-center d-block mb-3">If registered click here</a>  
                      <div class="container text-center">
                          <button class="btn btn-outline-success" >Register</button>
                          <button class="btn btn-outline-warning" >Reset</button>
                      </div>
                  </form>             
                      </div>
                  </div>     
              </div>
          </div>
          </div>
    </body>
</html>
