<%-- 
    Document   : message
    Created on : 05 21, 21, 1:39:00 PM
    Author     : jomarklopez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Success massage</title>
    <link
     href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
     rel="stylesheet"
     integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
     crossorigin="anonymous">
    </head>
    <body>
     <center>
      <div class="alert alert-success">
       <strong><%=request.getAttribute("Message")%></strong>
      </div>
     </center>
    </body>
</html>