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
        <h1>Hello! <%
            ServletContext sc = request.getServletContext();
            sc.getAttribute("role");
            %>: 
            <%
            sc.getAttribute("username");
            %></h1>
    </body>
</html>
