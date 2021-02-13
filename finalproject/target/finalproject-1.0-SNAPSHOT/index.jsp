<%-- 
    Document   : index
    Created on : Nov. 26, 2020, 1:28:31 a.m.
    Author     : minha
--%>

<%@page import="com.mycompany.finalproject.helper.Helper"%>
<%@page import="com.mycompany.finalproject.entities.Category"%>
<%@page import="com.mycompany.finalproject.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.finalproject.entities.Product"%>
<%@page import="com.mycompany.finalproject.dao.ProductDao"%>
<%@page import="com.mycompany.finalproject.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>S&S - Home</title>
        <%@include file = "components/styling_bootstrap_js.jsp"%>
    
    </head>
    
     
    <body>
        <%@include file ="components/navbar.jsp"%>
        <div class ="container">
        
            <div class ="row mt-5">
            
            <%
                
                String cat = request.getParameter("category");
                //out.println(cat);
                ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                List<Product> list = null;
                if(cat == null || cat.trim().equals("all"))
                {
                    list= dao.getAllProducts();
                }
                
                else{
                    int cid = Integer.parseInt(cat.trim());
                    list = dao.getAllProductsById(cid);
                }
                
                
                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                List<Category> clist = cdao.getCategories();
            %>
                   
            <!--Display Categories-->
            <div class="col-md-2 mt-5">
            
                <div class="list-group shadow-lg">
                    <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                        All Products
                    </a>
                
            
                <%
                    for(Category c : clist)
                    {
                        
                %>
                <a href="index.jsp?category=<%= c.getCategoryID()%>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle() %></a>

                    
                        
                <% 
                    }
                
                %>
                
                </div>
                
            </div>
            
            
            <!--Display Products-->
            <div class="col-md-10 mt-5">
                <div class="row">
                    <div class="md-col-12">
                        <div class="card-columns">
                            
                            <% 
                                for(Product p:list){
                            %>
                            
                            <!--Product Card-->
                            <div class ="card shadow-lg border-0 pCard">
                                <div class ="container text-center">
                                
                                    
                                    <img src="images/products/<%= p.getpPhoto()%>"  class="card-img-top mt-3" alt="...">
                                
                                
                                </div>
                                
                                <div class ="card-body">
                                    <h5 class="card-title"><%= p.getpName()%></h5>
                                    <p class="card-text"><%= Helper.skimDesc(p.getpDescription())%></p>
                                    
                                </div>
                                    
                                    <div class="card-footer text-center">
                                        
                                        <button class="btn btn-warning" onclick="add_item_to_cart(<%= p.getpId() %>, '<%= p.getpName() %>', <%= p.discountPrice()%>)">Add to cart</button>
                                        <button class="btn btn-outline-dark">&#36;<%= p.discountPrice()%>
                                        <span class ="text-secondary disPrice"> &#36;<%= p.getpPrice() %> (<%= p.getpDiscount()%>% off)</span></button>
                                    </div>
                            </div>
                            
                            
                            <%
                                }

                                if(list.size()==0)
                                    {
                                        out.println("<h3>Category is empty!</h3>");
                                    }
                            %>

                        </div>

                    </div>

                </div>
            </div>
        </div>

        </div>

    <%@include file = "components/footer.jsp"%>
    <%@include file = "components/common_modal.jsp" %>
    
    </body>
</html>
