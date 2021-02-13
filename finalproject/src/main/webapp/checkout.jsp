<%-- 
    Document   : checkout
    Created on : Dec. 5, 2020, 1:49:05 a.m.
    Author     : minha
--%>

<%

 User user = (User) session.getAttribute("current-user");
     if (user == null) {
         session.setAttribute("message", "You are not logged in! Please login to checkout.");
         response.sendRedirect("login.jsp");
         return;
     }
     



%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>S&S - Checkout</title>
        <%@include file = "components/styling_bootstrap_js.jsp" %>
    </head>
    <body>
        <%@include file = "components/navbar.jsp" %>
        
        <div class="container">
            
            <div class ="row mt-5">
                <div class="col-md-6" style="max-width: 100%;">
                <!--CART-->   
                <div class="card bg-warning shadow-lg">
                    <div class="card-body">
                        <h3 class = "text-center my-5">Your cart</h3>
                        <div class ="cart-body bg-warning">

                        </div>
                    </div>
                </div>
                
                </div>
                
                <div class="col-md-6"style="max-width: 100%;">
                <!--Form-->    
                <div class="card bg-warning shadow-lg">
                    <div class="card-body">
                        <h3 class="text-center my-5">
                            Customer details
                        </h3>
                        <form action="#!">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address:</label>
                                <input value ="<%=user.getUserEmail()%>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>
                            <div class="form-group">
                                <label for="name">Shipping name:</label>
                                <input value ="<%=user.getUserName()%>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter name">
                                
                            </div>
                            <div class="form-group">
                                <label for="exampleFormControlTextarea1">Your shipping address:</label>
                                <textarea value ="<%=user.getUserAddress()%>" class="form-control" id="exampleFormControlTextarea1" placeholder="Enter shipping address" rows="3"></textarea>
                            </div>
                            
                            <div class ="container text-center">
                                <button class ="btn btn-outline-dark">Order</button>
                                <button class ="btn btn-dark">Continue shopping</button>
                            </div> 
                        </form>
                    </div>
                </div>
                </div>
                
            </div>
        </div>
                                <%@include file = "components/footer.jsp"%>
        <%@include file = "components/common_modal.jsp" %>
    </body>
</html>
