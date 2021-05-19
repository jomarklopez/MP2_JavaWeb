<%@page import="nl.captcha.Captcha" %>
<!DOCTYPE html>

<html>
    <head>
        <title>Review.io</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="style.css" />
    </head>
    <body>
        <div class="sideheader">
            <img id="wordartimg" src="wordart.png" alt="Languages Word Art">
            <img id="groupstudsimg" src="students.png" alt="Group of Students">
        </div>
        <div class="login-container">
            <h1 class="header-title">Review.io</h1>
            <div class="content">
                <form action="LoginServlet" method="post" autocomplete="off" class="form">
                    <div class="input-wrapper">
                        <input readonly onfocus="this.removeAttribute('readonly');" id="user" autocomplete="one-time-code" required>
                        <label>Username</label>
                    </div>
                    <div class="input-wrapper">
                        <input readonly onfocus="this.removeAttribute('readonly');" id="pass" type="password" autocomplete="new-password" required>
                        <label>Password</label>
                    </div>
                    <button class='btn' type='submit' name="login">
                        <div class='text'>
                          Log In
                        </div>
                    </button>
                </form>
                <div class="signupMessage">Don't have an account yet?
                <a id='signupBtn' name="captcha">
                    SIGNUP HERE
                </a>
                </div>
            </div>
            <footer>
                <p>
                    © <% out.print(getServletContext().getInitParameter("copyrightYear")); %>
                    Made with <3 by: <% out.print(getServletContext().getInitParameter("company")); %>
                    &nbsp;&nbsp;&nbsp;
                    Reach us: <% out.print(getServletContext().getInitParameter("companyEmail")); %>
                </p>
            </footer>
        </div>
            <!-- The Modal -->
            <div id="myModal" class="modal">
              <!-- Modal content -->
              <div class="modal-content">
                <span class="close">&times;</span>
                <div class="content">
                    <div class="plan-cards">
                        <h3>We've got plans for you!</h3>
                        <div class="card">
                            <div class="title">Free</div>
                            <div class="icon">
                              <svg enable-background="new 0 0 512 512" height="512px" id="Layer_1" version="1.1" viewBox="0 0 512 512" width="512px" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><path d="M468.493,101.637L371.955,5.098H159.57v77.231H43.724v424.769h308.923v-77.231h115.846V101.637z   M371.955,32.401l69.236,69.235h-69.236V32.401z M63.031,487.79V101.637h173.769v96.538h96.538V487.79H63.031z M256.108,109.632  l69.236,69.235h-69.236V109.632z M352.647,410.56V178.867l-96.538-96.538h-77.231V24.406h173.769v96.538h96.538V410.56H352.647z" fill="#37404D"/></svg>
                            </div>
                            <div class="features">
                              <ul>
                                <li><span>5</span> Edits</li>
                                <li><span>1GB</span> Storage</li>
                                <li><span>3</span> Pages</li>
                                <li><span>1</span> Hour free support</li>
                              </ul>
                            </div>
                            <a href="#" class="btn">Check it out</a>
                          </div>
                          <div class="card">
                            <div class="title">Review+</div>
                            <div class="icon">
                              <svg enable-background="new 0 0 512 512" height="512px" id="Layer_1" version="1.1" viewBox="0 0 512 512" width="512px" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><path d="M285.928,113.067c62.492,0,113.327,50.827,113.327,113.327c0,0.344-0.041,0.705-0.066,1.049  c-0.049,0.836-0.107,1.672-0.123,2.525l-0.426,17.133l17.159,0.065c41.53,0.115,75.313,34.005,75.313,75.535  c0,41.415-33.718,75.305-75.157,75.518l-3.664,0.016H104.977c-46.244-0.049-83.872-37.693-83.872-83.929  c0-35.825,22.806-67.714,56.737-79.356l9.444-3.229l1.664-9.838c4.115-24.282,24.97-41.907,49.588-41.907  c7.846,0,15.428,1.82,22.536,5.394l15.306,7.689l7.386-15.444C202.531,138.398,242.635,113.067,285.928,113.067 M285.928,96.277  c-51.778,0-96.358,30.315-117.303,74.092c-9.059-4.558-19.256-7.182-30.086-7.182c-33.233,0-60.762,24.184-66.14,55.893  C32.82,232.657,4.316,270.104,4.316,314.307c0,55.597,45.063,100.669,100.644,100.718h311.084v-0.016  c50.777-0.263,91.856-41.481,91.856-92.308c0-50.909-41.177-92.177-92.053-92.324c0.033-1.344,0.197-2.639,0.197-3.984  C416.044,154.532,357.79,96.277,285.928,96.277L285.928,96.277z" fill="#37404D"/></svg>
                            </div>
                            <div class="features">
                              <ul>
                                <li><span>10</span> Edits</li>
                                <li><span>10GB</span> Storage</li>
                                <li><span>9</span> Pages</li>
                                <li><span>5</span> Hour free support</li>
                              </ul>
                            </div>
                            <a href="#" class="btn">Check it out</a>
                          </div>
                          <div class="card">
                            <div class="title">Premium</div>
                            <div class="icon">
                              <svg enable-background="new 0 0 512 512" height="512px" id="Layer_1" version="1.1" viewBox="0 0 512 512" width="512px" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><path d="M316.01,199.02L256.134,14.817L196.239,199.02H1.134l158.102,113.324L98.53,496.487l157.604-114.232  l157.585,114.232l-60.687-184.143L511.134,199.02H316.01z M335.084,318.257l42.407,128.63L267.22,366.963l-11.086-8.033  l-11.086,8.033l-110.291,79.923l42.408-128.63l4.353-13.18l-11.289-8.08L59.903,217.909h136.336h13.724l4.242-13.051l41.929-128.957  l41.91,128.957l4.242,13.051h13.724h136.336l-110.327,79.088l-11.27,8.08L335.084,318.257z" fill="#37404D"/></svg>
                            </div>
                            <div class="features">
                              <ul>
                                <li><span>Unlimited</span> Edits</li>
                                <li><span>20GB</span> Storage</li>
                                <li><span>unlimited</span> Pages</li>
                                <li><span>Unlimited</span> free support</li>
                              </ul>
                            </div><!--/features-->
                            <a href="#" class="btn">Check it out</a>
                          </div><!--/card-->



                    </div>
                    <form id='signupForm' action="SignupServlet" method="post" autocomplete="off" class="form">
                        <div>
                            <label>Username</label>
                            <input class="formInput" id='us' name='username' type='text'>
                        </div>
                        <div>
                            <label>Password</label>
                            <input class="formInput" id='pw' name='password' type='password'>
                        </div>
                        <div>
                            <label>Confirm Password</label>
                            <input class="formInput" id='pw2' name='passwordconfirm' type='password'>
                        </div>
                        <div>
                            <label></label>
                            <img id="captcha" src="/ICS2609_MP2/Captcha"/>
                        </div>
                        <div>
                            <label>Captcha</label>
                            <input id='answer' class="formInput" type="text" name="answer">
                        </div>
                        <button class='btn' type='button' name="login" onclick="validatePassword()">
                            <div class='text'>
                                Sign Up
                            </div>
                        </button>
                     </form>
                </div>
              </div>
            </div>
    </body>
    <script>
        // Get the modal onclick="window.location='captcha.jsp'" 
        var modal = document.getElementById("myModal");

        // Get the button that opens the modal
        var btn = document.getElementById("signupBtn");

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
</html>