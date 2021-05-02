/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 *
 * @author jomarklopez
 */

public class GeneratePDFServlet extends HttpServlet {

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
        
        Document doc = new Document();
        //Print PDF in landscape form (No. 5 Requirement)
        doc.setPageSize(PageSize.LETTER.rotate());
        
        //My code for no. 8 requirement of MP3
        DateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Calendar calendar = Calendar.getInstance();
        //Current date according to the DateFormat
        String calendarDate = df.format(calendar.getTime());
        //Current date in digit only form ex. "20210501081012"
        String calendarDigitForm = calendarDate.replaceAll("[^a-zA-Z0-9]", "");
        
        try {
            HttpSession session = request.getSession();
            String username = (String)session.getAttribute("username");
            String role = (String)session.getAttribute("role");
            
            PdfWriter.getInstance(doc, new FileOutputStream(calendarDigitForm));
            
            doc.open();
            //Print username in PDF (No. 1 Requirement)
            doc.add(new Paragraph("A PDF document by: " + username));
            //Print date and time the report was generated in PDF (No. 2 Requirement)
            doc.add(new Paragraph("Date and Time is: " + calendarDate));
            //Print page x of y (No. 4 Requirement)
            doc.add(new Paragraph("Page " + calendarDate + " of " + "endPage"));
            //Print header and footer in PDF (No. 6 Requirement)
            //Header
            doc.add(new Paragraph(getServletContext().getInitParameter("company")));
            //Footer
            doc.add(new Paragraph(getServletContext().getInitParameter("company")));
            doc.add(new Paragraph(getServletContext().getInitParameter("companyEmail")));
            doc.add(new Paragraph(getServletContext().getInitParameter("copyrightYear")));
            
            doc.close();
            
        } catch (FileNotFoundException ex) {
            ex.printStackTrace();
            //Logger.getLogger(HelloWorldExample.class.getName()).log(Level.SEVERE, null, ex);
        } catch (DocumentException ex) {
            ex.printStackTrace();
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
