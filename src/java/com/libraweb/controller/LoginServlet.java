package com.libraweb.controller;

//import model.*;
import com.libraweb.model.User;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.libraweb.routers.UserRouter;

public class LoginServlet extends HttpServlet{
    
    Connection con;
    
    public void init(ServletConfig config) throws ServletException {
            super.init(config);

            try {	
                    Class.forName(config.getInitParameter("databaseDriver"));
                    String username = config.getInitParameter("databaseUsername");
                    String password = config.getInitParameter("databasePassword");
                    String url = config.getInitParameter("jdbcDriverURL") + "://" + config.getInitParameter("dbHostName") + ":" + config.getInitParameter("dbPort") + "/" + config.getInitParameter("dbName");
                    
                    con = DriverManager.getConnection(url,username,password);
            } catch (SQLException sqle){
                    System.out.println("SQLException error occured - " 
                    + sqle.getMessage());
            } catch (ClassNotFoundException nfe){
                    System.out.println("ClassNotFoundException error occured - " 
                    + nfe.getMessage());
            }
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        // Retrieve user input
        String username = getInitParameter("name");
        String password = getInitParameter("password");
        String role = getInitParameter("role");
        
        UserRouter userRouter = new UserRouter();
        try {
            User user = userRouter.authenticateUser(con, username, password, role);
            String destPage = "login.jsp";
             
            if (user != null) {
                System.out.println(user);
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                destPage = "home.jsp";
            }
             
            RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
            dispatcher.forward(request, response);
             
        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println("LoginServlet: "+ ex);
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
