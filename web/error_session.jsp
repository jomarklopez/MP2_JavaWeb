<%-- 
    Document   : authenticationException
    Created on : 02 25, 21, 2:41:15 PM
    Author     : Patrick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Unauthorized</title>
        <link href="https://fonts.googleapis.com/css2?family=Jura:wght@300&display=swap" rel="stylesheet">     
        <link rel="stylesheet" href="error_style.css" />
    </head>
    <body>
        <header>
            <h3>
                <% out.print(getServletContext().getInitParameter("company")); %>
            </h3>            
        </header>
        <div class="container">
            <h1 class="error-message">
                Unauthorized: Please login.
            </h1>
            <form method="get" action="index.jsp">
                <button class="button" type="submit">Go to Login</button>
            </form>
        </div>
        <footer>
            <p>
                Made with <3 by: <% out.print(getServletContext().getInitParameter("company")); %>
                &nbsp;&nbsp;&nbsp;
                Reach us: <% out.print(getServletContext().getInitParameter("companyEmail")); %>
            </p>
            <p>
                © <% out.print(getServletContext().getInitParameter("copyrightYear")); %>
            </p>
        </footer>
    </body>
</html>
