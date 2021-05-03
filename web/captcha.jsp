<%-- 
    Document   : captcha
    Created on : 05 2, 21, 2:58:06 PM
    Author     : Patrick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="nl.captcha.Captcha" %>
<!DOCTYPE html>
<html>
        <head>
        <title>Libra Web App</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Jura:wght@300&display=swap" rel="stylesheet">     
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="style.css" />
    </head>
    <body>
        <header>
            <h3>
                <% out.print(getServletContext().getInitParameter("company")); %>
            </h3>            
                <div class="libra-container">
                <div class='star libra-star-1'></div>
                <div class='star libra-star-2'></div>
                <div class='star libra-star-3'></div>
                <div class='star libra-star-4'></div>
                <div class='star libra-star-5'></div>
                <div class='star libra-star-6'></div>
                <div class='star libra-star-7'></div>
                <div class="line libra-line-1"></div>
                <div class="line libra-line-2"></div>
                <div class="line libra-line-3"></div>
                <div class="line libra-line-4"></div>
                <div class="line libra-line-5"></div>
                <div class="line libra-line-6"></div>
                <div class="line libra-line-7"></div>
            </div>
            <h2>Enter Captcha</h2>
        </header>
        <form action="signup.jsp" method="post" autocomplete="off" class="form">
            <img id="captcha" src="/MP2_JavaWeb/Captcha" width="250"/>
            <br><input id='answer' type="text" name="answer" /><br><br><br>
            <button class='btn block-cube block-cube-hover' type='submit' name="login">
                <div class='bg-top'>
                    <div class='bg-inner'></div>
                </div>
                <div class='bg-right'>
                    <div class='bg-inner'></div>
                </div>
                <div class='bg'>
                    <div class='bg-inner'></div>
                </div>
                <div class='text'>
                  Enter
                </div>
            </button>
            
        </form>
        <div class='stars'></div>
        <div class='stars2'></div>
        <footer>
            <p>
                Made with ❤ by: <% out.print(getServletContext().getInitParameter("company")); %>
                &nbsp;&nbsp;&nbsp;
                Reach us: <% out.print(getServletContext().getInitParameter("companyEmail")); %>
            </p>
            <p>
                © <% out.print(getServletContext().getInitParameter("copyrightYear")); %>
            </p>
        </footer>
    </body>
</html>