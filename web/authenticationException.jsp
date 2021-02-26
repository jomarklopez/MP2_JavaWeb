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
        <title>Authentication exception</title>
    </head>
    <body>
        <h1><center><% out.print(getServletContext().getInitParameter("header")); %></center></h1>
        <form method="get" action="/ICS2609_MP2/index.html">
            <button class="button" type="submit">Back</button>
        </form>
        <h1>Invalid Username</h1>
        <h1><center><% out.print(getServletContext().getInitParameter("footer")); %></center></h1>
    </body>
</html>
