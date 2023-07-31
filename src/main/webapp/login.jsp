<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login MyCart</title>
        <%@include file="Components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file= "Components/navbar.jsp" %>

        <div class="container">
            <div class="row">
                <!--offset-3 moves forward and col-md-6 make card small-->

                <div class="col-md-6 offset-md-3">
                    <div class="card mt-3">

                        <div class="card-header  text-white text-center  bg-dark ">
                            <h3 >Login here</h3>
                        </div>

                        <div class="card-body">
                            <%@include file="Components/message.jsp" %>
                            
                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input  name="email" type="email" class="form-control" id="exampleInputEmail1"  placeholder="Enter email">

                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="password"  type="password" class="form-control"  id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <a href="register.jsp" class=" text-center d-block mb-3">If not registered click here</a>
                                <div class="container text-center ">
                                    <button type="submit" class="btn btn-primary bg-dark border-0">Submit</button>
                                    <button class="btn btn-primary bg-dark border-0 " >Reset</button>
                                </div>

                            </form>

                        </div>

                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
