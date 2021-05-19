<%@page import="nl.captcha.Captcha" %>
<!DOCTYPE html>

<html>
    <head>
        <title>Review.io</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
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
                    <h3>We've got plans for you!</h3>
                    <div class="plan-cards">
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
                            <a href="#" class="btn" onclick="roleFree()">Select</a>
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
                            <a href="#" class="btn" onclick="roleReview()">Select</a>
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
                            <a id="premium" value="premium" href="#" class="btn" onclick="rolePremium()">Select</a>
                          </div><!--/card-->



                    </div>
                    <form id='signupForm' action="SignupServlet" method="post" autocomplete="off" class="form">
                        <div class="input-wrapper">
                            <input id="us" placeholder="Username" name='username' required>
                        </div>
                        <div class="input-wrapper">
                            <input id="pw" placeholder="Password" name='password'required>
                        </div>
                        <div class="input-wrapper">
                            <input id="pw2" placeholder="Retype Password" required>
                        </div>
                        <div class="input-wrapper">
                            <input id="r" placeholder="Choose Role Above" name='role' readOnly>
                        </div>
                        <img id="captcha" src="/2CSB_MP3_Lacsamana_Lopez_Polloso/CaptchaServlet"/>
                        <div class="input-wrapper">
                            <input id='answer' placeholder="Captcha" name="answer" required>
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

        const prem = "Premium"
        const free = "Free"
        const review = "Review+"
        
        function validatePassword() {
            const password = document.getElementById("pw").value
            const password2 = document.getElementById("pw2").value
            const username  = document.getElementById("us").value
            const role  = document.getElementById("r").value
            
            if(role != prem && role != free && role != review) {
                alert('Please choose a membership plan')
            } else if (password != password2) {
                alert('Password do not match. Confirm your password again')
            } else {
                signupForm.submit();
            }
        }
        
        function rolePremium() {
            document.getElementById("r").value = prem
        }
        
        function roleReview() {
            document.getElementById("r").value = review
        }
        
        function roleFree() {
            document.getElementById("r").value = free
        }
    </script>
        <style>
            html,body {
        margin: 0;
        padding: 0;
        height: 100%;
        }

        body {
            display: flex;
            background-color: #FFFFFF;
        }

        .sideheader {
            display: flex;
            flex-direction: column;
            width: 50vw;
            background-color: #4ABDAC;
        }

        #wordartimg, #groupstudsimg {
            max-width: 75%;
            height: auto;
            align-self: center;
        }

        #wordartimg {
            margin-bottom: auto;
        }

        .header-title {
            font-family: 'Roboto', sans-serif;
            font-size: 6rem;
            margin-top: auto;
            cursor: default;
        }

        a {
          color: blue;
          text-decoration: none; /* no underline */
        }

        footer {
            font-family: 'Roboto', sans-serif;
            width: 100%;
            color: black;
            margin-top: auto;
        }

        /*SIGN IN FORM*/

        .login-container {
            height: 100%;
            align-self: center;
            font-family: 'Roboto', sans-serif;
            font-size: 20px;
            text-align: center;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .form {
            width: 300px;
            display: inline-block;
        }

        .input-wrapper {
            position: relative;
        }

        .input-wrapper input {
            width: 100%;
            padding: 10px 0;
            font-size: 16px;
            color: #000;
            margin-bottom: 30px;
            border: none;
            border-bottom: 1px solid #000;
            outline: none;
            background: transparent;
        }

        .input-wrapper label {
            position: absolute;
            top: 0;
            left: 0;
            padding: 10px 0;
            font-size: 16px;
            color: #000;
            pointer-events: none;
            transition: .25s;
        }

        .input-wrapper input:focus ~ label,
        .input-wrapper input:valid ~ label {
            top: -20px;
            left: 0;
            color: #000;
            font-size: 12px;
        }

        .form .control input:hover, .form .control input:focus {
            outline: none;
            border: 0;
        }

        .btn {
            border-radius: 4px;
            background-color: #FFC534;
            border: none;
            color: #FFFFFF;
            text-align: center;
            font-size: 20px;
            padding: 10px;
            width: 150px;
            cursor: pointer;
            margin: 5px;
        }

        .btn span {
            cursor: pointer;
            display: inline-block;
            position: relative;
            transition: 0.5s;
        }

        .btn span:after {
            content: '\00bb';
            position: absolute;
            opacity: 0;
            top: 0;
            right: -20px;
            transition: 0.5s;
        }

        .btn:hover span {
            padding-right: 25px;
        }

        .btn:hover span:after {
            opacity: 1;
            right: 0;
        }
        .signupMessage {
            margin-top: 20px;
            font-size: 1rem;
        }
        #signupBtn {
            color: #FC4A1A;
            cursor: pointer;
        }

        .formInput {
            padding: 12px 20px;
            font-size: 1rem;
            border-width: 1px;
            border-radius: 3px;
            outline: transparent;
        }

        /* The Modal (background) */
        .modal {
          display: none; 
          position: fixed; 
          z-index: 1; 
          left: 0;
          top: 0;
          width: 100%; 
          height: 100%; 
          overflow: auto; 
          background-color: rgb(0,0,0); 
          background-color: rgba(0,0,0,0.4);
        }

        /* Modal Content/Box */
        .modal-content {
          background-color: #fefefe;
          margin: 0 auto; 
          position: relative;
          top: 50%;
          transform: translateY(-50%);
          padding: 20px;
          border: 1px solid #888;
          max-width: 60%; 
        }

        .content {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        #signupForm {
            width: 100%; 
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        #signupForm input { 
            width: 50vw;
            font-family: 'Roboto', sans-serif;
            font-size: 1rem; 
        }

        #signupForm img {
            display: table-cell;
        }

        /* CARDS */
        .plan-cards {
            width: 100%;
            display: flex;
            justify-content: center;
        }

        .content h3 {
            font-family: 'Roboto', sans-serif;    
            font-size: 3rem;
            margin: 0;
        }

        .card {
          background: #FFFFFF;
          box-shadow: 0 0 20px rgba(0, 0, 0, 0.4);
          border-radius: 5px;
          margin: 50px 20px 20px 20px;
          width: 200px;
          padding: 20px;
          text-align: center;
          color: black;
          float: left;
          font-family: 'Roboto', sans-serif;
        }
        @media (max-width: 768px) {
           .modal-content {
            background-color: #fefefe;
            margin: 0 auto; 
            position: relative;
            top: 50%;
            transform: translateY(-50%);
            padding: 20px;
            border: 1px solid #888;
            max-width: 75%; 
          }

          .card {
            margin: 10px 20px;
            width: calc(100% - 40px);
          }
        }

        .card .title {
          font-size: 25px;
        }
        .card .icon {
          margin: 10px 0;
        }
        .card .icon svg {
          width: 100px;
          height: 100px;
        }
        .card .icon svg path {
          fill: #4ABDAC;
        }
        .card .features ul {
          padding: 0;
          margin: 20px 0 50px 0;
          list-style-type: none;
        }
        .card .features ul li {
          margin: 10px 0;
          font-size: 14px;
        }
        .card .features ul li span {

        }
        .card .btn {
          display: block;
          background: #4ABDAC;
          color: white;
          border-radius: 5px;
          box-shadow: rgba(0, 0, 0, 0.9);
          transition: all 100ms ease-in-out;
          text-decoration: none;
        }
        .card .btn:hover {
          background: #278e7f;
        }

        /* The Close Button */
        .close {
          color: #aaa;
          font-size: 28px;
          font-weight: bold;
        }

        .close:hover,
        .close:focus {
          color: black;
          text-decoration: none;
          cursor: pointer;
        }
    </style>
</html>