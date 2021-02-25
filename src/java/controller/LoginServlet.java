package controller;

//import model.*;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class LoginServlet extends HttpServlet{
    Connection c;
    
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        
        try {	
            Class.forName(config.getInitParameter("databaseDriver"));
            String username = config.getInitParameter("databaseUsername");
            String password = config.getInitParameter("databasePassword");
            StringBuffer url = new StringBuffer(config.getInitParameter("jdbcDriverURL"))
                .append("://")
                .append(config.getInitParameter("databaseHostName"))
                .append(":")
                .append(config.getInitParameter("databasePort"))
                .append("/")
                .append(config.getInitParameter("databaseName"));
            c = DriverManager.getConnection(url.toString(), username, password);
            
        } 
        catch (SQLException sqle){
            System.out.println("SQLException error occured: " + sqle.getMessage());
        } 
        catch (ClassNotFoundException cnfe){
            System.out.println("ClassNotFoundException error occured: " + cnfe.getMessage());
        }
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
            
        /*try{
            String usernameInput = request.getParameter("usernameText");
            String passwordInput = request.getParameter("passwordText");
            
            if(usernameInput.equals(usernameOutput) && passwordInput.equals(passwordOutput)){
                User user = new User();
                user.setUsernameAndPass(usernameInput, passwordInput);
                ServletContext sc = getServletContext();
                sc.setAttribute("person", user);
                UserContextListener ucl = new UserContextListener();
                ucl.contextInitialized(new ServletContextEvent(sc));       
                
                HttpSession session = request.getSession();
                session.setAttribute("username", usernameInput);
                    
                Cookie u = new Cookie("username", usernameInput);
                response.addCookie(u);
                    
                RequestDispatcher success = request.getRequestDispatcher("/registeredUser/success.jsp");
                success.forward(request, response);
            }
            else if(usernameInput.isEmpty() && passwordInput.isEmpty()){
                throw new NullValueException();
            }
            else if(!usernameInput.equals(usernameOutput) || !passwordInput.equals(passwordOutput)){
                throw new AuthenticationException();
            }
        }
        catch(NullValueException nve){
            HttpSession session = request.getSession();
            session.setAttribute("error", "Null Value Exception");
                
            String nves = nve.toString();
            request.setAttribute("errorType", nves);
            throw new ServletException("Null Value Exception", nve);
        }
        catch(AuthenticationException ae){
            HttpSession session = request.getSession();
            session.setAttribute("error", "Authentication Exception");
            
            String aes = ae.toString();
            request.setAttribute("errorType", aes);
            throw new ServletException("Authentication Exception", ae);
        }*/
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
