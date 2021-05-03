/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import exceptions.*;
import java.sql.*;
import java.text.*;
import java.util.Calendar;
import java.util.List;
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
        
        //Code to generate a calendar digit form for No. 8 requirement of MP3
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
            doc.setPageSize(PageSize.LETTER.rotate());
            doc.open();
            //Print header and footer in PDF (No. 6 Requirement)
            HeaderFooterPageEvent event = new HeaderFooterPageEvent();
            writer.setPageEvent(event);
            //Name PDF in a digit form according to date (No. 8 Requirement)
            doc.addTitle(calendarDigitForm);
            //Print username in PDF (No. 1 Requirement)
            doc.add(new Paragraph("A PDF document by: " + username));
            //Print date and time the report was generated in PDF (No. 2 Requirement)
            doc.add(new Paragraph("The current date and time: " + calendarDate));
            
            //Print records (No. 7 Requirement)
            if (recordtype.equals("allrecords")) {
                PdfPTable table = new PdfPTable(2);
                table.addCell("USERNAME");
                table.addCell("ROLE");
                for(int i = 0; i < users.size(); i++){
                    table.addCell(users.get(i).getName());
                    table.addCell(users.get(i).getRole());
                }
                doc.add(table);
            } else if (recordtype.equals("userrecord")) {
                PdfPTable table = new PdfPTable(2);
                table.addCell("USERNAME");
                table.addCell("ROLE");
                table.addCell(username);
                table.addCell(role);
                doc.add(table);
            }
            
            //Print page x of y (No. 4 Requirement)
            
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
    
    /*private PdfTemplate t;
    private Image total;

    @Override
    public void onOpenDocument(PdfWriter writer, Document document) {
        t = writer.getDirectContent().createTemplate(30, 16);
        try {
            total = Image.getInstance(t);
            total.setRole(PdfName.ARTIFACT);
        } catch (DocumentException de) {
            throw new ExceptionConverter(de);
        }
    }
    
    @Override
    public void onEndPage(PdfWriter writer, Document document) {
        addHeader(writer);
        addFooter(writer);
    }

    private void addHeader(PdfWriter writer){
        PdfPTable header = new PdfPTable(1);
        try {
            // Set Format
            header.setWidths(new int[]{24});
            header.setTotalWidth(527);
            header.setLockedWidth(true);
            header.getDefaultCell().setFixedHeight(40);
            header.getDefaultCell().setBorder(Rectangle.BOTTOM);
            header.getDefaultCell().setBorderColor(BaseColor.BLACK);

            // Add text
            PdfPCell text = new PdfPCell();
            text.setPaddingBottom(15);
            text.setPaddingLeft(10);
            text.setBorder(Rectangle.BOTTOM);
            text.addElement(new Phrase(getServletContext().getInitParameter("company"), new Font(Font.FontFamily.HELVETICA, 12)));
            header.addCell(text);

            // Write content
            header.writeSelectedRows(0, 0, 34, 750, writer.getDirectContent());
        } catch(DocumentException de) {
            throw new ExceptionConverter(de);
        }
    }

    private void addFooter(PdfWriter writer){
        PdfPTable footer = new PdfPTable(3);
        try {
            // Set Format
            footer.setWidths(new int[]{24, 2, 1});
            footer.setTotalWidth(527);
            footer.setLockedWidth(true);
            footer.getDefaultCell().setFixedHeight(40);
            footer.getDefaultCell().setBorder(Rectangle.TOP);
            footer.getDefaultCell().setBorderColor(BaseColor.BLACK);

            // Add company
            footer.addCell(new Phrase(getServletContext().getInitParameter("company"), new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD)));

            // Add current page count
            footer.getDefaultCell().setHorizontalAlignment(Element.ALIGN_RIGHT);
            footer.addCell(new Phrase(String.format("Page %d of", writer.getPageNumber()), new Font(Font.FontFamily.HELVETICA, 8)));

            // Add total page count
            PdfPCell totalPageCount = new PdfPCell(total);
            totalPageCount.setBorder(Rectangle.TOP);
            totalPageCount.setBorderColor(BaseColor.LIGHT_GRAY);
            footer.addCell(totalPageCount);

            // Write Page
            PdfContentByte canvas = writer.getDirectContent();
            canvas.beginMarkedContentSequence(PdfName.ARTIFACT);
            footer.writeSelectedRows(0, 0, 34, 40, canvas);
            canvas.endMarkedContentSequence();
        } catch(DocumentException de) {
            throw new ExceptionConverter(de);
        }
    }

    public void onCloseDocument(PdfWriter writer, Document document) {
        int totalLength = String.valueOf(writer.getPageNumber()).length();
        int totalWidth = totalLength * 5;
        ColumnText.showTextAligned(t, Element.ALIGN_RIGHT,
                new Phrase(String.valueOf(writer.getPageNumber()), new Font(Font.FontFamily.HELVETICA, 8)),
                totalWidth, 6, 0);
    }*/
    public void onEndPage(PdfWriter writer,Document document) {
        ColumnText.showTextAligned(writer.getDirectContent(),Element.ALIGN_CENTER, new Phrase(getServletContext().getInitParameter("company")), 395, 570, 0);
        ColumnText.showTextAligned(writer.getDirectContent(),Element.ALIGN_CENTER, new Phrase(getServletContext().getInitParameter("company") + " " + getServletContext().getInitParameter("companyEmail") + " " + getServletContext().getInitParameter("copyrightYear")), 300, 30, 0);
        ColumnText.showTextAligned(writer.getDirectContent(),Element.ALIGN_CENTER, new Phrase("Page " + document.getPageNumber()), 550, 30, 0);
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