<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login MyCart</title>
        <%@include file="Components/common_css_js.jsp" %>
    </head>
    <body style="background-color: #F2F2F2;" >
        <%@include file= "Components/navbar.jsp" %>

        <div class="container" style="padding: 50px 50px;">
            <div class="row">
                <!--offset-3 moves forward and col-md-6 make card small-->

                <div class="col-md-6 offset-md-3">
                    <div class="card mt-3">

                        <div class="card-header  text-dark text-center  custom-bg ">
                            <h3 > <b>Login here</b></h3>
                        </div>

                        <div class="card-body">
                            <%@include file="Components/message.jsp" %>
                            
                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1"> <b>Email address </b></label>
                                    <input  name="email" type="email" class="form-control" id="exampleInputEmail1"  placeholder="Enter email">

                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1"> <b>Password</b></label>
                                    <input name="password"  type="password" class="form-control"  id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <a href="register.jsp" class=" text-center d-block mb-3">If not registered click here</a>
                                <div class="container text-center ">
                                    <button type="submit" class="btn btn-primary custom-bg text-dark border-0">Submit</button>
                                    <button class="btn btn-primary custom-bg border-0 text-dark " >Reset</button>
                                </div>

                            </form>

                        </div>

                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
