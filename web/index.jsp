<%@page import="nl.captcha.Captcha" %>
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
            <h1 class="header-title">Review.io</h1>
            <div class="content">
                <form action="login" method="post" autocomplete="off" class="form">
                    <div class="input-wrapper">
                        <input readonly onfocus="this.removeAttribute('readonly');" id="username" name="username" autocomplete="one-time-code" required>
                        <label>Username</label>
                    </div>
                    <div class="input-wrapper">
                        <input readonly onfocus="this.removeAttribute('readonly');" id="password" name="password" type="password" autocomplete="new-password" required>
                        <label>Password</label>
                    </div>
                    <button class='btn' type='submit' name="login">
                        <div class='text'>
                          Log In
                        </div>
                    </button>
                </form>
                <div class="signupMessage">Don't have an account yet?
                    <a id='signupBtn' name="captcha" onclick="window.location='signup.jsp'">
                        SIGNUP HERE
                    </a>
                </div>
                <img id="groupstudsimg2" src="students.png" alt="Group of Students">
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

        <style>
html,body {
            margin: 0;
            padding: 0;
            height: 100vh;
            width: 100vw;
        }
        
        body {
            background-color: #4ABDAC;
            
        }

        .sideheader {
            float: left;
            display: flex;
            flex-direction: column;
            width: 50vw;
            height: 100vh;
        }

        #wordartimg, #groupstudsimg {
            max-width: 75%;
            min-height: 10vh;
            align-self: center;
        }
        
        #groupstudsimg2 {
            max-width: 75%;
            min-height: 10vh;
            align-self: center;
            display: none;
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
            font-size: 1rem;
            width: 100%;
            color: black;
            margin-top: auto;
        }

        /*SIGN IN FORM*/

        .login-container {
            height: 100vh;
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
        }

        .form {
            width: 300px;
            display: inline-block;
        }

        .input-wrapper {
            position: relative;
        }

        .input-wrapper input {            
            font-family: 'Roboto', sans-serif;
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
          border-radius: 10px;
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
          
          .sideheader {
            float: left;
            display: none;
            flex-direction: column;
            width: 50vw;
            height: 100vh;
          }
          
          body {
            background-color: #FFFFFF;  
          }
          
          #groupstudsimg2 {
            max-width: 75%;
            min-height: 10vh;
            align-self: center;
            display: flex
         }
          
        }
        
        @media (max-width: 387px) {
           .header-title {
            font-family: 'Roboto', sans-serif;
            font-size: 20vw;
            margin-top: auto;
            cursor: default;
          } 
          
          .signupMessage {
            margin-top: 20px;
            font-size: 5vw;
           }
           
           .btn {
            border-radius: 4px;
            background-color: #FFC534;
            border: none;
            color: #FFFFFF;
            text-align: center;
            font-size: 5vw;
            padding: 10px;
            width: 150px;
            cursor: pointer;
            margin: 5px;
           }
           
           .input-wrapper input {            
            font-family: 'Roboto', sans-serif;
            width: 80vw;
            padding: 10px 0;
            font-size: 5vw;
            color: #000;
            margin-bottom: 30px;
            border: none;
            border-bottom: 1px solid #000;
            outline: none;
            background: transparent;
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
