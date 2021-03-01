<%-- 
    Document   : success
    Created on : 26 Feb 2021, 5:44:26 pm
    Author     : jlopez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
            response.setHeader("Pragma", "no-cache"); //HTTP 1.0
            response.setHeader("Expires", "0"); //Proxies
            
            if(session.getAttribute("username") == null)
            {
                response.sendRedirect("index.jsp");
            }
        %>
        <h1>
            Hello! <%
            ServletContext sc = request.getServletContext();
            sc.getAttribute("role");
            %>: 
            <%
            sc.getAttribute("username");
            %></h1>
            <a href="LogoutServlet">Logout</a>
    </body>
</html>
