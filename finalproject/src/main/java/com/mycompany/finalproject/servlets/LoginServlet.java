/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.finalproject.servlets;

import com.mycompany.finalproject.dao.UserDao;
import com.mycompany.finalproject.entities.User;
import com.mycompany.finalproject.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author minha
 */
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
           String email = request.getParameter("email");
           String password = request.getParameter("password");
           
            //VALIDATIONS NEED TO BE DONE!!
            //USER AUTHENTICATION
            UserDao userDao = new UserDao(FactoryProvider.getFactory());
            User user = userDao.getUserByEmailAndPassword(email, password);
            
            HttpSession httpSession = request.getSession();
            
            if(user==null)
            {
                out.println("<h1>Invalid credentials</h1>");
                httpSession.setAttribute("message", "Invalid credentials! Please make sure you entered the right username and password.");
                response.sendRedirect("login.jsp");
                return;
                
            }
            else
            {
                out.println("<h1>Welcome " + user.getUserName() + "</h1>");
                
                httpSession.setAttribute("current-user", user);
                if(user.getUserType().equals("admin"))
                {
                    response.sendRedirect("admin.jsp");
                    
                }
                else if(user.getUserType().equals("normal")){
                    response.sendRedirect("index.jsp");
                }
            
                else {
                    out.println("User not found!");
                }
            }
            
           
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
