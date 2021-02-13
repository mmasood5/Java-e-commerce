<%-- 
    Document   : customer
    Created on : Nov. 30, 2020, 11:34:18 a.m.
    Author     : minha
--%>
<%@page import="com.mycompany.finalproject.entities.User"%>
<%
    User user = (User)session.getAttribute("current-user");
    if(user == null)
    {
        session.setAttribute("message", "You are not logged in! Please login to enter.");
        response.sendRedirect("login.jsp");
        return;
    }
    else
    {
        if(!user.getUserType().equals("normal"))
        {
            session.setAttribute("message", "Sorry! You need to be registered.");
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
        <title>S&S - Customer</title>
        <%@include file = "components/styling_bootstrap_js.jsp" %>
    </head>
    <body>
        <%@include file = "components/navbar.jsp" %>
        <h1>This page is for customers!</h1>
    </body>
</html>
