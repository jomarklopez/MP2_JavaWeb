<%-- 
    Document   : error_2
    Created on : 02 26, 21, 3:26:05 PM
    Author     : Patrick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>500</title>
        <link rel="stylesheet" href="errorstyle.css" />
    </head>
    <body>
        <h1><center><% out.print(getServletContext().getInitParameter("header")); %></center></h1>
        <h1>ERROR 500</h1>
        <h1><center><% out.print(getServletContext().getInitParameter("footer")); %></center></h1>
    </body>
</html>
