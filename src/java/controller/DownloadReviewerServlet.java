/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Reviewer;
import routers.ReviewerRouter;

/**
 *
 * @author jomarklopez
 */
public class DownloadReviewerServlet extends HttpServlet {
    private static final int BUFFER_SIZE = 4096;
    
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
        String title = request.getParameter("reviewer_title");
        String author = request.getParameter("reviewer_author");
        
        ReviewerRouter reviewerRouter = new ReviewerRouter();           
        try {
            HttpSession session = request.getSession();
            ResultSet rs = reviewerRouter.getReviewer(con, title, author);
            
            String fileName = rs.getString("title");
            Blob blob = rs.getBlob("file_data");
            InputStream inputStream = blob.getBinaryStream();
            long fileLength = blob.length();

            System.out.println("fileLength = " + fileLength);

            ServletContext context = getServletContext();

            // sets MIME type for the file download
            String mimeType = context.getMimeType(fileName);
            if (mimeType == null) {        
                mimeType = "application/pdf";
            }              

            // set content properties and header attributes for the response
            response.setContentType(mimeType);
            response.setContentLengthLong(fileLength);
            String headerKey = "Content-Disposition";
            String headerValue = String.format("inline; filename=\"%s\".pdf", fileName);
            response.setHeader(headerKey, headerValue);

            // writes the file to the client
            OutputStream outStream = response.getOutputStream();

            byte[] buffer = new byte[BUFFER_SIZE];
            int bytesRead = -1;

            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outStream.write(buffer, 0, bytesRead);
            }

            inputStream.close();
            outStream.close();       
        } catch (SQLException sqle) {
            System.out.println("SQLException error occured - " 
            + sqle.getMessage());
            request.setAttribute("errorMessage", "SQL Database Error!");
            throw new ServletException(sqle);
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
