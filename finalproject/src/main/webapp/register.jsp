<%-- 
    Document   : register
    Created on : Nov. 29, 2020, 10:17:59 p.m.
    Author     : minha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>S&S Register</title>
        <%@include file = "components/styling_bootstrap_js.jsp"%>
    </head>
    <body>
        <%@include file ="components/navbar.jsp"%>
        
        <div class ="container-fluid">
            
        <div class="row mt-5">
            <div class="col-md-4 offset-md-4">
                
                
                <div class="card-body  px-5 shadow-lg">
                    <%@include file = "components/message.jsp"%>
                    <div class ="container text-center">
                        <img src ="images/rockon.png" style="max-width: 100px;" class="img-fluid">
                    </div>
                
                    <h3 class="text-center my-5">Let's sign you up!</h3>
                
                
                    <form action="RegisterServlet" method="post">
                    
                        <div class="form-group">
                            <label for="name">Username</label>
                            <input name = "user_name" type="text" class="form-control" id="name" placeholder = "Enter here" aria-describedby="emailHelp" >

                        </div>

                        <div class="form-group">
                            <label for="email">User Email</label>
                            <input name ="user_email" type="email" class="form-control" id="email" placeholder = "Enter here" aria-describedby="emailHelp" >

                        </div>

                        <div class="form-group">
                            <label for="password">User password</label>
                            <input name ="user_password" type="password" class="form-control" id="password" placeholder = "Enter here" aria-describedby="emailHelp">

                        </div>
                        <div class="form-group">
                            <label for="phone">Phone#</label>
                            <input name ="user_phone" type="number" class="form-control" id="phone" placeholder = "Enter here" aria-describedby="emailHelp">

                        </div>
                        <div class="form-group">
                            <label for="phone">User address</label>
                            <textarea name ="user_address" style ="height:200px" class ="form-control" placeholder="Enter your address"></textarea>

                        </div>
                        <div class="container text-center">
                            <button type = "submit" class ="btn btn-outline-dark">Register</button>
                            <button type ="reset" class ="btn btn-outline-dark">Reset</button>
                        </div>

                    </form> 
                    
                </div>
                
            
            </div>
        
        </div>
    
        </div>
                    <%@include file = "components/footer.jsp"%>
    </body>
</html>
