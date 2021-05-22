<%@page import="nl.captcha.Captcha" %>
<!DOCTYPE html>

<html>
    <head>
        <title>Review.io</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;500&display=swap" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="header">
            <div></div>
            <h1 class="header-title">Review.io</h1>
            <div class="menu">
                <div class="title" onclick="f()"><i class="fas fa-user"></i> Account <span style="float:right;" class="fa fa-bars"></span>
                  <div class="arrow"></div>
                </div>
                <div class="dropdown">
                  <p><i class="fas fa-user-edit"></i> Profile</p>
                  <p><i class="fas fa-user-lock"></i> <a name="changePass" onclick="window.location='ChangeServlet'" value="cp">Change Password</a></p>
                  <p><i class="fas fa-sign-out-alt"></i> Sign Out</p>
                </div>
            </div>
        </div>
        <div class="background"></div>
        <div class="content">
            <div class="content-header">
                <p>My Reviewers: </p>
                <button id='mdlBtn' class='btn' type='submit' name="login">
                    <i class="fas fa-upload"></i>
                    Upload Reviewer
                </button>
            </div>
        </div>
        <div id="myModal" class="modal">
            <!-- Modal content -->
            <div class="modal-content">
                <span class="close">&times;</span>
                <form method="post" action="upload" enctype="multipart/form-data">
                    <div class="input-wrapper">
                        Title: 
                        <input class="form-input"type="text" name="title" size="10" required />
                    </div>
                    <div class="input-wrapper">
                        Subject: 
                        <input class="form-input"type="text" name="subject" size="10" required />
                    </div>
                    <div class="input-wrapper">
                        Language: 
                        <input class="form-input"type="text" name="language" size="10" required />
                    </div>
                    <div class="input-wrapper">
                        Description: 
                        <textarea id="desc-textArea" name="description" rows="10" cols="70"></textarea>
                    </div>
                    <div class="input-wrapper fileupload-btns">
                        <div>
                        Upload Preview Image:<br>
                        <input type="file" name="file_image" size="10" required/></div>
                        <div>
                        Upload PDF:<br>
                        <input type="file" name="file_data" size="10" required/></div>
                    </div>
                    <div class="form-actions">
                        <input class="btn" type="submit" value="Upload">
                        <input class="btn" type="reset" value="Clear" />
                    </div>
                </form>
            </div>
        </div>
    </body>
    
    <script>
        function f() {
            document.getElementsByClassName('dropdown')[0].classList.toggle('down');
            if (document.getElementsByClassName('dropdown')[0].classList.contains('down')) {
              document.getElementsByClassName('arrow')[0].classList.toggle('gone');
              setTimeout(function() {
                document.getElementsByClassName('dropdown')[0].style.overflow = 'visible'
              }, 500)
            } else {
              setTimeout(function() {
                document.getElementsByClassName('arrow')[0].classList.toggle('gone');
              }, 500)
              document.getElementsByClassName('dropdown')[0].style.overflow = 'hidden'
            }
        }
        
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
    </script>
    
    <style>
        html,body {
            margin: 0;
            padding: 0;
            height: 100%;
        }

        body {
            background-color: #FFFFFF;
        }
        

        .header {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            height: 100px;
            background-color: #FFFFFF;
            text-align: center;
            position: relative;
            z-index: 10;
            box-shadow: rgb(50 50 93 / 25%) 0px 13px 27px -5px, rgb(0 0 0 / 30%) 0px 8px 16px -8px;
            font-family: 'Roboto', sans-serif;
        }
        
        .header-title {
            font-family: 'Roboto', sans-serif;
            font-size: 4rem;
            margin: 0;
            cursor: default;
            font-weight: 100;    
            align-self: center;
        }

        .background {
            position:absolute;
            width:100%;
            height: 50vh;
            background-color: #4ABDAC;
        }
        
        .btn {
            border-radius: 4px;
            background-color: #FFC534;
            border: none;
            color: #FFFFFF;
            text-align: center;
            font-size: 20px;
            padding: 10px;
            width: 200px;
            height: 50px;
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
        
        .menu {
            width: 200px;
            cursor: pointer;
            justify-self: end;
            margin-top: 24px;
            margin-right: 30px;
            height: 76px;
        }
        
        .menu i {
            float: left;
        }
        
        .title {
            font-family: 'Roboto', sans-serif;
            width: 100%;
            box-sizing: border-box;
            background: #FC4A1A;
            padding: 14px;
            border-radius: 4px;
            position: relative;
            color: #FFFFFF;
        }
        
        
        .dropdown {
            width: 100%;
            background: #fff;
            border-radius: 4px;
            box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
            color: #505050;
            max-height: 0;
            overflow: hidden;
            transition: all 0.3s;
            margin-top: 24px;
        }
        
        .down {
            max-height: 150px;
        }
        
        .arrow {
            border-left: 10px solid transparent;
            border-right: 10px solid transparent;
            border-bottom: 10px solid #fff;
            position: absolute;
            right: 20px;
            bottom: -24px;
            display: none;
        }
        
        .arrow.gone {
            display: block;
        }
        
        p {
            font-family: 'Roboto', sans-serif;
            padding: 15px 14px;
            margin: 0;
        }
        
        .menu p:hover {
            color: white;
            background: coral;
            -webkit-transform: scale(1.02);
            box-shadow: 0 0 30px -10px #000;
        }

        .content {
            position: relative;
            height: 500px;
            width: 75vw;
            background-color: white;
            margin: 0 auto;
            margin-top: 30px;
            border-radius: 12px;
            padding: 20px;
            box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
        }
        
        .content-header {
            display: flex;
            flex-direction: row;
        }
        
        .content-header p {
            font-size: 1.5rem;
        }
        
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 100; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

          /* Modal Content/Box */
        .modal-content {
            display: flex;
            flex-direction: column;
            font-family: 'Roboto', sans-serif;
            font-weight: 100;
            border-radius: 12px;
            background-color: #fefefe;
            padding: 20px;
            border: 1px solid #888;
            position: absolute;
            width: 50%; /* Could be more or less, depending on screen size */
            left: 50%;
            top: 50%;
            -webkit-transform: translateX(-50%) translateY(-50%);
            transform: translateX(-50%) translateY(-50%);
        }

        /* The Close Button */
        .close {
            color: #aaa;
            font-size: 28px;
            font-weight: bold;
            align-self: flex-end;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
        
        .modal-content textarea {
            resize: none;
            width: 100%;
            font-family: 'Roboto', sans-serif;
            font-weight: 500;
        }
        
        .modal-content input {
            font-family: 'Roboto', sans-serif;
            font-weight: 500;
        }
        .modal-content .form-actions{
            text-align: end;
        }
        
        .input-wrapper {
            margin-bottom: 20px;
        }
        
        .fileupload-btns {
            display: flex;
            flex-direction: row;
        }
        
        .form-input {
            font-family: 'Roboto', sans-serif;
            width: 100%;
            padding: 5px 0;
            font-size: 16px;
            color: #000;
            border: none;
            border-bottom: 1px solid #000;
            outline: none;
            background: transparent;
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