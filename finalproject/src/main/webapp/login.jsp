<%-- 
    Document   : login
    Created on : Nov. 30, 2020, 1:12:36 a.m.
    Author     : minha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>S&S - User Login</title>
        <%@include file = "components/styling_bootstrap_js.jsp"%>
    </head>
    
    <body>
        <%@include file ="components/navbar.jsp"%>
        <div class ="container mt-5">
            <div class ="row">
                <div class="col-md-6 offset-md-3">
                    
                    <div class ="card mt-5 bg-warning shadow-lg">
                        <div class ="card-header bg-warning">
                            <h3 class ="text-center">Login</h3>
                            
                        </div>
                        
                        <div class ="card-body">
                            
                            <%@include file = "components/message.jsp" %>
                            <form action = "LoginServlet" method="post">
                                <div class="form-group">
                                  <label for="exampleInputEmail1">Email address</label>
                                  <input name ="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                  <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                  <label for="exampleInputPassword1">Password</label>
                                  <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                
                                <a href ="register.jsp" class="text-center d-block mb-2 text-dark">Not registered? Click here!</a>
                                <div class ="container text-center">
                                <button type="submit" class="btn btn-outline-dark">Submit</button>
                                <button type="reset" class="btn btn-outline-dark">Reset</button>
                              
                                </div>
                                </form>
                        </div>
                        
                        
                        
                    </div>
                    
                    
                </div>
                
            </div>
        </div>
        
                            <%@include file = "components/footer.jsp"%> 
    </body>
    
        
         
        
        
    
</html>
