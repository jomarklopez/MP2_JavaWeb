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
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.http.*;
import model.Reviewer;
import routers.ReviewerRouter;

public class HomeServlet extends HttpServlet {
    
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
            throws IOException, ServletException {
            try {
                HttpSession session = request.getSession();
                String destination = "index.jsp";
                String role = (String) session.getAttribute("role");
                String user_id = (String) session.getAttribute("user_id");
                request.setAttribute("username", (String) session.getAttribute("username"));
                if(role == null) {
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/");
                    dispatcher.forward(request, response);
                }
                System.out.println(role);
                if(role.equals("Free")) {
                    destination = "studenthome.jsp";
                    request.setAttribute("showAds", true);
                } else if (role.equals("Premium") || role.equals("Review+")) {
                    destination = "studenthome.jsp";
                    request.setAttribute("showAds", false);
                } else {
                    request.setAttribute("showAds", false);
                    destination = "authorhome.jsp";
                    ReviewerRouter reviewerRouter = new ReviewerRouter();           
                    ArrayList<Reviewer> userReviewers = reviewerRouter.getAllUserReviewer(con, user_id);
                    request.setAttribute("userReviewers", userReviewers);
                }
                
                RequestDispatcher dispatcher = request.getRequestDispatcher(destination);
                dispatcher.forward(request, response);
            } catch (SQLException ex) {
                System.out.println("HomeServlet Error: "+ ex.getMessage());
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
