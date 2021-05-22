/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

/**
 *
 * @author jlopez
 */
import exceptions.AuthException;
import exceptions.NullValueException;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.http.*;
import model.Reviewer;
import routers.ReviewerRouter;

public class ReviewerServlet extends HttpServlet {
    
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
            
            HttpSession session = request.getSession();
            String userID = (String)session.getAttribute("userID");
            
            try {
                ReviewerRouter reviewerRouter = new ReviewerRouter();           
                ArrayList<Reviewer> reviewers = reviewerRouter.getAllUserReviewer(con, userID);
                
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
}