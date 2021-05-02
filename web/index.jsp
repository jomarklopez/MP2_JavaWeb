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
        </header>
        <div class="login-container">
            <form action="LoginServlet" method="post" autocomplete="off" class="form">
                <div class='control block-cube block-input'>
                    <input name='username' placeholder='Username' type='text'>
                    <div class='bg-top'>
                        <div class='bg-inner'></div>
                    </div>
                    <div class='bg-right'>
                        <div class='bg-inner'></div>
                    </div>
                    <div class='bg'>
                        <div class='bg-inner'></div>
                    </div>
                </div>
                <div class='control block-cube block-input'>
                    <input name='password' placeholder='Password' type='password'>
                    <div class='bg-top'>
                        <div class='bg-inner'></div>
                    </div>
                    <div class='bg-right'>
                        <div class='bg-inner'></div>
                    </div>
                    <div class='bg'>
                        <div class='bg-inner'></div>
                    </div>
                </div>
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
                      Log In
                    </div>
                </button>
            </form>
            <!-- The Modal -->
            <button id='mdlBtn' class='btn block-cube block-cube-hover' type='button' name="login">
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
            <div id="myModal" class="modal">
              <!-- Modal content -->
                <div class="modal-content">
                  <span class="close">&times;</span>
                  <h3>SIGN UP</h3>
                  <form id='signupForm' action="SignupServlet" method="post" autocomplete="off" class="form">
                    <input name='username' placeholder='Username' type='text'>
                    <input id='pw' name='password' placeholder='Password' type='password'>
                    <input id='pw2' name='passwordconfirm' placeholder='Retype Password' type='password'>
                    <div>
                        <img src="/CaptchaServlet"/>
                        <input id ='ans' name="answer" type="text" placeholder="Enter"/>
                    </div>
                    <button id='signupBtn' class='btn' onclick='validatePassword()' type='button' name="signup">
                          Sign Up
                    </button>
                </form>
                </div>
            </div>
        </div>
        <div class='stars'></div>
        <div class='stars2'></div>
        <% Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME); %>
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
            var modal = document.getElementById("myModal");

            // Get the button that opens the modal
            var btn = document.getElementById("mdlBtn");

            // Get the <span> element that closes the modal
            var span = document.getElementsByClassName("close")[0];

            // When the user clicks on the button, open the modal
            btn.onclick = function() {
              modal.style.display = "block";
            }

            // When the user clicks on <span> (x), close the modal
            span.onclick = function() {
              modal.style.display = "none";
            }

            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function(event) {
              if (event.target == modal) {
                modal.style.display = "none";
              }
            }
            
            function validatePassword() {
                const password = document.getElementById("pw").value
                const password2 = document.getElementById("pw2").value
                const answer = document.getElementById("ans").value
                
                if (password != password2) {
                    alert('Password do not match. Confirm your password again')
                } else {
                    signupForm.submit();
                }
                
            }
        </script>
    </body>
</html>