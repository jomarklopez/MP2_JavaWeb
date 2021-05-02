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
        <link href="https://fonts.googleapis.com/css2?family=Jura:wght@300&display=swap" rel="stylesheet">     
        <link rel="stylesheet" href="success_style.css" />
        <title>Welcome</title>
    </head>
    <body>
        <header>
            <h3>
                <% out.print(getServletContext().getInitParameter("company")); %>
            </h3>            
        </header>
        <div class="container">
            <h1 class="welcome-message">
            SIGN UP SUCCESSFUL
            </h1>
            <form method="get" action="LogoutServlet">
                <button class="button" type="submit">Click here to login</button>
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
