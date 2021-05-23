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
import static com.sun.xml.internal.ws.api.message.Packet.Status.Response;
import exceptions.*;
import java.sql.*;
import java.text.*;
import java.util.Calendar;
import java.util.List;
import model.User;
import routers.UserRouter;
import java.sql.SQLException;

/**
 *
 * @author Patrick
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
        response.setHeader("Expires", "0");
        response.setHeader("Cache-Control", "must-revalidate, post-check=0, pre-check=0");
        response.setHeader("Pragma", "public");
        response.setContentType("application/pdf");
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        
        //Code to generate a calendar digit form for No. 8 requirement of MP3
        DateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Calendar calendar = Calendar.getInstance();
        String tnc = "Terms and Conditions";
        //Current date according to the DateFormat
        String calendarDate = df.format(calendar.getTime());
        //Current date in digit only form ex. "20210501081012"
        String calendarDigitForm = calendarDate.replaceAll("[^a-zA-Z0-9]", "");
        response.setHeader("Content-Disposition", "inline; filename=" + tnc + ".pdf");
        
        try {
            // Generate pdf 
            Document doc = new Document();
            PdfWriter writer = PdfWriter.getInstance(doc, baos);
            //Print PDF in landscape form (No. 5 Requirement)
            Rectangle pdf = new Rectangle(PageSize.LETTER.rotate());
            doc.setPageSize(pdf);
            //Print header and footer in PDF (No. 6 Requirement)
            HeaderFooterPageEvent event = new HeaderFooterPageEvent();
            writer.setPageEvent(event);
            doc.open();
            //Name PDF in a digit form according to date (No. 8 Requirement)
            doc.addTitle(tnc);
            //Print username in PDF (No. 1 Requirement)
            //Print date and time the report was generated in PDF (No. 2 Requirement)
            doc.add(new Paragraph("The current date and time: " + calendarDate));
            doc.add(new Paragraph("    "));
           
            doc.add(new Paragraph("Terms and Conditions"));
            doc.add(new Paragraph("Last updated: May 23, 2021"));
            doc.add(new Paragraph("Please read these terms and conditions carefully before using Our Service"));
            doc.add(new Paragraph("Interpretation and Definitions"));
            doc.add(new Paragraph("Interpretation"));
            doc.add(new Paragraph("The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural."));
            doc.add(new Paragraph("Definitions"));
            doc.add(new Paragraph("For the purposes of these Terms and Conditions:"));
            doc.add(new Paragraph("Affiliate means an entity that controls, is controlled by or is under common control with a party, where &quot;control&quot; means ownership of 50% or more of the shares, equity interest or other securities entitled to vote for election of directors or other managing authority."));
            doc.add(new Paragraph("Country refers to:  Philippines"));
            doc.add(new Paragraph("Company refers to StudyAid Corp, EspaÃ±a Blvd, Sampaloc, Manila, 1008 Metro Manila."));
            doc.add(new Paragraph("Device means any device that can access the Service such as a computer, a cellphone or a digital tablet."));
            doc.add(new Paragraph("Service refers to the Website"));
            doc.add(new Paragraph("Terms and Conditions mean these Terms and Conditions that form the entire agreement between You and the Company regarding the use of the Service. This Terms and Conditions agreement has been created with the help of the Terms and Conditions Generator"));
            doc.add(new Paragraph("Third-party Social Media Service means any services or content (including data, information, products or services) provided by a third-party that may be displayed, included or made available by the Service."));
            doc.add(new Paragraph("Website refers to Review.io, accessible from http://www.review.io"));
            doc.add(new Paragraph("You means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable."));
            doc.add(new Paragraph("Acknowledgment"));
            doc.add(new Paragraph("These are the Terms and Conditions governing the use of this Service and the agreement that operates between You and the Company. These Terms and Conditions set out the rights and obligations of all users regarding the use of the Service."));
            doc.add(new Paragraph("Your access to and use of the Service is conditioned on Your acceptance of and compliance with these Terms and Conditions. These Terms and Conditions apply to all visitors, users and others who access or use the Service."));
            doc.add(new Paragraph("By accessing or using the Service You agree to be bound by these Terms and Conditions. If You disagree with any part of these Terms and Conditions then You may not access the Service."));
            doc.add(new Paragraph("You represent that you are over the age of 18. The Company does not permit those under 18 to use the Service."));
            doc.add(new Paragraph("Your access to and use of the Service is also conditioned on Your acceptance of and compliance with the Privacy Policy of the Company. Our Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your personal information when You use the Application or the Website and tells You about Your privacy rights and how the law protects You. Please read Our Privacy Policy carefully before using Our Service."));
            doc.add(new Paragraph("uility, for any reason whatsoever, including without limitation if You breach these Terms and Conditions."));
            doc.add(new Paragraph("Upon termination, Your right to use the Service will cease immediately."));
            doc.add(new Paragraph("Changes to These Terms and Conditions"));
            doc.add(new Paragraph("We reserve the right, at Our sole discretion, to modify or replace these Terms at any time. If a revision is material We will make reasonable efforts to provide at least 30 days' notice prior to any new terms taking effect. What constitutes a material change will be determined at Our sole discretion."));
            doc.add(new Paragraph("By continuing to access or use Our Service after those revisions become effective, You agree to be bound by the revised terms. If You do not agree to the new terms, in whole or in part, please stop using the website and the Service."));
            doc.add(new Paragraph("Contact Us"));
            doc.add(new Paragraph("If you have any questions about these Terms and Conditions, You can contact us:"));
            doc.add(new Paragraph("By email: reviewio@gmail.com"));
            
            doc.close();
            OutputStream os = response.getOutputStream();
            baos.writeTo(os);
            os.flush();
            os.close();
            
        } catch (FileNotFoundException ex) {
            ex.printStackTrace();
        } catch (DocumentException ex) {
            ex.printStackTrace();
        }
    }
    
    public class HeaderFooterPageEvent extends PdfPageEventHelper {
        private PdfTemplate t;
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
                // Set default
                header.setWidths(new int[]{24});
                header.setTotalWidth(717);
                header.setLockedWidth(true);
                header.getDefaultCell().setFixedHeight(40);
                header.getDefaultCell().setBorder(Rectangle.BOTTOM);
                header.getDefaultCell().setBorderColor(BaseColor.BLACK);
                
                // Add text
                PdfPCell text = new PdfPCell();
                text.setPaddingBottom(15);
                text.setPaddingLeft(10);
                text.setBorder(Rectangle.BOTTOM);
                text.setBorderColor(BaseColor.BLACK);
                text.addElement(new Phrase(getServletContext().getInitParameter("company"), new Font(Font.FontFamily.HELVETICA, 12)));
                header.addCell(text);

                // Write content
                header.writeSelectedRows(0, -1, 34, 612, writer.getDirectContent());
            } catch(DocumentException de) {
                throw new ExceptionConverter(de);
            }
        }

        private void addFooter(PdfWriter writer){
            PdfPTable footer = new PdfPTable(3);
            try {
                // Set default
                footer.setWidths(new int[]{24, 2, 1});
                footer.setTotalWidth(717);
                footer.setLockedWidth(true);
                footer.getDefaultCell().setFixedHeight(40);
                footer.getDefaultCell().setBorder(Rectangle.TOP);
                footer.getDefaultCell().setBorderColor(BaseColor.BLACK);

                // Add footer text
                footer.addCell(new Phrase(getServletContext().getInitParameter("company") + "/" + getServletContext().getInitParameter("companyEmail") + "/" + getServletContext().getInitParameter("copyrightYear"), new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD)));

                // Add current page count
                footer.getDefaultCell().setHorizontalAlignment(Element.ALIGN_RIGHT);
                footer.addCell(new Phrase(String.format("Page %d of", writer.getPageNumber()), new Font(Font.FontFamily.HELVETICA, 8)));

                // Add total page count
                PdfPCell totalPageCount = new PdfPCell(total);
                totalPageCount.setBorder(Rectangle.TOP);
                totalPageCount.setBorderColor(BaseColor.BLACK);
                footer.addCell(totalPageCount);

                // Write page
                PdfContentByte canvas = writer.getDirectContent();
                canvas.beginMarkedContentSequence(PdfName.ARTIFACT);
                footer.writeSelectedRows(0, -1, 34, 30, canvas);
                canvas.endMarkedContentSequence();
            } catch(DocumentException de) {
                throw new ExceptionConverter(de);
            }
        }

        public void onCloseDocument(PdfWriter writer, Document document) {
            ColumnText.showTextAligned(t, Element.ALIGN_RIGHT, new Phrase(String.valueOf(writer.getPageNumber()), new Font(Font.FontFamily.HELVETICA, 8)), 5 , 6, 0);
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
