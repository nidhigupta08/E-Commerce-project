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
        <h1>Hello World!</h1>
        <h1> Creating session factory objects</h1>
   <!--factory create kr rha jaise factory create hoga waise hi mera structure update hojaiga -->     
        <%
            out.println(FactoryProvider.getFactory()+ "<br>");
            
        %>
      
    </body>
</html>
