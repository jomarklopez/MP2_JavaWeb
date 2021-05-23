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
                <div class="signupMessage">SIGN UP SUCCESS
                    <form method="get" action="index.jsp">
                        <button class="btn" type="submit">Login</button>
                    </form>
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

    </style>
</html>
