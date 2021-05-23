<%@page import="nl.captcha.Captcha"%>
<%@page import="nl.captcha.Captcha"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Review.io</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">        
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">        
    </head>
        <body>
        <div class="sideheader">
            <img id="wordartimg" src="wordart.png" alt="Languages Word Art">
            <img id="groupstudsimg" src="students.png" alt="Group of Students">
        </div>
        <div class="login-container">
            <div class="content">
                <div class="plan-cards">
                    <div class="card">
                        <div class="title">Free</div>
                        <div class="icon">
                          <svg enable-background="new 0 0 512 512" height="512px" id="Layer_1" version="1.1" viewBox="0 0 512 512" width="512px" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><path d="M468.493,101.637L371.955,5.098H159.57v77.231H43.724v424.769h308.923v-77.231h115.846V101.637z   M371.955,32.401l69.236,69.235h-69.236V32.401z M63.031,487.79V101.637h173.769v96.538h96.538V487.79H63.031z M256.108,109.632  l69.236,69.235h-69.236V109.632z M352.647,410.56V178.867l-96.538-96.538h-77.231V24.406h173.769v96.538h96.538V410.56H352.647z" fill="#37404D"/></svg>
                        </div>
                        <div class="features">
                          <ul>
                            <li><span>With</span> Ads</li>
                            <li><span>Free</span> Downloads</li>
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
                            <li><span>NO</span> Ads </li>
                            <li><span>100MB</span> Cloud Storage </li>
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
                          <li><span>NO</span> Ads</li>
                          <li><span>1GB</span> Cloud Storage </li>
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
                        <input id="pw" type="password" placeholder="Password" name='password'required>
                    </div>
                    <div class="input-wrapper">
                        <input id="pw2" type="password" placeholder="Retype Password" required>
                    </div>
                    <div class="input-wrapper">
                        <input id="r" placeholder="Choose Role Above" name='role' readOnly>
                    </div>
                    <img id="captcha" src="${pageContext.request.contextPath}/Captcha"/>
                    <div class="input-wrapper">
                        <input id='answer' placeholder="Captcha" name="answer" required>
                    </div>
                </form>
                    <div>
                        Clicking the signup button means you accept our
                        <form id="getTNCForm" method="get" action="TermsAndConditions" target="_blank">
                            <a id="signupBtn" onclick="getTNC()" target="_blank">Terms and Conditions</a>
                        </form>
                    </div>    
                    <button class='btn' type='button' name="login" onclick="validatePassword()">
                        <div class='text'>
                            Sign Up
                        </div>
                    </button>
                <div>
                    Want to be an author instead? 
                    <a id="signupBtn" value="author" onclick="roleAuthor()">Become an Author</a>
                </div>
                    
                <div class="signupMessage">Already have an account?
                    <a id='signupBtn' onclick="window.location='index.jsp'">
                        Login Here
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
    </body>
    <script>
        
        var signupForm = document.getElementById("signupForm");
        const free = "Free";
        const review = "Review+";
        const prem = "Premium";
        const auth = "Author";
        
        function validatePassword() {
            const password = document.getElementById("pw").value;
            const password2 = document.getElementById("pw2").value;
            const username  = document.getElementById("us").value;
            const role  = document.getElementById("r").value;
            
            if(role !== prem && role !== free && role !== review && role !== auth) {
                alert('Please choose a membership plan');
            } else if (password !== password2) {
                alert('Password do not match. Confirm your password again');
            } else {
                signupForm.submit();
            }
        }
        
        function roleAuthor() {
            document.getElementById("r").value = auth;
        }
        
        function rolePremium() {
            document.getElementById("r").value = prem;
        }
        
        function roleReview() {
            document.getElementById("r").value = review;
        }
        
        function roleFree() {
            document.getElementById("r").value = free;
        }
        
        function getTNC() {
            document.getElementById("getTNCForm").submit();
        }
    </script>
    <style>
        
        
        html,body {
            margin: 0;
            padding: 0;
            height: 100vh;
            width: 100vw;
        }
        
        body {
            background-color: #FFFFFF;
        }

        .sideheader {
            float: left;
            display: flex;
            flex-direction: column;
            width: 50vw;
            height: 100vh;
            background-color: #4ABDAC;
        }

        #wordartimg, #groupstudsimg {
            max-width: 75%;
            min-height: 10vh;
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
            font-size: 1vw;
            width: 100%;
            color: black;
            margin-top: auto;
        }

        /*SIGN IN FORM*/

        .login-container {
            background-color: #FFFFFF;
            align-self: center;
            font-family: 'Roboto', sans-serif;
            font-size: 20px;
            text-align: center;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            overflow: auto;
        }

        .form {
            width: 300px;
            display: inline-block;
        }

        .input-wrapper {
            width: 100%;
            position: relative;
        }

        .input-wrapper input {
            width: 100%;
            padding: 10px 0;
            font-size: 16px;
            color: #000;
            margin-bottom: 10px;
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
            padding: 10px;
            width: 15vw;
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

        .content {
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: auto;
        }

        #signupForm {
            width: 100%; 
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        #signupForm input { 
            width: 45vw;
            font-family: 'Roboto', sans-serif;
            font-size: 1rem; 
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
            box-shadow: rgba(99, 99, 99, 0.2) 0px 2px 8px 0px;
            border-radius: 10px;
            margin: 20px;
            padding: 20px;
            text-align: center;
            align-content: center;
            color: black;
            float: left;
            font-family: 'Roboto', sans-serif;
        }
        
        @media (max-width: 768px) {
            .sideheader {
                display: none;
            }
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
            width: 30%;
            height: 40%;
          }
        }

        .card .title {
          font-size: 2vw;
        }
        .card .icon {
          margin: 10px 0;
        }
        .card .icon svg {
          width: 8vw;
          height: 8vw;
        }
        .card .icon svg path {
          fill: #4ABDAC;
        }
        .card .features ul {
          padding: 0;
          margin: 1vw 0 1vw 0;
          list-style-type: none;
        }
        .card .features ul li {
          margin: 10px 0;
          font-size: 1vw;
        }
        .card .features ul li span {

        }
        .card .btn {
          margin: 0 auto;
          width: 8vw;
          height: 2vw;
          display: block;
          background: #4ABDAC;
          color: white;
          border-radius: 5px;
          font-size: 1.5vw;
          box-shadow: rgba(0, 0, 0, 0.9);
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
        
        .text {
            font-size: 2vw;
        }
    </style>
</html>
