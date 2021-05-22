/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import exceptions.AuthException;
import exceptions.NullValueException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import routers.ReviewerRouter;

/**
 *
 * @author jomarklopez
 */
public class DeleteReviewerServlet extends HttpServlet {
    
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
        String title = request.getParameter("reviewer_title");
        String message = null;
        
        try {
            HttpSession session = request.getSession();         
            int user_id = Integer.parseInt((String) session.getAttribute("user_id"));
            ReviewerRouter reviewerRouter = new ReviewerRouter(); 
            int row = reviewerRouter.deleteReviewer(con, user_id, title);
            if (row > 0) {
                message = title+ " has been successfully deleted";
            } 
            session.setAttribute("SuccessMessage", message);
            response.sendRedirect(request.getContextPath() + "/home");
        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println("LoginServlet Error: "+ ex.getMessage());
        } catch (AuthException ex) {
            Logger.getLogger(DeleteReviewerServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NullValueException ex) {
            Logger.getLogger(DeleteReviewerServlet.class.getName()).log(Level.SEVERE, null, ex);
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
