<%-- 
    Document   : admin
    Created on : Nov. 30, 2020, 11:33:39 a.m.
    Author     : minha
--%>

<%@page import="java.util.Map"%>
<%@page import="com.mycompany.finalproject.helper.Helper"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.finalproject.entities.Category"%>
<%@page import="com.mycompany.finalproject.dao.CategoryDao"%>
<%@page import="com.mycompany.finalproject.helper.FactoryProvider"%>
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
        if(user.getUserType().equals("normal"))
        {
            session.setAttribute("message", "Sorry! Only admin has access to this page.");
            response.sendRedirect("login.jsp");
            return;
        }
    }



%>


<%    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
    List<Category> list = cdao.getCategories();

//Fetching counts for procuts and users
Map<String,Long> m = Helper.getCounts(FactoryProvider.getFactory());

%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>S&S - Admin</title>
        <%@include file = "components/styling_bootstrap_js.jsp" %>
    </head>
    <body>
        <%@include file = "components/navbar.jsp" %>
        
        <div class = "container admin mt-5">
            
            <div class="container-fluid mt-3">
                
                <%@include file = "components/message.jsp" %>
            </div>
            
            <div class ="row mt-5">
                <div class ="col-md-4 mt-5">
                    <div class ="card shadow-lg">
                        <div class ="card-body text-center">
                            
                            <div class ="container">
                                <img class ="img-fluid rounded-circle" style="max-width: 100px;" src ="images/users.png">
                            </div>
                            <h4 class = "mt-2"><%=m.get("userCount")%></h4>
                            <h2>Users</h2>
                            
                        </div>
                    </div>
                    
                    
                    
                </div>
                
                <div class ="col-md-4 mt-5">
                    <div class ="card shadow-lg">
                        <div class ="card-body text-center">
                            <div class ="container">
                                <img class ="img-fluid rounded-circle" style="max-width: 100px;" src ="images/category.png">
                            </div>
                            <h4 class = "mt-2"><%= list.size()%></h4>
                            <h2>Categories</h2>
                            
                        </div>
                    </div>
                    
                    
                    
                </div>
                
                <div class ="col-md-4 mt-5">
                    <div onclick ="window.location = 'viewProducts.jsp'" class ="card shadow-lg" data-toggle = "modal" data-target = "#viewProducts">
                        <div class ="card-body text-center">
                            <div class ="container">
                                <img class ="img-fluid rounded-circle" style="max-width: 100px;" src ="images/product.png">
                            </div>
                            <h4 class = "mt-2"><%=m.get("productCount")%></h4>
                            <h2>View products</h2>
                            
                        </div>
                    </div>
                    
                    
                    
                </div>
                
            </div>
            
            <div class="row mt-5">
                
                <div class="col-md-6">
                    
                    <div class ="card shadow-lg" data-toggle ="modal" data-target="#add-category-modal">
                        <div class ="card-body text-center">
                            <div class ="container">
                                <img class ="img-fluid rounded-circle" style="max-width: 100px;" src ="images/shoes.png">
                            </div>
                            <p class="mt-2">Click here to add a category</p>
                            <h2>Add Category</h2>

                        </div>
                    </div>

                    
                </div>
                
                
                <div class="col-md-6">
                    
                    <div class ="card shadow-lg" data-toggle ="modal" data-target="#add-product-modal">
                        <div class ="card-body text-center">
                            <div class ="container">
                                <img class ="img-fluid rounded-circle" style="max-width: 100px;" src ="images/upload.png">
                            </div>
                            <p class="mt-2">Click here to add products</p>
                            <h2>Add Products</h2>

                        </div>
                    </div>

                    
                </div>
                
            </div>
        </div>
        
        <!--Add a category bootstrap modal-->
        
        

        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header bg-warning">
                        <h5 class="modal-title" id="exampleModalLabel">Category Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="AddProductServlet" method="post">
                            
                            <input type ="hidden" name="operation" value="addcategory">
                            <div class="form-group">
                                <input type ="text" class="form-control" name ="categoryTitle" placeholder="Category title" required/>
                                
                            </div>
                            <div class="form-group">
                                <textarea style="height:250px;" class="form-control" placeholder="Category description" name ="categoryDescription" required></textarea>
                            </div>
                            
                            <div class ="container text-center">
                                <button class ="btn btn-warning">Add Category</button>
                                <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>
                    
                </div>
            </div>
        </div>
        
        <!--Modal END-->
        
        
        
        <!--Add Products Modal-->
        
       

        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header bg-warning">
                        <h5 class="modal-title" id="exampleModalLabel">Product details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        
                        <form action="AddProductServlet" method="post" enctype="multipart/form-data">
                            
                            <input type ="hidden" name ="operation" value="addproduct"/>
                            <div class ="form-group">
                                <input type ="text" class="form-control" placeholder="Enter name of the product" name="pName" required/>
                            </div>
                            
                            <div class ="form-group">
                                <textarea style="height: 100px;" class = "form-control" placeholder ="Enter product description" name ="pDescription"></textarea>
                            </div>
                            
                            <div class ="form-group">
                                <input type ="number" class="form-control" placeholder="Enter price of the product" name="pPrice" required/>
                            </div>
                            
                            <div class ="form-group">
                                <input type ="number" class="form-control" placeholder="Enter discount on the product" name="pDiscount" required/>
                            </div>
                            
                            <div class ="form-group">
                                <input type ="number" class="form-control" placeholder="Enter quantity of the product" name="pQuantity" required/>
                            </div>
                            
                            <!--FETCHING ALL THE CATEGORY ITEMS FROM THE DB-->
                            
                            <div class ="form-group">
                                <select name="catId" class = "form-control" id="">
                                    <%
                                        for(Category c:list){
                                        %>
                                    
                                    <option value ="<%=c.getCategoryID()%>"><%= c.getCategoryTitle()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            
                            
                            <div class="form-group">
                                <label for ="pPhoto">Select a picture for your product:</label>
                                <br>
                                <input type="file" id="pPhoto" name="pPhoto" required/>
                                
                            </div>
                            
                            
                            <div class ="container text-center">
                                <button class = "btn btn-warning">Add Product</button>
                                <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                                
                            </div>
                        </form>
                        
                        
                    </div>
                    
                </div>
            </div>
        </div>
        
        
        <!--Modal end-->
        
        <!--EDIT/DELETE MODAL-->
        
       

        <!-- Modal
        <div class="modal fade" id="viewProducts" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-warning">
                        <h5 class="modal-title" id="exampleModalLabel">Products</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <table class="table">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col">Name</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>@mdo</td>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>Jacob</td>
                                    <td>Thornton</td>
                                    <td>@fat</td>
                                </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <td>Larry</td>
                                    <td>the Bird</td>
                                    <td>@twitter</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                        
                    </div>
                </div>
            </div>
        </div> 
        -->
        <%@include file = "components/footer.jsp"%>
        <%@include file = "components/common_modal.jsp" %>
    </body>
</html>
