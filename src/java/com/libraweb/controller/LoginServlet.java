package com.libraweb.controller;

import com.libraweb.utils.listeners.UserContextListener;
import com.libraweb.model.*;
import com.libraweb.utils.exceptions.*;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.libraweb.routers.UserRouter;

public class LoginServlet extends HttpServlet{
    
    Connection con;
    
    @Override
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
                    throw new ServletException(sqle);
            } catch (ClassNotFoundException nfe){
                    System.out.println("ClassNotFoundException error occured - " 
                    + nfe.getMessage());
            }
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        UserRouter userRouter = new UserRouter();
        
        try {
            User user = userRouter.authenticateUser(con, username, password);
            ServletContext sc = getServletContext();
            sc.setAttribute("username", user.getName());
            sc.setAttribute("role", user.getRole());
            UserContextListener ucl = new UserContextListener();
            ucl.contextInitialized(new ServletContextEvent(sc));       

            HttpSession session = request.getSession();
            session.setAttribute("username", user.getName());

            RequestDispatcher success = request.getRequestDispatcher("success.jsp");
            success.forward(request, response);
        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println("LoginServlet Error: "+ ex.getMessage());
        } catch (AuthException ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            throw new ServletException(ex);
        } catch (NullValueException ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            throw new ServletException(ex);
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
