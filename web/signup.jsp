<%@page import="nl.captcha.Captcha"%>
<%@page import="nl.captcha.Captcha"%>
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
            <h2>Project: LIBRA</h2>
            <% 
            Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
            request.setCharacterEncoding("UTF-8"); 
            String answer = request.getParameter("answer");
            if (captcha.isCorrect(answer)) { %>
            <div class="login-container">
                <form id='signupForm' action="SignupServlet" method="post" autocomplete="off" class="form">
                  <input id='us' name='username' placeholder='Username' type='text'>
                  <input id='pw' name='password' placeholder='Password' type='password'>
                  <input id='pw2' name='passwordconfirm' placeholder='Retype Password' type='password'>
                  <input id='role' name='role' placeholder='Role' type='role'>
                </form>
                <button id='mdlBtn' class='btn block-cube block-cube-hover' type='button' name="signup" onclick="validatePassword()">
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
                      Sign Up
                    </div>
                </button>
            </div>
            <% } else { %>
            <h2>Captcha entered is wrong</h2>
            <button id='mdlBtn' onclick="history.back()" class='btn block-cube block-cube-hover' type='submit' name="login">
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
                      Go back to Captcha
                    </div>
            </button>
           <% }%>
        </header>
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
        <script>
            // Get the modal
            var signupForm = document.getElementById("signupForm");

            
            function validatePassword() {
                const password = document.getElementById("pw").value
                const password2 = document.getElementById("pw2").value
                const username  = document.getElementById("us").value
                if (password != password2) {
                    alert('Password do not match. Confirm your password again')
                } else {
                    signupForm.submit();
                }
            }
        </script>
    </body>
</html>