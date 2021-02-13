<%-- 
    Document   : viewProducts
    Created on : Dec. 8, 2020, 11:10:32 a.m.
    Author     : minha
--%>

<%@page import="com.mycompany.finalproject.dao.ProductDao"%>
<%@page import="com.mycompany.finalproject.entities.Product"%>
<%@page import="java.util.Map"%>
<%@page import="com.mycompany.finalproject.helper.Helper"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.finalproject.entities.Category"%>
<%@page import="com.mycompany.finalproject.dao.CategoryDao"%>
<%@page import="com.mycompany.finalproject.helper.FactoryProvider"%>
<%@page import="com.mycompany.finalproject.entities.User"%>

<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in! Please login to enter.");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "Sorry! Only admin has access to this page.");
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
        <title>JSP Page</title>
        <%@include file = "components/styling_bootstrap_js.jsp" %>
    </head>
    <body>
        <%@include file = "components/navbar.jsp" %>
        <div class="container-fluid mt-5 text-center"><h1>PRODUCT LIST</h1></div>
        <% String cat = request.getParameter("category");
            //out.println(cat);

            ProductDao dao = new ProductDao(FactoryProvider.getFactory());
            List<Product> list = null;

            if (cat == null || cat.trim().equals("all")) {
                list = dao.getAllProducts();

            } else {

                int cid = Integer.parseInt(cat.trim());
                list = dao.getAllProductsById(cid);

            }

            CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
            List<Category> clist = cdao.getCategories();

        %>

        <div class="container panel mt-5">
            <table class='table'>
                <thead style="background: #819ca9;">
                    <tr>
                        <th>ProductId</th>
                        <th>ProductName</th>
                        <th>ProductDesc</th>
                        <th>ProductPrice</th>
                        <th>Action</th>
                        <th>Action</th>


                    </tr>

                </thead>

                <%           for (Product p : list) {

                %>
                <tbody>

                <td><%= p.getpId()%> </td>
                <td> <%= p.getpName()%> </td>
                <td> <%= p.getpDescription()%> </td>
                <td> $<%= p.getpDiscount()%> </td>
                
             
                <td> <button onclick='' class='btn btn-primary btn-sm'>Edit</button> </td>   
                <td> <button onclick='<%=dao.delete()%>' class='btn btn-danger btn-sm'>Remove</button> </td>
       
                </tr>

                <%}

                    if (list.size() == 0) {
                        out.println("<h3>Category is empty!</h3>");
                    }


                %>
                </tr>

                </tbody>
            </table>
        </div>
    </body>
</html>
