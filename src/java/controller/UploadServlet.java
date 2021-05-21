/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import exceptions.AuthException;
import exceptions.NullValueException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import routers.UploadRouter;
import java.io.InputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

/**
 *
 * @author jomarklopez
 */
@MultipartConfig(maxFileSize = 16177215) // upload file's size up to 16MB
public class UploadServlet extends HttpServlet {
    
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
        
        UploadRouter uploadRouter = new UploadRouter();
        
        String title = request.getParameter("title");
        String subject = request.getParameter("subject");
        String language = request.getParameter("language");
        String description = request.getParameter("description");
        InputStream file_data = null; 
        InputStream file_image = null;
        String message = null;
        
        Part file_dataPart = request.getPart("file_data");
        
        if (file_dataPart != null) {
            // prints out some information for debugging
            System.out.println(file_dataPart.getName());
            System.out.println(file_dataPart.getSize());
            System.out.println(file_dataPart.getContentType());

            // obtains input stream of the upload file
            file_data = file_dataPart.getInputStream();
        }
        
        Part file_imagePart = request.getPart("file_image");
        
        if (file_imagePart != null) {
            // prints out some information for debugging
            System.out.println(file_imagePart.getName());
            System.out.println(file_imagePart.getSize());
            System.out.println(file_imagePart.getContentType());

            // obtains input stream of the upload file
            file_image = file_imagePart.getInputStream();
        }
        
        try {
            // sends the statement to the database server
            int row = uploadRouter.uploadFile(con, title, subject, language, description, file_data, file_image);
            if (row > 0) {
                message = "File uploaded and saved into database";
            }

            // sets the message in request scope
            request.setAttribute("Message", message);

            // forwards to the message page
            getServletContext().getRequestDispatcher("/message.jsp")
                .forward(request, response);
                
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
