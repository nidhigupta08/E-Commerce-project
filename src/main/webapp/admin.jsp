
<%@page import="java.util.List"%>
<%@page import="com.learn.mavenproject.entities.Category"%>
<%@page import="com.learn.mavenproject.helper.FactoryProvider"%>
<%@page import="com.learn.mavenproject.dao.CategoryDao"%>
<%@page import="com.learn.mavenproject.entities.User"%>

<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in !! Login first");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "You are not admin! Do not access this page");
            response.sendRedirect("login.jsp");
            return;
        }

    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin page</title>
        <%@include file="Components/common_css_js.jsp"%>
    </head>
    <body>
        <%@include file="Components/navbar.jsp"%>

        <div class="container admin">

            <div class="container-fluid"> 
                <%@include file="Components/message.jsp" %>

            </div>

            <div class="row mt-3">
                <!--first column-->
                <div class="col-md-4">
                    <div class="card text-center">
                        <div class=""card-body>
                            <div class=container">
                                <img  style="max-width:150px;" class="img-fluid rounded-circle" src="Image/man.png" alt=" Categories image"/>
                            </div>
                            <h1>345</h1>
                            <h1 class="text-uppercase  text-muted ">Users</h1>

                        </div>
                    </div>    
                </div>

                <!--2nd column-->
                <div class="col-md-4">
                    <div class="card text-center" >
                        <div class=""card-body>
                            <div class=container">
                                <img style="max-width:150px;" class="img-fluid rounded-circle"  src="Image/list.png" alt=" Categories image"/>
                            </div>
                            <h1>345</h1>
                            <h1 class="text-uppercase  text-muted ">Categories</h1>

                        </div>
                    </div> 
                </div>

                <!--3rd column-->
                <div class="col-md-4">
                    <div class="card text-center">
                        <div class=""card-body>
                            <div class=container">
                                <img style="max-width:150px;" class="img-fluid rounded-circle"  src="Image/delivery-box.png" alt=" Categories image"/>
                            </div>
                            <h1>345</h1>
                            <h1 class="text-uppercase  text-muted ">Products</h1>

                        </div>
                    </div> 
                </div>
            </div>

            <!--second row-->
            <div class="row mt-3">

                <!--md stand for medium device-->
                <div class="col-md-6">
                    <div class="card " data-toggle="modal" data-target="#exampleModal"> 
                        <div class="card-body  text-center">
                            <div class="container">
                                <img style="max-width:150px;" class="img-fluid rounded-circle"  src="Image/apps.png" alt=" Categories image"/>
                                <!--                            <img style="max-width:150px;" class="img-fluid rounded circle" src="Image/apps.png" alt="category image" />-->
                            </div>
                            <p class="mt-2">Add new category</p>
                            <h1 class="text-uppercase text-muted ">ADD category</h1>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card " data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body  text-center">
                            <div class="container">
                                <img style="max-width:150px;" class="img-fluid rounded-circle"  src="Image/add.png" alt=" Categories image"/>
                            </div>
                            <p class="mt-2">Add new product</p>
                            <h1 class="text-uppercase text-muted ">ADD products</h1>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!--add  category modal-->

        <!-- Modal -->
        <div class="modal fade " id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-black">
                        <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form action="ProductOperationServlet"  method="post" >

                            <input type="hidden" name="operation" value="addcategory">


                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter category title">
                            </div>

                            <div class="form-group">
                                <textarea  style="height:250px" class="form-control"  placeholder="enter description" name="description" required></textarea>
                            </div>
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Category</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                            </div>
                        </form>   

                    </div>

                </div>
            </div>
        </div>
        <!--End category modal-->

        
        <!--**********************product modal****************************-->



        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Product details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">


                        <!--form--> 

  <!--enctype attribute--  specifies how the form-data should be encoded when submitting it to the server..-->

                        <form action="ProductOperationServlet " method="post" enctype="multipart/form-data">
                            
                            <input type="hidden" name="operation" value="addProduct">
                                   
                            <!--product title-->
                            <div class="form-group">
                                <input type="trext" class="form-control" placeholder="Enter product Title" name="pName" required />
                            </div>

                            <!--product description-->
                            <div class="form-group">
                                <textarea style=" height:150px;" class="form-control" placeholder="Enter product description" name="pDesc"></textarea>
                            </div>
                            <!--product price-->
                            <div class="form-group">
                                <input type="number" placeholder="Enter Price" class="form-control" name="pPrice" required>
                            </div>

                            <!--product discount-->
                            <div class="form-group">
                                <input type="number" name="pDiscount" placeholder="Enter Discount" class="form-control">
                            </div>
                            <!--product Quantity-->
                            <div class="form-group">
                                <input type="number" name="pQuantity" placeholder="Enter Quantity" class="form-control">
                            </div>

                            <!--product categories-->
                            <%                                 CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                                List<Category> list = cdao.getCategories();
                            %>

                            <div class="form-group">
                                <select name="catId" class="form-control">
                                    <%
                                        for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCategoryId()%>"><%= c.getCategoryTitle()%></option>
                                    <% }%>

                                </select>
                            </div>

                            <!--product file-->
                            <div class="form-group">
                                <label for="pPic"> Select pictures of product</label> <br>
                                <input type="file" id="pPic" name="pPic" required >
                            </div>

                            <!--submit button-->

                            <div class="container text-center">

                                <button class="btn btn-outline-success" >
                                    Add product
                                </button>
                            </div>
                            <!--end form-->
                        </form>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>
        <!--end of modal-->
    </body>
</html>
