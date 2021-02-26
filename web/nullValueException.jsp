
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Null Value Exception</title>
        <link rel="stylesheet" href="errorstyle.css" />
    </head>
    <body>
        <div><% out.print(getServletContext().getInitParameter("header")); %></div>
        <div class="container">
            
            <h1 class="error-message">
            <%if(null != request.getAttribute("errorMessage")) {
                out.println(request.getAttribute("errorMessage"));
            }%>
            </h1>
            <form method="get" action="/ICS2609_MP2">
                <button class="button" type="submit">Back</button>
            </form>
        </div>
        <h1><center><% out.print(getServletContext().getInitParameter("footer")); %></center></h1>
    </body>
</html>
