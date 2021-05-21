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
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
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
            
            ReviewerRouter reviewerRouter = new ReviewerRouter();
            Reviewer reviewer = reviewerRouter.findReviewer(con, subjectInput);
            
            HttpSession session = request.getSession();
            String role = (String)session.getAttribute("role");
            if(role.equals("Premium") || role.equals("Free") || role.equals("Review+") ) {
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("studenthome.jsp");
                dispatcher.forward(request,response);
            } else {
                RequestDispatcher dispatcher = request.getRequestDispatcher("authorhome.jsp");
                dispatcher.forward(request,response);
            }
    }
}