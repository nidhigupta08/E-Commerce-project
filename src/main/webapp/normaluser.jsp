<%@page import="com.learn.mavenproject.entities.User"%>
<%
User user=(User)session.getAttribute("current-user");
    if(user==null){
         session.setAttribute("message", "You are not logged in !! Login first");
         response.sendRedirect("login.jsp");
         return;
    }
    else{
    if(user.getUserType().equals("admin")){
        session.setAttribute("message", "You are not a normal user !! Do not accesss this page");
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
        <title>User</title>
    </head>
    <body>
        <h1>This is normal user page</h1>
    </body>
</html>
