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
import com.itextpdf.text.Element;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfPageEventHelper;
import exceptions.NullValueException;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import javax.servlet.ServletConfig;
import model.User;
import routers.UserRouter;

/**
 *
 * @author jomarklopez
 */

public class GeneratePDFServlet extends HttpServlet {
    
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
        response.setHeader("Expires", "0");
        response.setHeader("Cache-Control", "must-revalidate, post-check=0, pre-check=0");
        response.setHeader("Pragma", "public");
        response.setContentType("application/pdf");
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        
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
            String recordtype = request.getParameter("recordtype");
            
            UserRouter userRouter = new UserRouter();
            List<User> users = userRouter.getAllUsers(con);
            
            
            // Generate pdf 
            
            Document doc = new Document();
            PdfWriter writer = PdfWriter.getInstance(doc, baos);
            //Print PDF in landscape form (No. 5 Requirement)
            Rectangle rect = new Rectangle(PageSize.LETTER.rotate());
            //Print header and footer in PDF (No. 6 Requirement)
            writer.setBoxSize("format", rect);
            doc.setPageSize(rect);
            HeaderFooterPageEvent event = new HeaderFooterPageEvent();
            writer.setPageEvent(event);
            doc.addTitle(calendarDigitForm);
            //Print username in PDF (No. 1 Requirement)
            doc.add(new Paragraph("A PDF document by: " + username));
            //Print date and time the report was generated in PDF (No. 2 Requirement)
            doc.add(new Paragraph("Date and Time is: " + calendarDate));
            
            //Print all records
            if (recordtype.equals("allrecords")) {
                PdfPTable table = new PdfPTable(2);
                for(int i = 0; i < users.size(); i++){
                    table.addCell(users.get(i).getName());
                    table.addCell(users.get(i).getRole());
                }
                doc.add(table);
            } else if (recordtype.equals("userrecord")) {
                PdfPTable table = new PdfPTable(2);
                table.addCell(username);
                table.addCell(role);
                doc.add(table);
            }
            
            //Print page x of y (No. 4 Requirement)
            doc.add(new Paragraph("Page " + calendarDate + " of " + "endPage"));
            
            doc.close();
            OutputStream os = response.getOutputStream();
            baos.writeTo(os);
            os.flush();
            os.close();
            
        } catch (FileNotFoundException ex) {
            ex.printStackTrace();
        } catch (DocumentException ex) {
            ex.printStackTrace();
        } catch (SQLException sqle){
                System.out.println("SQLException error occured - " 
                + sqle.getMessage());
                throw new ServletException(sqle);
        } catch (NullValueException ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            throw new ServletException(ex);
        }
    }
    
    public class HeaderFooterPageEvent extends PdfPageEventHelper {
    @Override
    public void onStartPage(PdfWriter writer,Document document) {
    	Rectangle rect = writer.getBoxSize("format");
        ColumnText.showTextAligned(writer.getDirectContent(),Element.ALIGN_CENTER, new Phrase(getServletContext().getInitParameter("company")), rect.getTop(), 0, 0);
    }
    @Override
    public void onEndPage(PdfWriter writer,Document document) {
    	Rectangle rect = writer.getBoxSize("format");
        ColumnText.showTextAligned(writer.getDirectContent(),Element.ALIGN_CENTER, new Phrase(getServletContext().getInitParameter("company")), rect.getTop(), 0, 0);
        ColumnText.showTextAligned(writer.getDirectContent(),Element.ALIGN_CENTER, new Phrase(getServletContext().getInitParameter("companyEmail")), rect.getTop(), rect.getLeft(), 0);
        ColumnText.showTextAligned(writer.getDirectContent(),Element.ALIGN_CENTER, new Phrase(getServletContext().getInitParameter("copyrightYear")), rect.getTop(), rect.getRight(), 0);
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